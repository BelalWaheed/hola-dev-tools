# Hola Dev Tools

Personal developer environment configuration and productivity suite. This repository consolidates my **AutoHotkey** utilities, **GlazeWM** tiling window manager settings, and specialized hardware control tools.

## 📂 Repository Structure

- `dev_tools.ahk`: Main AutoHotkey script for web searches, volume control, and text transformations.
- `brightniess.ahk`: Hardware-level brightness control for Dell Precision (and WMI-compatible) displays.
- `code.ico`: **(Required)** Tray icon for `dev_tools.ahk`.
- `glazewm/`: Configuration for GlazeWM (Tiling Window Manager for Windows).
- `hotkey_reference.html`: A premium visual reference dashboard for all configured hotkeys.
- `sql_run.bat`: Coordinated SQL Server workflow automation.

---

## ⚡ AutoHotkey — `dev_tools.ahk`

| Category | Hotkey | Action |
| :--- | :--- | :--- |
| **Search** | **`Alt + S`** | Search Google for selected text |
| | **`Alt + N`** | Search NPM for selected text |
| | **`Alt + G`** | Search GitHub (Code) for selected text |
| **Media** | **`Ctrl + Left/Right`** | Adjust System Volume (Step: 8%) |
| **Transform** | **`Alt + W`** | Wrap selected text in `console.log(...)` |
| | **`Ctrl + Shift + X`** | Select all occurrences (VS Code style `Ctrl+Shift+L`) |
| **Localhost** | **`Ctrl + Alt + 3`** | Open `http://localhost:3000` |
| | **`Ctrl + Alt + 5`** | Open `http://localhost:5173` |
| | **`Ctrl + Alt + 8`** | Open `http://localhost:8080` |
| **Database** | **`Alt + F1`** | SQL Automation (Start -> SSMS -> Stop) |

> [!TIP]
> **Volume Control** only triggers when the cursor is NOT an I-Beam (hovering over text), preventing conflicts while typing.

---

## 🔅 Brightness Control — `brightniess.ahk`

Dedicated utility for controlling integrated display brightness via WMI.

| Hotkey | Action |
| :--- | :--- |
| **`Ctrl + \`** | Increase Brightness (+10%) |
| **`Ctrl + '`** | Decrease Brightness (-10%) |

> [!IMPORTANT]
> This script requires **Administrator privileges** to interact with hardware via WMI. It will automatically request UAC elevation on startup.

---

## 🗄️ SQL Automation Tool (`sql_run.bat`)

Triggered via **Alt + F1**, this coordinated workflow saves system resources:

1.  **Starts SQL Service**: Automatically starts the `MSSQLSERVER` service.
2.  **Launches SSMS**: Opens SQL Server Management Studio and waits for closure.
3.  **Stops SQL Service**: Automatically stops the service once you finish working.

---

## 🖼️ GlazeWM — Tiling Window Management

| Category | Hotkey | Action |
| :--- | :--- | :--- |
| **General** | **`Alt + Q`** | Close focused window |
| | **`Alt + /`** | Launch PowerShell (`pwsh`) |
| | **`Alt + Shift + R`** | Reload GlazeWM Config |
| **Navigation**| **`Alt + Arrow Keys`** | Focus window in direction |
| | **`Alt + 1, 2, 3`** | Focus Workspace 1, 2, or 3 |
| **Moving** | **`Alt + Shift + Arrow`**| Move window in direction |
| | **`Alt + Shift + 1, 2, 3`**| Move window to Workspace 1, 2, or 3 |

---

## 🚀 Setup & Installation

### Option 1: Standalone (Ready to use)
1. Download or clone this repository.
2. Run **`dev_tools.exe`** and **`brightniess.exe`**.
3. You will see a custom icon in your System Tray for the dev tools.

### Option 2: For Developers (Requires AHK v2.0+)
1. Install [AutoHotkey v2.0+](https://www.autohotkey.com/).
2. Run **`dev_tools.ahk`** and **`brightniess.ahk`**.
3. Edit scripts as needed; changes apply immediately on reload.

### Window Management (GlazeWM)
1. Install [GlazeWM](https://glazewm.com/).
2. Symlink or copy `glazewm/config.yaml` to your GlazeWM configuration directory.

---

## 🛠️ Maintenance
- **Adding Hotkeys**: Edit the `.ahk` scripts or `glazewm/config.yaml`.
- **Reference**: Update `hotkey_reference.html` to reflect UI changes in the dashboard.

