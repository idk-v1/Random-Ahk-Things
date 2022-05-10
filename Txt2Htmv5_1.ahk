;https://www.autohotkey.com/docs/AutoHotkey.htm

#NoEnv                                                                                                                   
SetWorkingDir %A_ScriptDir%                                                

B1 := % "Plagueis"
T1 := % "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life... He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful... the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself."
M1 := % "Darth Plagueis copypasta"
B2 := % Chr(3486) "SUS" Chr(3486)
T2 := % Chr(3486)
M2 := % Chr(3486) " (sus symbol)"

FileEncoding, UTF-16
If !FileExist("Options.txt")
{
FileAppend,
(
%B1%
%T1%
%M1%
%B2%
%T2%
%M2%

Line 1. Display 1
Line 2. Text 1
Line 3. Message 1
Line 4. Display 2
Line 5. Text 2
Line 6. Message 2

Use "~" for new lines
Longer strings are not recommended for Displays or Messages
), Options.txt
}

FileReadLine, B1, Options.txt, 1
FileReadLine, T1, Options.txt, 2
FileReadLine, M1, Options.txt, 3
FileReadLine, B2, Options.txt, 4
FileReadLine, T2, Options.txt, 5
FileReadLine, M2, Options.txt, 6

Gui, Font, s8 cBlack, Courier New                           

Gui, Add, Progress, x10 y10 w30 h20 v1 cWhite, 100         
Gui, Add, Progress, x330 y10 w40 h20 v3 cWhite, 100   

Gui, Add, Progress, x200 y30 w20 h33 cff0000, 100                        
Gui, Add, Progress, x200 y63 w20 h33 c00ff00, 100                        
Gui, Add, Progress, x200 y96 w20 h33 c0000ff, 100        

Gui, Add, Text, x10 y10 w30 h20 BackgroundTrans, TEXT      
Gui, Add, Text, x330 y10 w40 h20 BackgroundTrans, SIZE:
                          
Gui, Add, Edit, x10 y30 w180 h69 vText
Gui, Add, Edit, x375 y10 w90 h20 vSize

Gui, Add, Edit, x200 y10 w30 h20 vr2, 255
Gui, Add, Edit, x235 y10 w30 h20 vg2, 255
Gui, Add, Edit, x270 y10 w30 h20 vb2, 255

Gui, Add, Button, x305 y10 w20 h20 gNumOk vNumOk, OK

Gui, Font, s10 Bold  cBlack, Courier New
Gui, Add, CheckBox, vBold x50 y10, B
Gui, Font, s8 cBlack Norm, Courier New

Gui, Font, s10 Italic cBlack, Courier New
Gui, Add, CheckBox, vItalic x85 y10, I
Gui, Font, s8 cBlack Norm, Courier New

Gui, Font, s10 Strike  cBlack, Courier New
Gui, Add, CheckBox, vStrike x120 y10, S
Gui, Font, s8 cBlack Norm, Courier New

Gui, Font, s10 Underline cBlack, Courier New
Gui, Add, CheckBox, vUnder x155 y10, U
Gui, Font, s8 cBlack Norm, Courier New

Gui, Add, Slider, vr x220 y30 w100 h20 Range0-255 ToolTipTop gRe -Border, 255        
Gui, Add, Slider, vg x220 y63 w100 h20 Range0-255 ToolTipTop gGr -Border, 255        
Gui, Add, Slider, vb x220 y96 w100 h20 Range0-255 ToolTipTop gBl -Border, 255                                

Gui, Add, Button, x10 y100 w180 h30 gEditC, &Edit Controls
Gui, Add, Button, x330 y41 w80 h44 gDarth vDarth1, % B1                
Gui, Add, Button, x410 y41 w80 h44 gSus vSus1, % B2   
Gui, Add, Button, Default x330 y85 w160 h44 gButton, Enter           
Gui, Add, Button, x470 y10 w20 h20 gHelp, ?

Gui, Show, w500 h140, Custom Text Maker                      
Gui, Color, 0xffffff
GuiControl, Focus, g                                        
GuiControl, Focus, b                                   
GuiControl, Focus, r   
GuiControl, Focus, Text
Return                                               

EditC:
Gui, Ed:New

Gui, Font, s8 Bold  cBlack, Courier New  

Gui, Ed:Add, Text, x10 y0 w80 h20, Display 1
Gui, Ed:Add, Text, x160 y0 w80 h20, Display 2

Gui, Ed:Add, Text, x10 y40 w50 h20, Text 1
Gui, Ed:Add, Text, x160 y40 w50 h20, Text 2

Gui, Ed:Add, Text, x10 y200 w75 h20, Message 1
Gui, Ed:Add, Text, x160 y200 w75 h20, Message 2

Gui, Ed:Add, Edit, x10 y20 w130 h20 vEditD1 -VScroll, %B1%
Gui, Ed:Add, Edit, x160 y20 w130 h20 vEditD2 -VScroll, %B2%

Gui, Ed:Add, Edit, x10 y60 w130 h130 vEditT1, %T1%
Gui, Ed:Add, Edit, x160 y60 w130 h130 vEditT2, %T2%

Gui, Ed:Add, Edit, x10 y220 w130 h40 vEditM1 -VScroll, %M1%
Gui, Ed:Add, Edit, x160 y220 w130 h40 vEditM2 -VScroll, %M2%

Gui, Ed:Add, Button, Default gEditOk x105 y270 w50 h30, Save
Gui, Ed:Add, Button, gEditCancel x160 y270 w50 h30, &Cancel

Gui, Ed:Show, w300 h300, TXT: Edit Controls
Return

EditOk:
Gui, Ed:Submit

FileEncoding, UTF-16
FileDelete, Options.txt
FileAppend,
(
%EditD1%
%EditT1%
%EditM1%
%EditD2%
%EditT2%
%EditM2%
), Options.txt

Gui, Ed:Destroy
Reload
Return

EditCancel:
Gui, Cancel
Return

NumOk:
Gui, Submit, NoHide     
Gui, Color, % format("0x{1:02x}{2:02x}{3:02x}", r2, g2, b2)  
GuiControl, Focus, g                                        
GuiControl, Focus, b                                   
GuiControl, Focus, r
GuiControl,, r, %r2%
GuiControl,, g, %g2%
GuiControl,, b, %b2%
GuiControl, Focus, NumOk
Return
   
Re:                                                
Gui, Submit, NoHide                                        
Gui, Color, % format("0x{1:02x}{2:02x}{3:02x}", r, g, b)                    
GuiControl, Focus, g                                        
GuiControl, Focus, b                                   
GuiControl, Focus, r
GuiControl, Text, r2, %r%
Return                                            

Gr:                                                
Gui, Submit, NoHide                                        
Gui, Color, % format("0x{1:02x}{2:02x}{3:02x}", r, g, b)                    
GuiControl, Focus, b                                        
GuiControl, Focus, r                                        
GuiControl, Focus, g                                    
GuiControl, Text, g2, %g%
Return                                                

Bl:                                                
Gui, Submit, NoHide                                        
Gui, Color, % format("0x{1:02x}{2:02x}{3:02x}", r, g, b)                    
GuiControl, Focus, r                                        
GuiControl, Focus, g                                    
GuiControl, Focus, b                                        
GuiControl, Text, b2, %b%
Return                                           

Sus:                                                
Clipboard := % T2                                
GuiControl, Focus, Text
Tooltip, % M2 " `n copied to clipboard"                
Sleep 2000                                            
Tooltip                                                
Return                                            

Darth:                                           
Clipboard := % T1        
GuiControl, Focus, Text
Tooltip, % M1 " `n copied to clipboard"             
Sleep 2000                                        
Tooltip                                            
Return                                                

Help:

SUSSUS := Chr(3486)

Gui, H:New
Gui, H:Font, s12 cBlack Bold, Courier New
Gui, H:Add, Text,, TEXT BOX
Gui, H:Font, s8 cBlack, Courier New
Gui, H:Add, Text,, Use the text box below the word "TEXT". Use "~" to make a new line. `nSorry, that symbol is unable to be displayed because I want this code to `nbe simple, and not have to write 10 or so more lines.

Gui, H:Font, s12 cBlack Bold, Courier New
Gui, H:Add, Text,, TEXT MODIFIERS
Gui, H:Font, s8 cBlack, Courier New
Gui, H:Add, Text,, The "B" checkbox is for BOLD text, the "I" for ITALICS, `nthe "S" for STRIKETHROUGH, the "U" for UNDERLINE. `nThe textbox by the "SIZE:" label is for the text size. `nThere really isn't a limit, but anything over 10,000 is hard to find.

Gui, H:Font, s12 cBlack Bold, Courier New
Gui, H:Add, Text,, COLOR
Gui, H:Font, s8 cBlack, Courier New
Gui, H:Add, Text,, The textboxes above the sliders are the RED, GREEN, BLUE values `nin that order. Press the "OK" button to apply the color. The sliders `nare more of for finding a non-specific color and do not need the `n"OK" button to be pressed. The window background will change color `naccording to the sliders or the RED, GREEN, and BLUE textboxes. 

Gui, H:Font, s12 cBlack Bold, Courier New
Gui, H:Add, Text,, EXTRA BUTTONS
Gui, H:Font, s8 cBlack, Courier New
Gui, H:Add, Text,, The "Plagueis" button is the default button settings for saved text `n#1. The "%SUSSUS%SUS%SUSSUS%" button is the default settings for saved text #2. `nThe "Edit Controls" button opens a new window with two "Display" `ntextboxes, two "Text" textboxes, and two "Message" textboxes. The `n"Display" boxes change what is on the button label. The "Text" `nboxes change what is copied to the clipboard. The "Message" boxes `nchange what the tooltip shows after the button is pressed. `nDo not create new lines, use "~"

Gui, H:Show, w500 h500
Return

Button:                                                
Gui, Submit                                            
ARRAY := []                                        
Text2 := ""                                            
Text3 := ""                                       
SL := StrLen(Text)   
AR := ""
Start := ""
End := ""

If (Bold)
{
Start .= "<b>"
End .= "</b>"
}
If (Italic)
{
Start .= "<i>"
End .= "</i>"
}
If (Strike)
{
Start .= "<del>"
End .= "</del>"
}

If (Under)
{
Start .= "<ins>"
End .= "</ins>"
}
                                     
Loop, %SL%                                    
{
Text2 := SubStr(Text, A_Index, 1)                                
If !(Text2 = "~")
{
Text3 := Asc(Text2)                                        
StrF := "&#" Text3 ";"
}
Else
{
StrF := "<br>"
}
ARRAY.Push(StrF)                                        
}       
                              
Loop, %SL%                                        
{
AR .= ARRAY[A_Index]                                    
}

FileDelete, test.htm                                        
FileAppend,                                       
(
<p><span style="color: rgb(%r%, %g%, %b%); font-size: %Size%px;">%Start%%AR%%End%</p>
)
, test.htm                                        
RunWait, test.htm                                        

ExitApp                                            
GuiClose:                                            
ExitApp    
#IfWinActive Custom Text Maker                                        
Esc::ExitApp                                         
Return

