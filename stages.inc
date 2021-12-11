#include "celestialbodies.inc" 
#include "camera.inc"

#macro jupiter_front_stationary(c)
    camera_stationary(-1060660.171, 0, 0, c)  
    //camera_moveable(0, 750000, -750000)
    jupiter(0.1, 5, 1) 
#end

#macro jupiter_reach_orbit_visual(c) 
  //camera_move_angle_equidistant(45,90,-1060660.171,0,0,c)
  camera_move_straight_cubic(<-1060660.171, 0, 0>, <0, 750000, -750000> ,c) 
  jupiter(0.1, 5, 1)
#end

#macro io_appears(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0.1, 5, 1)
	io(c, 0, 0.1, 1 - c * 0.2)
#end

#macro europa_appears(c) 
    camera_stationary(0, 750000, -750000,c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(c, 0, 0.1, 1 - c * 0.2)
#end

#macro ganymede_appears(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(c, 0, 0.1, 1 - c * 0.2)
#end

#macro callisto_appears(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(1, 0, 0.1, 0.8)
	callisto(c, 0, 0.1, 1 - c * 0.2)
#end

#macro revolution_start(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0.1, 5, 1)
	io(1, io_rev_angle, 0.1, 0.8)
	europa(1, europa_rev_angle, 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, 0.1, 0.8)
	callisto(1, callisto_rev_angle, 0.1, 0.8)
#end

#macro shadows(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter((1 - c) * 0.1, 5, 1)
	io(1, io_rev_angle, (1 - c) * 0.1, 0.8)
	europa(1, europa_rev_angle, (1 - c) * 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, (1 - c) * 0.1, 0.8)
	callisto(1, callisto_rev_angle, (1 - c) * 0.1, 0.8)
#end

#macro show_cone(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0, 5, 1 - c * 0.2)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro lengthen_cone(c)
    camera_stationary(0, 750000, -750000,c)
	jupiter(0, 5 * exp(c / 2), 0.8)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end   

