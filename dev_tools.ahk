#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; ============================================================================
; INIT
; ============================================================================

; ============================================================================
; CONFIGURATION
; ============================================================================

ICON_PATH := A_ScriptDir . "\code.ico"
SQL_BAT_PATH := A_ScriptDir . "\sql_run.bat"


if FileExist(ICON_PATH)
    TraySetIcon(ICON_PATH)

A_MaxHotkeysPerInterval := 2000
ProcessSetPriority("H")
A_MenuMaskKey := "vk07"

; ============================================================================
; SECTION 1: ALT MENU ACCELERATION DISABLER
; ============================================================================

~LAlt:: {
    Send("{Blind}{sc0E9}")
    if KeyWait("LAlt")
        Send("{Blind}{sc0EA}")
}

~RAlt:: {
    Send("{Blind}{sc0E9}")
    if KeyWait("RAlt")
        Send("{Blind}{sc0EA}")
}

LAlt & RAlt:: Suspend(-1)

; ============================================================================
; SECTION 2: CLIPBOARD UTILITIES
; ============================================================================

WithSelectedText(callback) {
    saved := ClipboardAll()
    A_Clipboard := ""
    Send("^c")
    if !ClipWait(1) {
        A_Clipboard := saved
        return
    }
    text := A_Clipboard
    A_Clipboard := saved
    callback(text)
}

; ============================================================================
; SECTION 3: DEV TOOLS — WEB SEARCH
; ============================================================================

!s:: WithSelectedText((text) => Run("https://www.google.com/search?q=" . text))
!n:: WithSelectedText((text) => Run("https://www.npmjs.com/search?q=" . text))
!g:: WithSelectedText((text) => Run("https://github.com/search?q=" . text . "&type=code"))
; Alt+F1 — Run SQL Batch File with Administrator Privileges
; The '*RunAs' prefix is the key to fixing the service error.
!F1:: {
    if FileExist(SQL_BAT_PATH)
        Run("*RunAs " . SQL_BAT_PATH)
    else
        MsgBox("SQL Batch file not found at: " . SQL_BAT_PATH)
}
; ============================================================================
; SECTION 4: DEV TOOLS — LOCALHOST SHORTCUTS
; ============================================================================

^!3:: Run("http://localhost:3000")
^!5:: Run("http://localhost:5173")
^!8:: Run("http://localhost:8080")

; ============================================================================
; SECTION 5: DEV TOOLS — TEXT TRANSFORMATIONS & SELECTION
; ============================================================================

TransformSelected(transformFn) {
    saved := ClipboardAll()
    A_Clipboard := ""
    Send("^c")
    if !ClipWait(1) {
        A_Clipboard := saved
        return
    }
    transformed := transformFn(A_Clipboard)
    A_Clipboard := transformed
    if ClipWait(1)
        Send("^v")
    Sleep(50)
    A_Clipboard := saved
}

; Ctrl + Shift + X — Select all occurrences of the currently selected text
; Redirects to Ctrl+Shift+L (the standard VS Code/IDE global selection command)
^+x:: Send("^+l")

; Alt+W — Wrap selected text in console.log('...')
!w:: TransformSelected((t) => "console.log(" . t . ")")



; ==============================================================================
; CONTEXT SENSITIVITY
; Only triggers if NOT hovering over a text input (I-Beam cursor).
; ==============================================================================

#HotIf A_Cursor != "IBeam"

^Right::AdjustVolume(8)   ; Increase by 8
^Left::AdjustVolume(-8)   ; Decrease by 8

#HotIf

; ==============================================================================
; CORE LOGIC: Volume Adjustment & Clamping
; ==============================================================================

AdjustVolume(delta)
{
    try {
        ; 1. Get current volume
        currentVol := SoundGetVolume()
        
        ; 2. Calculate new volume and CLAMP it between 0 and 100
        ; Min(val, 100) ensures it never exceeds 100
        ; Max(0, val) ensures it never drops below 0
        newVol := Max(0, Min(100, currentVol + delta))
        
        ; 3. Apply the new volume
        SoundSetVolume(newVol)
        
        ; 4. Visual Feedback
        ToolTip("Volume: " . Round(newVol) . "%")
        SetTimer(() => ToolTip(), -1500)
        
    } catch Error as e {
        ToolTip("Audio Error: " . e.Message)
        SetTimer(() => ToolTip(), -3000)
    }
}
