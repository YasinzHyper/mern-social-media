const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const router = express.Router();

// Create uploads directory if it doesn't exist
const uploadDir = './uploads';
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Configure multer for file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadDir);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const extension = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + extension);
  }
});

const upload = multer({ 
  storage: storage,
  fileFilter: (req, file, cb) => {
    // Check file type
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png' || file.mimetype === 'image/jpg') {
      cb(null, true);
    } else {
      cb(new Error('Only JPEG and PNG files are allowed!'), false);
    }
  },
  limits: {
    fileSize: 1024 * 1024 // 1MB limit
  }
});

// Mock Cloudinary upload endpoint
router.post('/v1_1/:cloud_name/image/upload', upload.single('file'), (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No file uploaded' });
    }

    const imageUrl = `http://localhost:8080/uploads/${req.file.filename}`;
    const publicId = req.file.filename.split('.')[0];

    res.json({
      public_id: publicId,
      secure_url: imageUrl,
      url: imageUrl,
      width: 800, // Mock dimensions
      height: 600,
      format: path.extname(req.file.filename).slice(1),
      resource_type: 'image',
      created_at: new Date().toISOString(),
      bytes: req.file.size
    });
  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ error: 'Upload failed' });
  }
});

module.exports = router;
