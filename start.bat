@echo off
echo ==========================================
echo MERN Social Media App - Docker Setup
echo ==========================================
echo.

echo Checking Docker installation...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Docker is not installed or not running.
    echo Please install Docker Desktop:
    echo    https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

echo Docker found and running!
echo.

echo Cleaning up any existing containers...
docker-compose down >nul 2>&1

echo Building and starting all services...
docker-compose up --build -d

echo.
echo Waiting for services to initialize...
timeout /t 15 /nobreak >nul

echo Checking service health...
for /f "tokens=1,5" %%i in ('docker-compose ps --format "table {{.Name}}\t{{.Status}}"') do (
    if not "%%i"=="NAME" (
        echo %%i: %%j
    )
)

echo.
echo ==========================================
echo Application Status
echo ==========================================
echo Services should be running!
echo.
echo Access your application:
echo    • Frontend:  http://localhost:3000
echo    • Backend:   http://localhost:8080
echo    • Database:  localhost:27017
echo.
echo Useful commands:
echo    • View logs:     docker-compose logs -f
echo    • Stop app:      docker-compose down
echo    • Restart:       docker-compose restart
echo    • Rebuild:       docker-compose up --build
echo.

echo NOTE: If frontend isn't loading, it may still be starting up.
echo Wait a moment and refresh your browser, or check logs with:
echo    docker-compose logs frontend
echo.

echo Press any key to view live logs (Ctrl+C to exit logs)...
pause >nul

echo Showing live logs (Press Ctrl+C to exit)...
docker-compose logs -f
