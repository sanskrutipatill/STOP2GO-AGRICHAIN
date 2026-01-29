# Setup and Run Instructions for AgriChain

This project is a blockchain-based agricultural supply chain application using **React**, **Node.js**, **Truffle**, and **Ganache**.

## Prerequisites

- **Node.js** (v14 or higher recommended)
- **npm** (comes with Node.js)
- **Git** (optional, but recommended)

## Installation

1.  **Install Root Dependencies**
    Open a terminal in the project root (`d:\Projects\STOP2GO-AGRICHAIN-main\STOP2GO-AGRICHAIN-main`) and run:
    ```bash
    npm install
    ```

2.  **Install Client Dependencies**
    Move to the client directory and install dependencies:
    ```bash
    cd client
    npm install
    cd ..
    ```

## Running the Project

### Option 1: Automatic Startup (Recommended)
In the root directory, double-click **`start-all.bat`** or run:
```cmd
start-all.bat
```
*Note: This will open 3 separate windows (Ganache, Backend, Frontend).*

### Option 2: Manual Startup (For Troubleshooting)
If `start-all.bat` closes immediately or fails, verify each component by running them in **separate terminal windows** in this order:

1.  **Terminal 1: Blockchain**
    ```bash
    npx ganache-cli --port 7545 --deterministic --networkId 1758369392079
    ```
    *Keep this running. Wait for "RPC Listening on..."*

2.  **Terminal 2: Deploy Contracts & Setup Data**
    ```bash
    npx truffle migrate --reset --network development
    node fix-item-tracking.js
    ```
    *You should see "Final cost", "Farmer added", etc.*

3.  **Terminal 3: Backend Server**
    ```bash
    node server/index.js
    ```
    *Should see "Server on port 5000"*

4.  **Terminal 4: Frontend Client**
    ```bash
    cd client
    npm start
    ```
    *This will try to open your default browser to http://localhost:3000*

## Detailed Troubleshooting

1.  **"npx" not found**: Ensure you have a recent version of npm (installing Node.js LTS usually fixes this).
2.  **Ports in use**: If you see errors like `EADDRINUSE`, make sure no other instances of node or other apps are using ports 3000, 5000, or 7545. Run `taskkill /F /IM node.exe` in a command prompt (Administrator) to kill all Node processes.
3.  **Contract Not Deployed**: If the backend says "AgriSupplyChain not deployed", ensure you ran step 2 (truffle migrate) successfully *after* Ganache started.
4.  **Network ID Mismatch**: If you see network errors, ensure Ganache is running on port 7545.
