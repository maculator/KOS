FUNCTION say {
	parameter text.
	hudtext("KOS: " + text, 5, 2, 30, green, true).
}
FUNCTION stagecheck {
	WHEN ship:maxthrust < 0.01 THEN {
		IF ship:liquidfuel > 1 or ship:solidfuel > 1 {
			stage.
			print "stage seperated.".
			print " ".
		} ELSE {
			print "out of fuel.".
			print " ".
			say("ascent failed").
		}
	}
}
GLOBAL FUNCTION asc {
	parameter talt, dir, ang.
	UNTIL ship:altitude > talt {
		lock steering to heading(dir, ang).
		stagecheck().
		if ship:apoapsis > 71000 {
			break.
		}
		wait .1.
	}
	print "passed " + .001 * (round(talt)) + "km.".
	print " ".
}
GLOBAL FUNCTION start {
	parameter dir.
	sas off.
	asc(1000,	dir, 90).
	asc(2000,	dir, 80).
	asc(5000,	dir, 65).
	asc(10000,	dir, 45).
	asc(20000,	dir, 30).
	asc(30000,	dir, 25).
	asc(40000,	dir, 20).
	Until ship:apoapsis > 71000 {
		lock steering to heading(dir, 0).
		stagecheck().
		wait .1.
	}
	set ship:control:pilotmainthrottle to 0.
	sas on.
	print "suborbital trajectory achieved.".
	print " ".
	say("suborbital trajectory achieved").
	wait 0.5.
	print ">>> to continue set node and run orbit <<<".
}