clearscreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
set terminal:charheight to 16.
set terminal:width to 25.
set terminal:height to 10.
set terminal:brightness to 1.

if alt:radar < 10 {

	print "we're landed... bye.".
	wait 2.
	shutdown.
	
}else{
	sas off.
	set alt_t to ship:altitude.
	set WhyDoesItHaveToBeThatComplicated to ship:bearing * -1.
	set angle to 0.
	lock steering to Heading(WhyDoesItHaveToBeThatComplicated, angle).
	set checkidicheck to "nothing".
	
	until false {
	
		clearscreen.
		print "target altitude: " + round(alt_t) + "m".
		
		if ship:altitude > (alt_t - 250) and ship:altitude < (alt_t + 250) {
		
			if checkidicheck = "nothing" {

				print "hold".
				lock steering to heading(WhyDoesItHaveToBeThatComplicated, angle).

			}else{
			
				if checkidicheck = "up" {
				
					set angle to angle - .5.
					print "damped down".
					lock steering to heading(WhyDoesItHaveToBeThatComplicated, angle).
					set checkidicheck to "nothing".
				}						
				if checkidicheck = "down" {
			
					set angle to angle + .5.
					print "damped up " + angle.
					lock steering to heading(WhyDoesItHaveToBeThatComplicated, angle).
					set checkidicheck to "nothing".
				}
			}
			
		}else{
			
			if ship:altitude > (alt_t + 250) {
		
				set angle to angle - .5.
				set checkidicheck to "down".
				lock steering to heading(WhyDoesItHaveToBeThatComplicated, angle).
				print "down " + angle.
			
			}else{
		
				set angle to angle + .5.
				set checkidicheck to "up".
				lock steering to heading(WhyDoesItHaveToBeThatComplicated, angle).
				print "up " + angle.
			
			}
		}
		
		print "wait".
		wait 20.
		
	}
	
}