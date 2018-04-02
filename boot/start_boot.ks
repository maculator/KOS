//	script/boot/basic.ks
//
//	sets up terminal.
//	loads	script/start/:	functions.ks,
//							start.ks,	to the vessel.
//	prints brief help to the terminal.

//setting up terminal.
clearscreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
set terminal:charheight to 18.
set terminal:width to 40.
set terminal:height to 22.
set terminal:brightness to 1.
copypath("0:/start/start.ks","1:/start.ks").
copypath("0:/start/functions.ks","1:/functions.ks").
list.
