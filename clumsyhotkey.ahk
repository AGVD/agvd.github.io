#Requires AutoHotkey v2.0

; 1. Create the indicator GUI
MyGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
MyGui.BackColor := "Black" ; Makes the text pop more
IndicatorText := MyGui.Add("Text", "w100 h20 Center cRed", "STATUS: OFF")
MyGui.Show("x10 y10 NoActivate")

; 2. Toggle state and ControlClick with F3
q:: {
    static toggle := false
    toggle := !toggle
    
    ; Set delay to -1 for more reliable background clicking
    SetControlDelay -1

    if toggle {
        ; Send click to clumsy "Start" button
        ControlClick("Button2", "clumsy 0.3",,,, "NA")
        
        IndicatorText.Value := "STATUS: ON"
        IndicatorText.SetFont("cGreen") ; v2 uses SetFont for color updates
    } else {
        ; Send click to clumsy "Stop" button
        ControlClick("Button2", "clumsy 0.3",,,, "NA")
        
        IndicatorText.Value := "STATUS: OFF"
        IndicatorText.SetFont("cRed")
    }
}
