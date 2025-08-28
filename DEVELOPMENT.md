# 🛠️ Development Guide

This guide provides detailed information for developers who want to contribute to or customize the MERN Social Media App.

## 🏃‍♂️ Quick Development Start

1. **Clone and Start**:
   ```bash
   git clone <repository-url>
   cd mern-social-media
   ./start.sh    # Linux/Mac
   ./start.bat   # Windows
   ```

2. **Access Services**:
   - Frontend: http://localhost:3000 (auto-reloads on changes)
   - Backend: http://localhost:8080 (restart container for changes)
   - Database: localhost:27017

## 🏗️ Architecture Overview

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React App     │────│  Express API    │────│    MongoDB      │
│   (Port 3000)   │    │   (Port 8080)   │    │   (Port 27017)  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │
         └───────────────────────┘
              Image Uploads
              (Built-in Service)
```

## 📁 Project Structure

```
mern-social-media/
├── 📱 client/                  # React Frontend
│   ├── src/
│   │   ├── components/         # Reusable components
│   │   ├── pages/             # Page components
│   │   ├── redux/             # State management
│   │   ├── utils/             # Helper functions
│   │   └── styles/            # CSS files
│   └── Dockerfile
├── 🔧 server.js               # Express server entry point
├── 📂 routes/                 # API route definitions
├── 🗄️ models/                # MongoDB schemas
├── 🛡️ middleware/             # Express middleware
├── 🎛️ controllers/           # Route handlers
├── 🐳 docker-compose.yml     # Main Docker config
├── 🐳 Dockerfile             # Backend container
└── 📋 package.json           # Backend dependencies
```

## 🔧 Development Workflow

### Making Changes

**Frontend Changes (Hot Reload)**:
- Edit files in `client/src/`
- Changes auto-refresh in browser
- No container restart needed

**Backend Changes**:
- Edit files in root, `routes/`, `models/`, etc.
- Restart backend: `docker-compose restart backend`
- Or use nodemon: `docker-compose exec backend npm run dev`

**Database Changes**:
- Models are in `models/` directory
- Use MongoDB Compass: `mongodb://localhost:27017`

### Adding Dependencies

**Frontend**:
```bash
docker-compose exec frontend npm install <package>
# or edit client/package.json and rebuild
```

**Backend**:
```bash
docker-compose exec backend npm install <package>
# or edit package.json and rebuild
```

## 🗃️ Database Schema

### User Model
```javascript
{
  _id: ObjectId,
  username: String (unique),
  email: String (unique),
  password: String (encrypted),
  fullname: String,
  avatar: String (image URL),
  role: String (admin/user),
  followers: [ObjectId],
  following: [ObjectId],
  saved: [ObjectId],
  createdAt: Date
}
```

### Post Model
```javascript
{
  _id: ObjectId,
  content: String,
  images: [String],
  likes: [ObjectId],
  comments: [ObjectId],
  user: ObjectId (ref: User),
  reports: [ObjectId],
  createdAt: Date
}
```

## 🔌 API Endpoints

### Authentication
- `POST /api/register` - User registration
- `POST /api/login` - User login
- `POST /api/logout` - User logout
- `POST /api/refresh_token` - Refresh JWT token

### Posts
- `GET /api/posts` - Get all posts
- `POST /api/posts` - Create new post
- `PATCH /api/post/:id` - Update post
- `DELETE /api/post/:id` - Delete post
- `PATCH /api/post/:id/like` - Like/unlike post

### Users
- `GET /api/search` - Search users
- `GET /api/user/:id` - Get user profile
- `PATCH /api/user` - Update profile
- `PATCH /api/user/:id/follow` - Follow/unfollow user

### Image Upload
- `POST /v1_1/:cloud_name/image/upload` - Upload image (mock Cloudinary)
- `GET /uploads/:filename` - Serve uploaded images

## 🧪 Testing

### Manual Testing
1. **Start the app**: `./start.sh`
2. **Register a user**: http://localhost:3000
3. **Create posts**: Add text and images
4. **Test interactions**: Like, comment, follow
5. **Admin features**: Register admin user

### API Testing
```bash
# Test backend directly
curl http://localhost:8080/api/posts

# Test image upload
curl -F "file=@image.jpg" http://localhost:8080/v1_1/test/image/upload
```

## 🚀 Production Deployment

### Environment Variables
Set these for production:
```env
NODE_ENV=production
MONGODB_URL=mongodb://your-production-db
ACCESS_TOKEN_SECRET=your-strong-secret
REFRESH_TOKEN_SECRET=your-strong-refresh-secret
PORT=8080
```

### Docker Production Build
```bash
# Use production compose file
docker-compose -f docker-compose.prod.yml up --build

# Or build specific images
docker build -t social-media-backend .
docker build -t social-media-frontend ./client
```

### Cloud Deployment
The app can be deployed to:
- **AWS**: ECS, Fargate, EC2
- **Google Cloud**: Cloud Run, GKE
- **Azure**: Container Instances, AKS
- **DigitalOcean**: App Platform
- **Railway**: Direct Docker deployment
- **Render**: Docker deployment

## 🐛 Common Issues

### Port Already in Use
```bash
# Check what's using ports
netstat -tulpn | grep :3000
netstat -tulpn | grep :8080
netstat -tulpn | grep :27017

# Kill processes or change ports in docker-compose.yml
```

### Database Connection Issues
```bash
# Check MongoDB logs
docker-compose logs mongodb

# Reset database
docker-compose down -v
docker-compose up --build
```

### Image Upload Not Working
```bash
# Check uploads directory
ls -la uploads/

# Check backend logs
docker-compose logs backend | grep -i upload
```

## 🎨 Customization

### Styling
- Main styles: `client/src/styles/`
- Component styles: Inline or CSS modules
- Dark mode: Already implemented

### Features
- Add new pages: `client/src/pages/`
- Add API routes: `routes/`
- Add database models: `models/`
- Add middleware: `middleware/`

### Configuration
- Frontend config: `client/src/utils/config.js`
- Backend config: Environment variables
- Database config: `server.js`

## 📚 Resources

- [React Documentation](https://reactjs.org/docs)
- [Express.js Guide](https://expressjs.com/en/guide/routing.html)
- [MongoDB Manual](https://docs.mongodb.com/manual/)
- [Docker Documentation](https://docs.docker.com/)

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/name`
3. Make changes and test: `docker-compose up --build`
4. Commit: `git commit -m 'Add feature'`
5. Push: `git push origin feature/name`
6. Create Pull Request

## 📞 Support

- Open an issue for bugs
- Check existing issues first
- Provide logs and error messages
- Include steps to reproduce

Happy coding! 🚀
