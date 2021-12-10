#include "celestialbodies.inc"

#macro io_appears(c)
	jupiter(0.1, 5, 1)
	io(c, 0, 0.1, 1 - c * 0.2)
#end

#macro europa_appears(c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(c, 0, 0.1, 1 - c * 0.2)
#end

#macro ganymede_appears(c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(c, 0, 0.1, 1 - c * 0.2)
#end

#macro callisto_appears(c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(1, 0, 0.1, 0.8)
	callisto(c, 0, 0.1, 1 - c * 0.2)
#end

#macro revolution_start(c)
	jupiter(0.1, 5, 1)
	io(1, io_rev_angle, 0.1, 0.8)
	europa(1, europa_rev_angle, 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, 0.1, 0.8)
	callisto(1, callisto_rev_angle, 0.1, 0.8)
#end

#macro shadows(c)
	jupiter((1 - c) * 0.1, 5, 1)
	io(1, io_rev_angle, (1 - c) * 0.1, 0.8)
	europa(1, europa_rev_angle, (1 - c) * 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, (1 - c) * 0.1, 0.8)
	callisto(1, callisto_rev_angle, (1 - c) * 0.1, 0.8)
#end

#macro show_cone(c)
	jupiter(0, 5, 1 - c * 0.2)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro lengthen_cone(c)
	jupiter(0, 5 * exp(c / 2), 0.8)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

