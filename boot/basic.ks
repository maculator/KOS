clearscreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
set terminal:width to 50.
set terminal:height to 50.
set terminal:brightness to 1.
wait .3.
print "booting.".
print " ".
wait .3.
print "loading files".
print " ".
wait .3.
copypath("0:/basic/functions.ks","1:/functions.ks").
copypath("0:/basic/start.ks","1:/start.ks").
copypath("0:/basic/orbit.ks","1:/orbit.ks").
copypath("0:/basic/deorbit.ks","1:/deorbit.ks").
list files.
print " ".
wait .3.
print "loading functions.".
run functions.
wait .5.
print "functions loaded.".
print " ".
wait .5.
print "ready.".
print " ".
say("ready").
print " ".
wait .5.
print ">>> to continue run start(heading) <<<".
print " ".