Output assets/jj.gif

Require xvert

Set Shell "bash"
Set FontSize 32
Set Width 1200
Set Height 600

Hide
Type "cd ./tapes" Enter
Ctrl+l
Show

Type "cat foo.json" Sleep 500ms Enter Sleep 500ms
Sleep 1s
Type "clear" Sleep 500ms Enter Sleep 500ms

Type "xvert jj < foo.json" Sleep 500ms  Enter

Sleep 5s
