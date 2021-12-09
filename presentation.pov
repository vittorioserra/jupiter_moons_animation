#include "colors.inc"
#include "textures.inc"



camera
{
        location <0, 750000, -750000>
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height
}
#declare sky_scale = 0.002;

//SUN unique light source
light_source
{
   	 <-778510000, 0 , 0>
   	 color White
   	 looks_like { sphere{<0,0,0> 1392700}}
}                                        

#declare io_radius_scaler = 0;
#declare europa_radius_scaler = 0;
#declare ganymede_radius_scaler = 0;
#declare callisto_radius_scaler = 0;         

#declare io_orbit_transmit = 1;
#declare europa_orbit_transmit = 1;
#declare ganymede_orbit_transmit = 1;
#declare callisto_orbit_transmit = 1;   

#declare final_orbit_transmit = 0.2;
#declare final_moon_scale=1;  

#declare io_rev_start = 40;
#declare europa_rev_start = 42;
#declare ganymede_rev_start = 44;
#declare callisto_rev_start = 46; 

#declare io_rev_omega = 10;
#declare europa_rev_omega = 8;
#declare ganymede_rev_omega = 4;
#declare callisto_rev_omega = 2;
                                   
#declare angle_step = 36;    
                           
                           
#declare jupiter_cone_transmit = 1;                           
                           
#declare cone_final_transmission = 0.2;      

#declare jupiter_radius = 150000; //km    

#declare light_ambient = 0.3;
#declare no_light_ambient = 0;

#declare all_objects_ambient = 0.3;                   
                                   

#switch (clock) // full turn on each axis
	#range(0,10)
	    //things to do in the first section : a) spere 1 should expand
		#declare io_radius_scaler = clock/10;  
		#declare io_orbit_transmit = io_orbit_transmit - (clock/10)*0.2;

	#break
	#range(10,20)
	    //things to do in the first section : a) spere 1 should expand
        #declare local_clock= clock -10;
		#declare europa_radius_scaler = local_clock/10;  
		#declare europa_orbit_transmit = europa_orbit_transmit - (local_clock/10)*0.2;   
		#declare io_radius_scaler = final_moon_scale; 
		#declare io_orbit_transmit = final_orbit_transmit;

	#break 
	#range(20,30)
	    //things to do in the first section : a) spere 1 should expand
        #declare local_clock = clock -20;
		#declare ganymede_radius_scaler = local_clock/10;   
		#declare ganymede_orbit_transmit = ganymede_orbit_transmit - (local_clock/10)*0.2;   
		#declare io_radius_scaler = final_moon_scale;   
		#declare europa_radius_scaler = final_moon_scale;  
		#declare io_orbit_transmit = final_orbit_transmit; 
		#declare europa_orbit_transmit = final_orbit_transmit;
   
	#break 
	#range(30,40)
	    //things to do in the first section : a) spere 1 should expand 
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
	
	
	#range(50,60)                          
	    #declare io_radius_scaler = final_moon_scale;     
		#declare europa_radius_scaler = final_moon_scale;     
		#declare ganymede_radius_scaler = final_moon_scale;  
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit; 
		#declare europa_orbit_transmit = final_orbit_transmit;  
		#declare ganymede_orbit_transmit = final_orbit_transmit;  
		#declare callisto_orbit_transmit = final_orbit_transmit;   
		
	    #declare local_clock = clock -50;         
	    
	    //#declare jupiter_cone_transmit = jupiter_cone_transmit - (local_clock/10)*0.2; 
	    #declare all_objects_ambient = all_objects_ambient - (local_clock/10)*light_ambient;
	#break
	
	
	#else 
	    #declare io_radius_scaler = final_moon_scale;     
		#declare europa_radius_scaler = final_moon_scale;     
		#declare ganymede_radius_scaler = final_moon_scale;  
		#declare callisto_radius_scaler = final_moon_scale;
		#declare io_orbit_transmit = final_orbit_transmit; 
		#declare europa_orbit_transmit = final_orbit_transmit;  
		#declare ganymede_orbit_transmit = final_orbit_transmit;  
		#declare callisto_orbit_transmit = final_orbit_transmit;
	
	#break  
	
	
#end


//ALL dimensions of the planets are reported in km

// Jupiter  

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
cone{ <0,0,0> ,jupiter_radius,<10*jupiter_radius,0,0>, 0 pigment{ color Blue transmit jupiter_cone_transmit}}                           


//Moons of Jupiter  


//Io


#if(clock > io_rev_start)
    
    #declare io_rev_clock = (clock - io_rev_start)/10;
    #declare io_rev_angle =  io_rev_omega * angle_step * io_rev_clock;     
#else
    #declare io_rev_angle = 0;
        
#end     

#if(clock > europa_rev_start)
    
    #declare europa_rev_clock = (clock - europa_rev_start)/10;
    #declare europa_rev_angle =  europa_rev_omega * angle_step * europa_rev_clock;
#else
    #declare europa_rev_angle = 0;
        
#end

#if(clock > ganymede_rev_start)
    
    #declare ganymede_rev_clock = (clock - ganymede_rev_start)/10;
    #declare ganymede_rev_angle =  ganymede_rev_omega * angle_step * ganymede_rev_clock; 
#else
    #declare ganymede_rev_angle = 0;
        
#end

#if(clock > callisto_rev_start)
    
    #declare callisto_rev_clock = (clock - callisto_rev_start)/10;
    #declare callisto_rev_angle =  callisto_rev_omega * angle_step * callisto_rev_clock;  
#else
    #declare callisto_rev_angle = 0;
        
#end

sphere
{       
        
        <-00000.0, 0,0> 7500 * io_radius_scaler
        texture { pigment{ image_map { png "Io.png" map_type 1 } } }
        rotate<0,io_rev_angle,0> 
        translate<-250000,0,0>   
        rotate<0,io_rev_angle,0>
        finish{ 
            ambient all_objects_ambient
            }
}      

torus {250000, 2000 pigment{ color Green transmit io_orbit_transmit}
finish{ 
            ambient all_objects_ambient
            }}  


//Europa
sphere
{
        <0,0,0> 7500 * europa_radius_scaler
        texture { pigment{ image_map { png "Europa.png" map_type 1} } }
        rotate<0,europa_rev_angle,0>    
        translate<-300000,0,0>  
        rotate<0,europa_rev_angle,0>
        finish{ 
            ambient all_objects_ambient
            } 
}     

torus {300000, 2000 pigment{ color Red transmit europa_orbit_transmit}
finish{ 
            ambient all_objects_ambient
            }} 

//Ganymede
sphere
{
        <0,0,0> 7500 * ganymede_radius_scaler
        texture { pigment{ image_map { png "ganymede.png" map_type 1 } } }
        rotate<0,ganymede_rev_angle,0>  
        translate<-400000,0,0>     
        
        rotate<0,ganymede_rev_angle,0> 
        rotate<+5, 0, 0>  
        finish{ 
            ambient all_objects_ambient
            }
}      

torus {400000, 2000 pigment{ color Blue transmit ganymede_orbit_transmit}
       rotate<+5,0,0> finish{ 
            ambient all_objects_ambient
            }} 

//Callisto
sphere
{
        <0,0,0> 7500 * callisto_radius_scaler
        texture { 

		pigment{
			//rgb<1,0,0>
			image_map { png "Callisto.png" map_type 1 } 
			} 
	}    
	    rotate<0,callisto_rev_angle,0>    
	    translate<-500000,0,0>
                    
        rotate<0,callisto_rev_angle,0>
        rotate<0,0,-10>
        finish{ 
            ambient all_objects_ambient
            }
}     

torus {500000, 2000 pigment{ color Orange transmit callisto_orbit_transmit}
       rotate <0,0,-10>
       finish{ 
            ambient all_objects_ambient
            }} 


// Sky 
sky_sphere
{
        pigment
        {
                crackle form <1,1,0> color_map { [.3 rgb 1] [.4 rgb 0] }
                scale sky_scale
        }
}   
