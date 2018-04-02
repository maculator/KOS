//	script/start/functions.ks
//
//	provides functions for script/start/start.ks

FUNCTION stagecheck {
//checks if there is a need to stage and fuel to do so.
	WHEN ship:maxthrust < 0.01 THEN {
		IF ship:liquidfuel > 1 or ship:solidfuel > 1 {
			stage.
			print "staged.".
		}
		ELSE {
			print "no fuel left".
		}
	}
}

FUNCTION asc {
//until target altitude is reached it'll point in a direction and hold an angle.
//will break when apoapsis is at desired altitude. having apo@ 70k is a bad idea.
	parameter talt, dir, ang, apo.
	
	UNTIL ship:altitude > talt {
		lock steering to heading(dir, ang).
		stagecheck().
		if ship:apoapsis >= apo {
			break.
		}
		wait .1.
	}
	print "passed " + round(talt) * .001 + "km.".
}

FUNCTION start {
//profile for asc() holds all the parameters and could be a list in the future.
	parameter dir, apo.

	asc(1000,	dir, 90, apo).
	asc(2000,	dir, 85, apo).
	asc(4000,	dir, 70, apo).
	asc(7500,	dir, 60, apo).
	asc(10000,	dir, 45, apo).
	asc(20000,	dir, 35, apo).
	asc(30000,	dir, 25, apo).
	asc(40000,	dir, 20, apo).
	asc(apo,		dir,  0, apo).
}
