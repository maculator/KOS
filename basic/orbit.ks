//	script/basic/orbit.ks
//
//	holds ship pointed to node and cuts throttle when orbit is ~circular.


//setting up variables.
set mnode to nextnode.
set apo to ship:apoapsis.

//locking controls.
sas off.
lock steering to mnode.

print "steering locked on node.".
print "remember to THROTTLE UP.".

//recalibrating on closing in on AP.
wait until ship:periapsis >= apo * .9.
lock throttle to .2.
set apo to ship:apoapsis.

//finalizing.
wait until ship:periapsis >= apo * .99.
lock throttle to 0.

//handing back controls.
wait 1.
set ship:control:pilotmainthrottle to 0.
sas on.

print "orbit achieved.".