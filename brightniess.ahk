#Requires AutoHotkey v2.0
#SingleInstance Force

/**
 * @description Controls Dell Precision built-in display brightness.
 * @hotkey Ctrl + \  => Increase
 * @hotkey Ctrl + '  => Decrease
 */

; --- Administrative Elevation ---
; This is mandatory for hardware/WMI interaction.
if !A_IsAdmin {
    try {
        Run("*RunAs " . A_ScriptFullPath)
    } catch {
        MsgBox("Administrative rights are required to adjust hardware brightness.", "Permission Denied", 48)
    }
    ExitApp()
}

; --- Hotkeys ---
; Increase: Ctrl + \
^\::AdjustBrightness(10)

; Decrease: Ctrl + '
^'::AdjustBrightness(-10)

; --- Core Logic ---
AdjustBrightness(offset) {
    static wmi := ComObjGet("winmgmts:\\.\root\WMI")
    
    try {
        ; 1. Identify the active integrated monitor
        currentBrightness := 0
        for obj in wmi.ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=True") {
            currentBrightness := obj.CurrentBrightness
        }

        ; 2. Calculate and clamp the value (0-100 range)
        newBrightness := Max(0, Min(100, currentBrightness + offset))

        ; 3. Apply the new level to the active panel
        for obj in wmi.ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods WHERE Active=True") {
            obj.WmiSetBrightness(0, newBrightness)
        }

        ; 4. Visual Feedback
        ToolTip("Brightness: " . newBrightness . "%")
        SetTimer(() => ToolTip(), -1500)

    } catch Error as e {
        ; Logs error if the WMI service is unresponsive
        ToolTip("Hardware Error: " . e.Message)
        SetTimer(() => ToolTip(), -3000)
    }
}