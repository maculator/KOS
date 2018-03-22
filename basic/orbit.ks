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
print ">>> USER HAS TO CONTROL THROTTLE UP <<<".
print ">>> PROGRAM WILL CUT THROTTLE ONLY  <<<".
sas off.
set mnode to nextnode.
lock steering to mnode.
wait until ship:periapsis > 60000.
lock throttle to .2.
wait until ship:periapsis > 70000.
lock throttle to 0.
wait 1.
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