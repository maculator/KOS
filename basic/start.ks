//	script/basic/start.ks
//
//	uses script/basic/functions.ks to put together an automated ascent until target apoapsis.

//loading script/basic/functions.ks
run functions.

//demanding/converting parameters
parameter dir, apo0.
set apo to apo0 * 1000.
print "apoapsis set to " + apo0 + "km.".

//turning off SAS and passing parameters to start().
sas off.
start(dir, apo).

//finalizing.
print "suborbital trajectory achieved.".
set ship:control:pilotmainthrottle to 0.
sas on.