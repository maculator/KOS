clearscreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
set terminal:charheight to 16.
set terminal:width to 30.
set terminal:height to 10.
set terminal:brightness to 1.

FUNCTION start {
	asc(1000,	90).
	asc(2000,	85).
	asc(4000,	70).
	asc(7500,	60).
	asc(10000,	45).
	asc(20000,	35).
	asc(30000,	25).
	asc(40000,	20).
	asc(72000,	 0).
}

FUNCTION asc {
parameter talt, angle.
	UNTIL ship:altitude > talt {
		lock steering to heading(90, angle).
		if ship:apoapsis >= 72000 {
			break.
		}
		wait .1.
	}
	print "passed: " + round(talt) + "km.".
}

sas off.
lock steering to up.
lock throttle to 1.
wait 1.
stage.
print "sas off.".
print "lock throttle to 1.".
print "lock steering to up.".
print "liftoff.".

start().

lock throttle to 0.
lock steering to ship:prograde.
print "lock throttle to 0.".
print "lock steering to prograde.".
print "coasting to eta:AP 20s.".
wait until eta:apoapsis <= 20.

lock steering to heading(90,0).
print "pointing on horizon.".
print "coasting to eta:AP 9s.".
wait until eta:apoapsis <= 9.

lock throttle to 1.
print "lock throttle to 1.".
print "burning for orbit.".
wait until ship:periapsis >= 70000.
print "orbit achieved.".

lock throttle to 0.
print "lock throttle to 0.".

toggle gear.
toggle brakes.
stage.
print "cargo bay toggled.".
print "brakes toggled.".
print "chutes fired".

until false {
	lock steering to retrograde.
	clearscreen.
	print "lon is: " + round(ship:longitude).
	print "Please Warp.".
	if ship:longitude > -121 and ship:longitude < -119 {break.}
	wait .1.
}
kuniverse:timewarp:cancelwarp().
print "broke until loop.".

until ship:longitude >= -103.92 {	//100.92
	lock steering to ship:retrograde.
	clearscreen.
	print "waiting to burn.".
	print (round(ship:longitude) - (-103.92)).
	wait 0.001.
}

print "deorbit burn.".
lock throttle to 1.
wait until ship:oxidizer <= .1.

lock throttle to 0.
lock steering to ship:retrograde.
print "steering locked to retrograde.".
print "coasting to 17000m.".
wait until alt:radar < 17000.

unlock steering.
print "steering unlocked.".

wait until alt:radar < 400.
lock steering to heading(0,0).
toggle rcs.
print "steering locked to north.".

wait until alt:radar < 20.