print "orbit.ks running now.".
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
set mnode to nextnode.
lock ap to ship:apoapsis.
lock steering to mnode.
wait until ship:periapsis > .9 * ap.
lock throttle to .2.
lock steering to retrograde.
wait until ship:periapsis > ap.
lock throttle to 0.
set ship:control:pilotmainthrottle to 0.
say("steering unlocked").
print "steering unlocked.".
wait .3.
print "SAS on.".
print " ".
wait .3.
print ">>> to continue run deorbit.ks <<<".
print " ".
sas on.