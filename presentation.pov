#version 3.7;
global_settings { assumed_gamma 1 }


#include "colors.inc"
#include "textures.inc"


//TODO - Alessio : Make orbits shadowless [DONE], improve their lighting when changing ambient parameter [DONE]

//all dimensions in km
//Jupiter and Sun radii, as well as distance between one another rounded to closest 100.000km
//Moons not to scale, orbital inclinations and radii only roughly representative and not precise 
//all revolutions and tidal rotations have negative angle increases

// Texture levels are:
// '1': Full high res textures
// '2': Low res textures
// '3': No textures, solid colors
//
// It is recommended to set it in the .ini file as:
// Declare=texture_level=X
#include "celestialtextures.inc"

//keep orbits circular, no time for explaining Kepler's laws in 120 secs


#declare camera_x_pos = 0;
#declare camera_y_pos = 750000;
#declare camera_z_pos = -750000;

/*
camera
{
        location <camera_x_pos, camera_y_pos, camera_z_pos>
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height
} 
*/  
     
//camera_moveable(0, 750000, -750000)

//Sun, unique light source
light_source
{
   	 <-778510000, 0 , 0> //real mean sun-jupiter distance in km
   	 color White
   	 looks_like { sphere{<0,0,0> 1392700}} //real sun radius in km
}

//scale of the sky-sphere in which the animation is set
#declare sky_scale = 0.01;
sky_sphere
{
       pigment
       {
                crackle form <1,1,0> color_map { [.3 rgb 1] [.4 rgb 0] }
                scale sky_scale
        }
}

//scaler parameter needed to make the moons appear in the animation
#declare io_radius_scaler = 0;
#declare europa_radius_scaler = 0;
#declare ganymede_radius_scaler = 0;
#declare callisto_radius_scaler = 0;

//transmission parameters for the orbit-highliting tori
#declare io_orbit_transmit = 1;
#declare europa_orbit_transmit = 1;
#declare ganymede_orbit_transmit = 1;
#declare callisto_orbit_transmit = 1;   

#declare final_orbit_transmit = 0.2;
#declare final_moon_scale = 1;

//parameters for the shadow-cone highliting
#declare jupiter_cone_transmit = 1;
#declare jupiter_cone_final_transmit = 0.2;      
//#declare jupiter_shadow_cone_length = 5 * jupiter_radius;
//#declare jupiter_shadow_cone_final_length = 1000*jupiter_radius;

//parameter to have "smooth" shadows and make the audience understand the shadowing
//concept gradually
#declare light_ambient = 0.1;
#declare no_light_ambient = 0;
#declare all_objects_ambient = 0.1;

#include "animation_framework.inc"
#include "stages.inc"

animation_start()

animation_persistent_register_value("jupi_rot", -90)
animation_persistent_load_values()

animation_step("jupiter_front_stationary", 1.3)
animation_step("jupiter_reach_orbit_insertion_visual", 1)
/*#debug "01\n"
animation_step_begin(1, local_clock)
#debug "02\n"
#declare jupiter_rev_angle = -36 * easeInSine(local_clock);
jupiter_front_stationary(local_clock)
animation_step_end()
#debug "03\n"

animation_step_begin(1, local_clock)
#debug "04\n"
#debug concat("clock: ", str(clock, 0, 3), ", dur: ", str(animation_step_duration, 0, 3), ", local_clock: ", str(local_clock, 0, 3))
#declare jupiter_rev_angle = -36 * local_clock;
jupiter_reach_orbit_insertion_visual(local_clock)
animation_step_end()
#debug "05\n"
*/
animation_step("io_appears", 1)
animation_step("europa_appears", 1)
animation_step("ganymede_appears", 1)
animation_step("callisto_appears", 1)
animation_step("jupiter_reach_orbit_visual", 1)
animation_step("pause_orbit_visual", 1)

// Calculate revolution parameters
/*
#if (clock >= animation_framework_current_stage)
	#declare c = clock - animation_framework_current_stage;
	//clock by which the revolution of the galilean satellites will start
	//temporal offset due to scenic reasons. Making them all start at the same
	//time gives the false impression of "simmetry" and indirectly of simplicity
	//of the conducted study
	#local io_rev_delay = 0;
	#local europa_rev_delay = 0.2;
	#local ganymede_rev_delay = 0.4;
	#local callisto_rev_delay = 0.66;
	#local spinup_time = 0.5;
	
	//angular speeds of the Galilean satellites, not to correct scale
	//TODO - Vittorio : correct ratios between omegas
	#local io_rev_omega = 10;
	#local europa_rev_omega = 8;
	#local ganymede_rev_omega = 4;
	#local callisto_rev_omega = 2;
	
	//starting revolution section, ATTENTION : Tidal lock is already represented
	//TODO - Alessio : make transition smoother, reduce jerk
	// #if ((c > io_rev_delay) & (c >= (io_rev_delay + spinup_time))) // revolution spin-up
	// 	#declare io_rev_angle = io_rev_angle + (-io_rev_omega) * easeInSine(c - io_rev_delay) * 36;
	// #end
	#if (c > (io_rev_delay + spinup_time)) // constant rotation regime
		#declare io_rev_angle =  io_rev_angle + (-io_rev_omega) * (c - io_rev_delay) * 36;
	#elseif(c > io_rev_delay)
		#declare io_rev_angle =  io_rev_angle + (-io_rev_omega) * easeInSine((c - io_rev_delay) / spinup_time) * (c - io_rev_delay) * 36;
	#end

	#if (c > (europa_rev_delay + spinup_time)) // constant rotation regime
		#declare europa_rev_angle =  europa_rev_angle + (-europa_rev_omega) * (c - europa_rev_delay) * 36;
	#elseif(c > europa_rev_delay)
		#declare europa_rev_angle =  europa_rev_angle + (-europa_rev_omega) * easeInSine((c - europa_rev_delay) / spinup_time) * (c - europa_rev_delay) * 36;
	#end

	#if (c > (ganymede_rev_delay + spinup_time)) // constant rotation regime
		#declare ganymede_rev_angle =  ganymede_rev_angle + (-ganymede_rev_omega) * (c - ganymede_rev_delay) * 36;
	#elseif(c > ganymede_rev_delay)
		#declare ganymede_rev_angle =  ganymede_rev_angle + (-ganymede_rev_omega) * easeInSine((c - ganymede_rev_delay) / spinup_time) * (c - ganymede_rev_delay) * 36;
	#end

	#if (c > (callisto_rev_delay + spinup_time)) // constant rotation regime
		#declare callisto_rev_angle =  callisto_rev_angle + (-callisto_rev_omega) * (c - callisto_rev_delay) * 36;
	#elseif(c > callisto_rev_delay)
		#declare callisto_rev_angle =  callisto_rev_angle + (-callisto_rev_omega) * easeInSine((c - callisto_rev_delay) / spinup_time) * (c - callisto_rev_delay) * 36;
	#end

#end
*/

//animation_step("revolution_start", 1)
/*
animation_step("pause_moon_orbit_perspective", 1)
animation_step("shadows", 1)
animation_step("pause_shadows_perspective", 1)
animation_step("show_cone", 1)
animation_step("lengthen_cone", 1)
animation_step("pause_visual_cone", 1)
animation_step("fade_out_cone", 1)
animation_step("jupiter_reach_transit_visual", 1)
animation_step("exit_scene", 1)
animation_step("fade_orbits", 1)
animation_step("exit_stationary", 1)
animation_step("exit_stationary", 1)
*/
animation_persistent_save_values()
