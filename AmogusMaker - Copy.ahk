^4::
sleep, 100
MouseGetPos, xx, yy
interval := 10 ; (degree) interval
alt := false

Loop, 5
{
alt := !alt
if (alt == true)
{
MouseMove, 0, 50, 0, R
}
else
{
MouseMove, 0, -50, 0, R
}
Send {Click Down Right} ; Start here -------------------------------
;Face Inside -------------------------------------------------------

start := "top"
r := 20
MoveMouseInCircle(r, interval, start)
start := "right"
MoveMouseInCircle(r, interval, start)
MouseMove, -50, 0, 0, R
start := "bottom"
MoveMouseInCircle(r, interval, start)
start := "left"
MoveMouseInCircle(r, interval, start)
MouseMove, 50, 0, 0, R
start := "top"
MoveMouseInCircle(r, interval, start)
MouseMove, -50, 0, 0, R
start := "bottom"
MoveMouseInCircle(r, interval, start)
MouseMove, 50, 0, 0, R
MouseMove, 0, -8, 0, R
;face outside------------------------------------------------------
start:= "top"
r := 30
MoveMouseInCircle(r, interval, start)
start := "right"
MoveMouseInCircle(r, interval, start)
MouseMove, -50, 0, 0, R
start := "bottom"
MoveMouseInCircle(r, interval, start)
start := "left"
MoveMouseInCircle(r, interval, start)
MouseMove, 50, 0, 0, R
;body outside -----------------------------------------------------
start := "top"
MoveMouseInCircle(r, interval, start)
start := "right"
MoveMouseInCircle(r, interval, start)
MouseMove, 0, 100, 0, R
r := 21
start := "right"
MoveMouseInCircle(r, interval, start)
start := "bottom"
MoveMouseInCircle(r, interval, start)
MouseMove, 0, -22, 0, R
MouseMove, -25, 0, 0, R
MouseMove, 0, 22, 0, R
start := "right"
MoveMouseInCircle(r, interval, start)
start := "bottom"
MoveMouseInCircle(r, interval, start)
MouseMove, 0, -30, 0, R
MouseMove, -15, 0, 0, R
start := "bottom"
MoveMouseInCircle(r, interval, start)
MouseMove, 0, -75, 0, R
start := "left"
MoveMouseInCircle(r, interval, start)
MouseMove, 15, 0, 0, R
MouseMove, 0, 120, 0, R
MouseMove, 0, -120, 0, R
r := 40
start := "left"
MoveMouseInCircle(r, interval, start)
MouseMove, 39, 0, 0, R
r := 32
start := "top"
MoveMouseInCircle(r, interval, start)
; End here ------------------------------------
Send {Click Right}
MouseMove, 200, 16, 0, R
}
return

MoveMouseInCircle(r := 20, degInc := 5, start := "bottom", speed := 0, rev := 1)
{
	static radPerDeg := 3.14159265359 / 180

	MouseGetPos, cx, cy
	Switch start
	{
		Case "top":
			angle := 0
			cy += r
		Case "right":
			angle := 90 * radPerDeg
			cx -= r
		Case "bottom":
			angle := 180 * radPerDeg
			cy -= r
		Case "left":
			angle := 270 * radPerDeg
			cx += r
	}
	loop, % 90 / degInc
	{
		angle += degInc * radPerDeg
		MouseMove, cx + r * (rev * Sin(angle)), cy - r * Cos(angle), speed
	}
}

esc::reload