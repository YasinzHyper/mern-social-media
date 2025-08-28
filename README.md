# 🌟 MERN Social Media App

A complete, fully-featured social media application built with the MERN stack (MongoDB, Express, React, Node.js). Features user authentication, posts, comments, real-time notifications, admin panel, and more!

![Preview](https://user-images.githubusercontent.com/72184791/114161305-88180200-9945-11eb-9856-a4b33b8e9def.JPG)

## 🚀 Quick Start (Docker - Recommended)

Get the entire application running with **one command**! No need to install MongoDB, set up Cloudinary, or manage dependencies manually.

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running

### Launch the App

**Option 1: Use the startup script (Recommended)**
```bash
# Windows
./start.bat

# Linux/macOS (or Windows with Git Bash/WSL)
./start.sh
```

**Option 2: Manual Docker Compose**
```bash
docker-compose up --build
```

### Access Your Application
- 🌐 **Frontend**: http://localhost:3000
- 🔧 **Backend API**: http://localhost:8080
- 🗄️ **Database**: localhost:27017 (if needed)

## ✨ Features

### 👥 User Features
- ✅ User registration and authentication
- ✅ Create, edit, and delete posts with images
- ✅ Like, comment, and reply to posts
- ✅ Follow/unfollow users
- ✅ Real-time notifications
- ✅ Search users by username
- ✅ Save posts to collections
- ✅ Dark mode toggle
- ✅ Responsive design
- ✅ Profile customization
- ✅ Password encryption with salt

### 👨‍💼 Admin Features
- ✅ Admin dashboard with statistics
- ✅ User management
- ✅ Content moderation
- ✅ Spam post detection and removal
- ✅ Create additional admin accounts

### 🛠️ Technical Features
- ✅ **Fully Dockerized** - No external dependencies required
- ✅ **Built-in Image Upload** - No Cloudinary account needed
- ✅ **Hot Reload** - Development changes reflect instantly
- ✅ **Persistent Data** - Database survives container restarts
- ✅ **Production Ready** - Deploy anywhere Docker runs

## 🏗️ What's Included in Docker Setup

The Docker configuration provides:

- **MongoDB** - Containerized database (port 27017)
- **Backend API** - Node.js/Express server (port 8080) 
- **Frontend** - React development server (port 3000)
- **Image Upload Service** - Built-in mock Cloudinary replacement
- **Data Persistence** - Your data survives container restarts

## 🔧 Development

### File Structure
```
├── Dockerfile                   # Backend container config
├── docker-compose.yml          # Main orchestration
├── client/
│   ├── Dockerfile              # Frontend container config
│   └── src/                    # React application
├── server.js                   # Express server
├── routes/                     # API routes
├── models/                     # MongoDB models
└── uploads/                    # Image storage
```

### Development Commands
```bash
# Start in development mode
docker-compose up --build

# View logs
docker-compose logs -f [service-name]

# Stop services
docker-compose down

# Restart a service
docker-compose restart [service-name]

# Reset everything (including data)
docker-compose down -v
docker-compose up --build
```

## 🎯 Traditional Setup (Without Docker)

If you prefer to run without Docker:

### Prerequisites
- Node.js (v14+)
- MongoDB (local or Atlas)
- NPM

### Backend Setup
```bash
# Install backend dependencies
npm install

# Set up environment variables
# Edit .env file with your MongoDB URL

# Start backend server
npm start
# or for development
npm run dev
```

### Frontend Setup  
```bash
cd client
npm install

# Start React development server
npm start
```

### Configuration Required
1. **MongoDB**: Set `MONGODB_URL` in `.env`
2. **Image Upload**: Configure Cloudinary in `client/src/utils/imageUpload.js`

## 🌍 Environment Variables

The Docker setup automatically configures these, but for manual setup:

```env
MONGODB_URL=mongodb://localhost:27017/mern
ACCESS_TOKEN_SECRET=itissecret  
REFRESH_TOKEN_SECRET=itisalsosecret
PORT=8080
```

## 🐛 Troubleshooting

### Docker Issues
```bash
# Check container status
docker-compose ps

# View specific service logs
docker-compose logs backend
docker-compose logs frontend
docker-compose logs mongodb

# Clean rebuild
docker-compose down -v
docker system prune -a
docker-compose up --build
```

### Port Conflicts
If ports are already in use, edit `docker-compose.yml`:
```yaml
ports:
  - "3001:3000"  # Change host port
  - "8081:8080"  # Change host port
```

### Permission Issues (Linux/Mac)
```bash
sudo chown -R $USER:$USER uploads/
```

## 🖼️ Screenshots

<details>
<summary>Click to view application screenshots</summary>

| Login | Admin Panel | Profile |
|-------|-------------|---------|
| ![Login](https://user-images.githubusercontent.com/72184791/114161303-877f6b80-9945-11eb-89a7-f05b560bb5e4.JPG) | ![Admin](https://user-images.githubusercontent.com/72184791/114161299-877f6b80-9945-11eb-9791-cab82f92bd7e.JPG) | ![Profile](https://user-images.githubusercontent.com/72184791/114161324-8b12f280-9945-11eb-96a2-0707ee234c8a.JPG) |

| Home Feed | New Post | Dark Mode |
|-----------|----------|-----------|
| ![Home](https://user-images.githubusercontent.com/72184791/114161305-88180200-9945-11eb-9856-a4b33b8e9def.JPG) | ![Post](https://user-images.githubusercontent.com/72184791/114161309-89492f00-9945-11eb-888f-3ff263cfb909.JPG) | ![Dark](https://user-images.githubusercontent.com/72184791/114161287-851d1180-9945-11eb-8a0e-1a4c56132de0.JPG) |

</details>

## 🚢 Production Deployment

For production, use the production Docker Compose:

```bash
docker-compose -f docker-compose.prod.yml up --build
```

Or deploy to any platform that supports Docker:
- AWS ECS/Fargate
- Google Cloud Run  
- Azure Container Instances
- DigitalOcean App Platform
- Railway, Render, etc.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Test with Docker: `docker-compose up --build`
4. Commit changes: `git commit -m 'Add amazing feature'`
5. Push to branch: `git push origin feature/amazing-feature`
6. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Support

If this project helped you, please give it a ⭐!

**Demo**: https://mern-social-media-sdp.herokuapp.com/

---

**Made with ❤️ using the MERN Stack + Docker**



