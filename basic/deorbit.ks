//	script/basic/deorbit.ks
//
//	only locks steering to retrograde until altitude is below 8km.

//locking steering to retrograde.
sas off.
lock steering to ship:retrograde.

print "steering locked to retrograde.".
print "please perform deorbit burn.".
print "please stage chutes.".
print "don't forget antennas, etc..".
print "steering will unlock below 8000m.".

//waiting.
wait until alt:radar < 8000.

//unlocking steering
set ship:control:pilotmainthrottle to 0.

print "steering unlocked.".
print "bye bye.".