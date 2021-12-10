#include "colors.inc"
#include "textures.inc"

//TODO - Alessio : Make orbits shadowless, improve their lighting when changing ambient parameter


//all dimensions in km
//Jupiter and Sun raddi, as well as distance between one another rounded to closest 100000km
//Moons not to scale, orbital inclinations and radii only roughly represntative and not precise 
//all revolutions and tidial rotations have negative angle increases

//keep orbits circular, no time for explaining Kepler's laws in 120 secs


camera
{
        location <0, 750000, -750000>
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height
}  


//Sun, unique light source
light_source
{
   	 <-778510000, 0 , 0> //real mean sun-jupiter distance in km
   	 color White
   	 looks_like { sphere{<0,0,0> 1392700}} //real sun radius in km
}      

//scale of the sky-sphere in which the animation is set
#declare sky_scale = 0.002;

//scaler parameter needed to make the moos appear in the animation
#declare io_radius_scaler = 0;
#declare europa_radius_scaler = 0;
#declare ganymede_radius_scaler = 0;
#declare callisto_radius_scaler = 0;

//transmission parameters for the orbit-highliting toruses
#declare io_orbit_transmit = 1;
#declare europa_orbit_transmit = 1;
#declare ganymede_orbit_transmit = 1;
#declare callisto_orbit_transmit = 1;   

#declare final_orbit_transmit = 0.2;
#declare final_moon_scale=1;

//clock bny which the revolution of the galilean satellites will start
//temporal offset due to scenic reson. Making them all start at the same
//time gives the false impression of "simmetry" and indirectly of simplicity
//of the conducted study
#declare io_rev_start = 40;
#declare europa_rev_start = 42;
#declare ganymede_rev_start = 44;
#declare callisto_rev_start = 46; 

//angular speeds of the Galilean satellites, not to correct scale
//TODO - Vittorio : correct ratios between omegas
#declare io_rev_omega = 10;
#declare europa_rev_omega = 8;
#declare ganymede_rev_omega = 4;
#declare callisto_rev_omega = 2;

//correlation parameter beteween clock-cycles and revolution speed arounf jupiter
#declare angle_step = 36;

//jovian radius
#declare jupiter_radius = 150000; 


//parameters for the shadow-cone highliting
#declare jupiter_cone_transmit = 1;
#declare cone_final_transmission = 0.2;      
#declare jupiter_shadow_cone_length = 5*jupiter_radius;
#declare jupiter_shadow_cone_final_length = 1000*jupiter_radius;


//parameter to have "smooth" shadows and make the audience understand the shadowing
//concept gradually
#declare light_ambient = 0.1;
#declare no_light_ambient = 0;
#declare all_objects_ambient = 0.1;   



#switch (clock)
	#range(0,10)
	    //things to do in the first section : a) Io appears, orbit phases-out from transparency
		#declare io_radius_scaler = clock/10;
		#declare io_orbit_transmit = io_orbit_transmit - (clock/10)*0.2;
	#break
	
	#range(10,20)
	    //things to do in the second section : a) Europa appears, orbit phases-out from transparency
        #declare local_clock= clock -10;
		#declare europa_radius_scaler = local_clock/10;
		#declare europa_orbit_transmit = europa_orbit_transmit - (local_clock/10)*0.2;
		#declare io_radius_scaler = final_moon_scale; 
		#declare io_orbit_transmit = final_orbit_transmit;
	#break  
	
	#range(20,30)
	    //things to do in the third section : a) Ganymede appears, orbit phases-out from transparency
        #declare local_clock = clock -20;
		#declare ganymede_radius_scaler = local_clock/10;
		#declare ganymede_orbit_transmit = ganymede_orbit_transmit - (local_clock/10)*0.2;   
		#declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
	#break
	 
	#range(30,40)
	    //things to do in the fourth section : a) Callisto appears, orbit phases-out from transparency 
	    #declare local_clock = clock -30;
		#declare callisto_radius_scaler = local_clock/10; 
		#declare callisto_orbit_transmit = callisto_orbit_transmit - (local_clock/10)*0.2;
		#declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
	#break  
	  
	#range(40,50)
	    //things to do in the fifth section : a) moons start to revolve around Jupiter, while tidially locked
	    #declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
		#declare callisto_orbit_transmit = final_orbit_transmit;
	#break
	
	// TODO - Vittorio (+ Alessio) : incline the orbital planes gradually, It can cost time, maybe going over 120 sec frame.
	//Assess the latter  

	#range(50,60)
	    //things to do in the fifth section : a) shadows get realistic, audience starts to get the concept that
	    //the Galilean satellites disappear behind jupiter and cast a shadow on it
	    //No need in explaining the nuances of phases and complex phenomena given the 120 sec timeframe, but 
	    //maybe nice and neat to implement in a longer video
	    #declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
		#declare callisto_orbit_transmit = final_orbit_transmit;
		
	    #declare local_clock = clock -50;
	    #declare all_objects_ambient = all_objects_ambient - (local_clock/10)*light_ambient;
	#break       
		
	#range(60,70)//things to do in the fifth section : a) shadow-cone highlightment phases out of transparency
	    #declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
		#declare callisto_orbit_transmit = final_orbit_transmit;
		#declare all_objects_ambient = no_light_ambient;
		
		#declare local_clock = clock -60;
		#declare jupiter_cone_transmit = jupiter_cone_transmit - (local_clock/10)*0.2;
	#break
	
	//TODO - Alessio : introduce Jerk on shadw cone. I suppose between these two steps it would be perfect, also Sun can be moved around (+/- 10°?)
	//This section is particularly good to illustrate something different than the Jovian-equinox scenario, displaying an orbit, as in the precession
	//video too complex for two minutes I guess
	
	#range(70,80)
	    //things to do in the fifth section : a) shadow-cone highlightment gets stretched, putting the vertex progressively more
	    //far away. Exponential is perfect, needs to be finer tough. Audience gets the idea that it is a shadow-cone
	    //TODO - Vittorio : make strechnig finer, at least at the beginning, exponential function seems top be the right confept for now
	    #declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
		#declare callisto_orbit_transmit = final_orbit_transmit;
		#declare all_objects_ambient = no_light_ambient;
		#declare jupiter_cone_transmit = cone_final_transmission;
		
		#declare local_clock = clock -70;
		#declare jupiter_shadow_cone_length = 5*jupiter_radius *exp(local_clock/2);
	#break       
    
    //TODO - Alessio + Vittorio : Animation 0 : get to Jupiter from overall frame, represent also the Sun in the same frame
    //TODO - Alessio : camera angles for section 1-4 --> profile angle to get the concept of orbital inclination in the jovian system
    //TODO - Alessio : from section 5 --> switch to camera angle where shadow concept of the orbits can be seen well enough, among 
    //with jerk of shadow-cone
    //TODO - Alessio + Vittorio : Conclusive camera angle to show that shadows can be cast on Jupiter by the satellites
	
	#else 
	    #declare io_radius_scaler = final_moon_scale;
		#declare europa_radius_scaler = final_moon_scale;
		#declare ganymede_radius_scaler = final_moon_scale;
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit;
		#declare europa_orbit_transmit = final_orbit_transmit;
		#declare ganymede_orbit_transmit = final_orbit_transmit;
		#declare callisto_orbit_transmit = final_orbit_transmit;
		#declare all_objects_ambient = no_light_ambient;
		#declare jupiter_cone_transmit = jupiter_cone_final_transmit;
	    #declare jupiter_shadow_cone_length; = jupiter_shadow_cone_final_length;
	
	#break
	
	//TODO - Alessio + Vittorio : Closing
	
		
#end

// Jupiter 
// TODO - Alessio : Jupiter rotation jerk reductiuon
sphere
{
        <0,0,0> 150000
        texture { pigment{ image_map { png "4kjupiter.png" map_type 1 } } }
        rotate<0,-90,0>
        rotate<0,-36*clock/10,0>
        finish{ 
            ambient all_objects_ambient
            }
} 
//shadow-cone highliting
cone{ <0,0,0> ,jupiter_radius,<jupiter_shadow_cone_length,0,0>, 0 pigment{ color Blue transmit jupiter_cone_transmit}}


//Moons of Jupiter
//not all orbital planes have the same inclination, and not all all inclined on the same axis, this shuld roughly give the
//idea of the different orbital planes to the audience
 

//starting revolution section, ATTENTION : Tidial lock is already represented
//TODO - Alessio : make transition smoother, reduce jerk
#if(clock > io_rev_start)
    #declare io_rev_clock = (clock - io_rev_start)/10;
    #declare io_rev_angle =  -io_rev_omega * angle_step * io_rev_clock;
#else
    #declare io_rev_angle = 0;
#end     

#if(clock > europa_rev_start)
    #declare europa_rev_clock = (clock - europa_rev_start)/10;
    #declare europa_rev_angle =  -europa_rev_omega * angle_step * europa_rev_clock;
#else
    #declare europa_rev_angle = 0;
#end

#if(clock > ganymede_rev_start)
    #declare ganymede_rev_clock = (clock - ganymede_rev_start)/10;
    #declare ganymede_rev_angle =  -ganymede_rev_omega * angle_step * ganymede_rev_clock; 
#else
    #declare ganymede_rev_angle = 0;
#end

#if(clock > callisto_rev_start)
    #declare callisto_rev_clock = (clock - callisto_rev_start)/10;
    #declare callisto_rev_angle =  -callisto_rev_omega * angle_step * callisto_rev_clock;  
#else
    #declare callisto_rev_angle = 0;
#end
 
//Io
sphere
{       
        <-00000.0, 0,0> 7500 * io_radius_scaler
        texture { pigment{ image_map { png "Io.png" map_type 1 } } }
        rotate<0,io_rev_angle,0> //tidial lock
        translate<-250000,0,0>   
        rotate<0,io_rev_angle,0> //revolution
        finish{ambient all_objects_ambient}
}      
//orbit
torus {250000, 2000 pigment{ color Green transmit io_orbit_transmit}
       finish{ambient all_objects_ambient}
}  


//Europa
sphere
{
        <0,0,0> 7500 * europa_radius_scaler
        texture { pigment{ image_map { png "Europa.png" map_type 1} } }
        rotate<0,europa_rev_angle,0> //tidial lock rotation   
        translate<-300000,0,0>
        rotate<10,0,0>  
        rotate<0,europa_rev_angle,0> //revolution
        finish{ambient all_objects_ambient} 
}     
//orbit
torus {300000, 2000 pigment{ color Red transmit europa_orbit_transmit}
      finish{ambient all_objects_ambient}
} 

//Ganymede
sphere
{
        <0,0,0> 7500 * ganymede_radius_scaler
        texture { pigment{ image_map { png "ganymede.png" map_type 1 } } }
        rotate<0,ganymede_rev_angle,0> //tidial lock rotation 
        translate<-400000,0,0>     
        rotate<0,ganymede_rev_angle,0> //revolution
        rotate<+5, 0, 0>               //orbital plane inclination
        finish{ambient all_objects_ambient}
}      
//orbit
torus {400000, 2000 pigment{ color Blue transmit ganymede_orbit_transmit}
       rotate<+5,0,0> finish{ambient all_objects_ambient}
} 

//Callisto
//Open Issue : represent high inclination and eclipse miss ? better to do with cone jerk
sphere
{
        <0,0,0> 7500 * callisto_radius_scaler
        texture { 
		pigment{image_map { png "Callisto.png" map_type 1 } } }    
	    rotate<0,callisto_rev_angle,0> //tidial lock rotation   
	    translate<-500000,0,0>
        rotate<0,callisto_rev_angle,0> //revolution
        rotate<0,0,-10>                //orbital plane inclination
        finish{ambient all_objects_ambient}
}     
//orbit
torus {500000, 2000 pigment{ color Orange transmit callisto_orbit_transmit}
       rotate <0,0,-10>
       finish{ambient all_objects_ambient}
} 


// Sky 
sky_sphere
{
        pigment
        {
                crackle form <1,1,0> color_map { [.3 rgb 1] [.4 rgb 0] }
                scale sky_scale
        }
}   
