Output assets/xy.gif

Require xvert

Set Shell "bash"
Set FontSize 32
Set Width 1200
Set Height 600

Hide
Type "cd ./tapes" Enter
Ctrl+l
Show

Type "cat foo.xml" Sleep 500ms Enter Sleep 500ms
Sleep 1s
Type "clear" Sleep 500ms Enter Sleep 500ms

Type "xvert xy < foo.xml" Sleep 500ms  Enter

Sleep 5s
