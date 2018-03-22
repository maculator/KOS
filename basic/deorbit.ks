print "deorbit.ks running now.".
print " ".
wait .3.
print "loading functions.".
run functions.
wait .5.
print "functions loaded.".
print " ".
wait .3.
print "SAS off.".
wait .3.
print "steering locked.".
print " ".
say("steering locked").
sas off.
lock steering to ship:retrograde.
say("steering locked").
wait 10.
print "burning.".
print " ".
lock throttle to 1.
UNTIL ship:liquidfuel < 0.1 {
	IF stage:liquidfuel < 0.1 {wait 1. stage.}
	wait .2.
}
print "hitting stage 10x.".
print " ".
lock throttle to 0.
FROM {local x is 0.} UNTIL x = 10 STEP {set x to x + 1.} DO {
	stage.
	wait .2.
}
print "coasting to < 5000.".
print " ".
wait until alt:radar < 5000.
set ship:control:pilotmainthrottle to 0.
say("steering unlocked").
print "steering unlocked.".
wait .3.
print ">>> landing soon <<<".
print " ".
say("landing soon").