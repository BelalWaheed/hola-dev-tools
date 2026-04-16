#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; ============================================================================
; INIT
; ============================================================================

; ============================================================================
; CONFIGURATION
; ============================================================================

ICON_PATH := "D:\dev\ui_elements\icons\code.ico"
SQL_BAT_PATH := "D:\dev\tweeks\sql_run.bat"

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