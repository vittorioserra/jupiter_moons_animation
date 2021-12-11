#include "celestialbodies.inc" 
#include "camera.inc"

#macro jupiter_front_stationary(c)
    camera_stationary(-1060660.171, 0, 0, c)  
    jupiter(0.1, 5, 1) 
#end

#macro jupiter_reach_orbit_visual(c) 
    camera_move_straight_cubic(<-1060660.171, 100000, -300000>, <0, 750000, -750000>, c) //0,0
    jupiter(0.1, 5, 1)
    io(1, 0, 0.1, 0.8)
    europa(1, 0, 0.1, 0.8)
    ganymede(1, 0, 0.1, 0.8)
    callisto(c, 0, 0.1, 0.8)
#end

#macro jupiter_reach_orbit_insertion_visual(c) 
    camera_move_straight_cubic(<-1060660.171, 0, 0>,<-1060660.171, 100000, -300000>, c)
    jupiter(0.1, 5, 1) 
#end   

#macro pause_orbit_visual(c)
    camera_stationary(0, 750000, -750000, c)  
    jupiter(0.1, 5, 1)
    io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(1, 0, 0.1, 0.8)
	callisto(c, 0, 0.1, 1 - c * 0.2)
#end

#macro io_appears(c)
    camera_stationary(-1060660.171, 100000, -300000, c)
	jupiter(0.1, 5, 1)
	io(c, 0, 0.1, 1 - c * 0.2)
#end

#macro europa_appears(c) 
    camera_stationary(-1060660.171, 100000, -300000, c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(c, 0, 0.1, 1 - c * 0.2)
#end

#macro ganymede_appears(c)
    camera_stationary(-1060660.171, 100000, -300000, c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(c, 0, 0.1, 1 - c * 0.2)
#end

#macro callisto_appears(c)
    camera_stationary(-1060660.171, 100000, -300000, c)
	jupiter(0.1, 5, 1)
	io(1, 0, 0.1, 0.8)
	europa(1, 0, 0.1, 0.8)
	ganymede(1, 0, 0.1, 0.8)
	callisto(c, 0, 0.1, 1 - c * 0.2)
#end

#macro revolution_start(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0.1, 5, 1)
	io(1, io_rev_angle, 0.1, 0.8)
	europa(1, europa_rev_angle, 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, 0.1, 0.8)
	callisto(1, callisto_rev_angle, 0.1, 0.8)
#end

#macro pause_moon_orbit_perspective(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0.1, 5, 1)
	io(1, io_rev_angle, 0.1, 0.8)
	europa(1, europa_rev_angle, 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, 0.1, 0.8)
	callisto(1, callisto_rev_angle, 0.1, 0.8)
#end

#macro shadows(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter((1 - c) * 0.1, 5, 1)
	io(1, io_rev_angle, (1 - c) * 0.1, 0.8)
	europa(1, europa_rev_angle, (1 - c) * 0.1, 0.8)
	ganymede(1, ganymede_rev_angle, (1 - c) * 0.1, 0.8)
	callisto(1, callisto_rev_angle, (1 - c) * 0.1, 0.8)
#end

#macro pause_shadows_perspective(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro show_cone(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0, 5, 1 - c * 0.2)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro lengthen_cone(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0, 5 * exp(c / 2), 0.8)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end   

#macro pause_visual_cone(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0, 5 * exp(0.5), 0.8)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro fade_out_cone(c)
    camera_stationary(0, 750000, -750000, c)
	jupiter(0, 5 * exp(0.5), 0.8 + c*0.2)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end 

#macro jupiter_reach_transit_visual(c) 
  camera_move_straight_cubic(<0, 750000, -750000>, <-1060660.171, 100000, -300000>, c) 
  	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end   

#macro jupiter_pause_transit_visual(c) 
    camera_stationary(-1060660.171, 100000, -300000, c) 
  	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end

#macro exit_scene(c) 
    camera_move_straight_cubic(<-1060660.171, 100000, -300000>,<1060660.171, 300000, -300000>, c) 
  	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 0.8)
	europa(1, europa_rev_angle, 0, 0.8)
	ganymede(1, ganymede_rev_angle, 0, 0.8)
	callisto(1, callisto_rev_angle, 0, 0.8)
#end   

#macro fade_orbits(c) 
    camera_stationary(1060660.171, 300000, -300000, c)  
  	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 0.8 + c * 0.2)
	europa(1, europa_rev_angle, 0, 0.8 +  c * 0.2)
	ganymede(1, ganymede_rev_angle, 0, 0.8 + c * 0.2)
	callisto(1, callisto_rev_angle, 0, 0.8 + c * 0.2)
#end

#macro exit_stationary(c) 
    camera_stationary(1060660.171, 300000, -300000, c)  
  	jupiter(0, 5, 1)
	io(1, io_rev_angle, 0, 1.0)
	europa(1, europa_rev_angle, 0, 1.0)
	ganymede(1, ganymede_rev_angle, 0, 1.0)
	callisto(1, callisto_rev_angle, 0, 1.0)
#end