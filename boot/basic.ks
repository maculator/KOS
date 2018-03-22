//	script/boot/basic.ks
//
//	sets up terminal.
//	loads	script/basic/:	functions.ks,
//						start.ks,
//						orbit.ks,
//						deorbit.ks	to the vessel.
//	prints brief help to the terminal.

//setting up terminal.
clearscreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
set terminal:width to 40.
set terminal:height to 53.
set terminal:brightness to 1.

//copying files to vessel.
copypath("0:/basic/functions.ks","1:/functions.ks").
copypath("0:/basic/start.ks","1:/start.ks").
copypath("0:/basic/orbit.ks","1:/orbit.ks").
copypath("0:/basic/deorbit.ks","1:/deorbit.ks").
list files.

//printing brief help to terminal.
print "how to use:".
print " ".
print "run start(heading, ap in km).".
print "|puts you in suborbital trajectory.".
print "-".
print "run orbit.".
print "|holds ship to node.".
print "|cuts throttle when orbit achieved.".
print "-".
print "run deorbit.".
print "|holds retrograde.".
print "|until below 8km.".
print "-".