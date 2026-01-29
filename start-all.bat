@echo off
echo Starting AgriChain Application...
echo ================================

REM Kill any existing processes
echo Stopping existing processes...
taskkill /F /IM node.exe >nul 2>&1
timeout /t 2 >nul

REM Start Ganache in a new window
echo Starting Ganache blockchain...
start "Ganache" cmd /c "npx ganache-cli --port 7545 --deterministic --networkId 1758369392079"

REM Wait for Ganache to start
echo Waiting for Ganache to initialize...
timeout /t 10 >nul

REM Deploy contract
echo Deploying smart contract...
npx truffle migrate --reset --network development

REM Add test data
echo Adding test data...
node fix-item-tracking.js

REM Start backend server
echo Starting backend server...
start "Backend" cmd /c "node server/index.js"

REM Wait for backend to start
timeout /t 3 >nul

REM Start React frontend
echo Starting React frontend...
start "Frontend" cmd /c "cd client && npm start"

echo All services starting...
echo - Ganache: http://127.0.0.1:7545
echo - Backend: http://localhost:5000  
echo - Frontend: http://localhost:3000
echo.
echo Press any key to exit...
pause >nul