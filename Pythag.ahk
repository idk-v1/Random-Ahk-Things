Gui, New
Gui, Add, Text, x10 y10, A
Gui, Add, Edit, vAA x10 y35 w50
Gui, Add, Text, x65 y10, B
Gui, Add, Edit, vBB x65 y35 w50
Gui, Add, Text, x120 y10, C
Gui, Add, Edit, vCC x120 y35 w50
Gui, Add, Button, gEnter x10 y60, Enter
Gui, Add, Button, gClear x55 y60, Clear
Gui, Show, w200 h150
Return

Enter:
Gui, Submit, NoHide
If (AA = "")
{
AAA := Sqrt((CC * CC) - (BB * BB))
GuiControl, Text, AA, %AAA%
Return
}
Else If (BB = "")
{
BBB := Sqrt((CC * CC) - (AA * AA))
GuiControl, Text, BB, %BBB%
Return
}
Else If (CC = "")
{
CCC := Sqrt((AA * AA) + (BB * BB))
GuiControl, Text, CC, %CCC%
Return
}
Else If (AA = "" && BB = "" && CC = "")
{
MsgBox, Fill in TWO boxes
}
MsgBox, Only fill in TWO boxes

Clear:
GuiControl, Text, AA, 
GuiControl, Text, BB, 
GuiControl, Text, CC, 
Return

Esc::ExitApp
GuiClose:
ExitApp