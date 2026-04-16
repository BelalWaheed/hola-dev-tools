# Hola Dev Tools

Personal developer environment configuration and productivity suite. This repository consolidates my **AutoHotkey** utilities, **GlazeWM** tiling window manager settings, and other developer tools.

## Repository Structure

- `dev_tools.ahk`: Main AutoHotkey script for web searches and text transformations.
- `code.ico`: **(Important)** Must be in the same folder as `dev_tools.ahk` to display the tray icon.
- `glazewm/`: Configuration for GlazeWM (Tiling Window Manager for Windows).
- `hotkey_reference.html`: A quick visual reference for configured hotkeys.

---

## AutoHotkey — `dev_tools.ahk`

| Hotkey                 | Action                                   |
| :--------------------- | :--------------------------------------- |
| **`Alt + S`**          | Search Google for selected text          |
| **`Alt + N`**          | Search NPM for selected text             |
| **`Alt + G`**          | Search GitHub (Code) for selected text   |
| **`Alt + W`**          | Wrap selected text in `console.log(...)` |
| **`Ctrl + Shift + X`** | Select all occurrences (vs-code style)   |
| **`Ctrl + Alt + 3`**   | Open `http://localhost:3000`             |
| **`Ctrl + Alt + 5`**   | Open `http://localhost:5173`             |
| **`Ctrl + Alt + 8`**   | Open `http://localhost:8080`             |
| **`Alt + F1`**         | SQL Automation (Start/SSMS/Stop)         |

---

## SQL Automation Tool (`sql_run.bat`)

The **Alt + F1** hotkey triggers a coordinated database development workflow designed to save system resources:

1.  **Starts SQL Service**: Automatically starts the `MSSQLSERVER` Windows service.
2.  **Launches SSMS**: Opens SQL Server Management Studio and waits for you to finish your work.
3.  **Stops SQL Service**: Once SSMS is closed, it stops the service to free up system resources.

> [!IMPORTANT]
> This hotkey requires **Administrator privileges** to start/stop Windows services. If the script isn't running as Admin, you will see a UAC prompt.

---

## GlazeWM — Tiling Window Management

| Category       | Hotkey                      | Action                              |
| :------------- | :-------------------------- | :---------------------------------- |
| **General**    | **`Alt + Q`**               | Close focused window                |
|                | **`Alt + /`**               | Launch PowerShell (`pwsh`)          |
|                | **`Alt + Shift + R`**       | Reload GlazeWM Config               |
| **Layout**     | **`Alt + F`**               | Toggle Fullscreen                   |
|                | **`Alt + T`**               | Toggle Tiling                       |
|                | **`Alt + Shift + Space`**   | Toggle Floating (Centered)          |
|                | **`Alt + V`**               | Toggle Tiling Direction             |
| **Navigation** | **`Alt + Arrow Keys`**      | Focus window in direction           |
|                | **`Alt + 1, 2, 3`**         | Focus Workspace 1, 2, or 3          |
| **Moving**     | **`Alt + Shift + Arrow`**   | Move window in direction            |
|                | **`Alt + Shift + 1, 2, 3`** | Move window to Workspace 1, 2, or 3 |

---

## Setup & Installation

### Option 1: Standalone (Recommended for most users)

_No installation required._

1. Download or clone this repository.
2. Run **`dev_tools.exe`**.
3. The tools are now active! You will see a small code icon in your System Tray (bottom right).
   - _Note: You may need to run as Administrator for certain hotkeys (like Alt+F1) to work._

### Option 2: For Developers (AutoHotkey required)

1. Install [AutoHotkey v2.0+](https://www.autohotkey.com/).
2. Run **`dev_tools.ahk`**. This allows you to edit the script and see changes immediately.

### Window Management (GlazeWM)

1. Install [GlazeWM](https://glazewm.com/).
2. Point your GlazeWM config path to the `glazewm/config.yaml` in this repo (or symlink it).

---

## Maintenance

- **Adding Hotkeys**: Edit `dev_tools.ahk` or `glazewm/config.yaml`.
- **Logs**: Errors and logs are ignored by `.gitignore` to keep the repo clean.
