# 🚀 Hola Dev Tools

Personal developer environment configuration and productivity suite. This repository consolidates my **AutoHotkey** utilities, **GlazeWM** tiling window manager settings, and other developer tools.

## 📂 Repository Structure

- `dev_tools.ahk`: Main AutoHotkey script for web searches, dev shortcuts, and text transformations.
- `glazewm/`: Configuration for GlazeWM (Tiling Window Manager for Windows).
- `hotkey_reference.html`: A quick visual reference for configured hotkeys.

---

## ⌨️ AutoHotkey — `dev_tools.ahk`

| Hotkey | Action |
| :--- | :--- |
| **`Alt + S`** | Search Google for selected text |
| **`Alt + N`** | Search NPM for selected text |
| **`Alt + G`** | Search GitHub (Code) for selected text |
| **`Alt + W`** | Wrap selected text in `console.log(...)` |
| **`Ctrl + Shift + X`** | Select all occurrences (vs-code style) |
| **`Alt + F1`** | Run SQL Batch File (Administrator) |
| **`Ctrl + Alt + 3`** | Open `http://localhost:3000` |
| **`Ctrl + Alt + 5`** | Open `http://localhost:5173` |
| **`Ctrl + Alt + 8`** | Open `http://localhost:8080` |

---

## 🪟 GlazeWM — Tiling Window Management

| Category | Hotkey | Action |
| :--- | :--- | :--- |
| **General** | **`Alt + Q`** | Close focused window |
| | **`Alt + /`** | Launch PowerShell (`pwsh`) |
| | **`Alt + Shift + R`** | Reload GlazeWM Config |
| **Layout** | **`Alt + F`** | Toggle Fullscreen |
| | **`Alt + T`** | Toggle Tiling |
| | **`Alt + Shift + Space`** | Toggle Floating (Centered) |
| | **`Alt + V`** | Toggle Tiling Direction |
| **Navigation** | **`Alt + Arrow Keys`** | Focus window in direction |
| | **`Alt + 1, 2, 3`** | Focus Workspace 1, 2, or 3 |
| **Moving** | **`Alt + Shift + Arrow`** | Move window in direction |
| | **`Alt + Shift + 1, 2, 3`** | Move window to Workspace 1, 2, or 3 |

---

## 🛠️ Setup & Installation

1. **AutoHotkey**:
   - Install [AutoHotkey v2.0+](https://www.autohotkey.com/).
   - Run `dev_tools.ahk` to activate productivity shortcuts.
2. **GlazeWM**:
   - Install [GlazeWM](https://github.com/glazewm/GlazeWM).
   - Point your GlazeWM config path to the `glazewm/config.yaml` in this repo (or symlink it).

---

## 📝 Maintenance

- **Adding Hotkeys**: Edit `dev_tools.ahk` or `glazewm/config.yaml`.
- **Logs**: Errors and logs are ignored by `.gitignore` to keep the repo clean.
