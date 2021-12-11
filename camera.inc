#macro camera_moveable(x_pos, y_pos, z_pos)
    camera
    {
        location <x_pos, y_pos, z_pos>
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height
    }       
#end   

#macro camera_stationary(x_pos, y_pos, z_pos, c)
    camera_moveable(x_pos, y_pos, z_pos)     
#end    

#declare epsilon = 0.1;

#macro camera_move_angle_equidistant(theta, phi, x_start, y_start, z_start, c) 

    #declare r = sqrt(pow(x_start,2) + pow(y_start,2) + pow(z_start,2));
    #declare r_x_phi = r*sin(phi*c);
    #declare r_y_phi = 0;
    #declare r_z_phi = r*cos(phi*c); 
    
    #declare x_c = r_z_phi + x_start;
    #declare y_c = r_y_phi + y_start;
    #declare z_c = r_z_phi + z_start;
    
    camera
    {
        location <x_c, y_c, z_c>
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height  
        rotate<0,phi*c,-theta*c>
    }    
#end   

#macro camera_move_linear(x_start, y_start, z_start, x_end, y_end, z_end, c) 
   
    #declare x_diff = (x_end - x_start);
    #declare y_diff = (y_end - y_start);
    #declare z_diff = (z_end - z_start);
      
    #declare x_c = x_start + x_diff*c;
    #declare y_c = y_start + y_diff*c;
    #declare z_c = z_start + z_diff*c;
    
    camera
    {
        location <x_c, y_c, z_c>
        look_at <0.0, 0.0, 0.0>
        right x*image_width/image_height
    }
#end

#macro camera_move_straight_cubic(start, stop, c)
    #debug concat("start: ", vstr(3, start, ", ", 0, 1), " stop: ", vstr(3, stop, ", ", 0, 1), " c: ", str(c, 0, 3), "\n")
    // start: vector <x, y, z> where the camera starts at c=0
    // stop : vector <x, y, z> where the camera ends at c=1
    #local movement = stop - start;
    #if(c < 0.5)
        #local progress = 4* c * c * c;
    #else
        #local progress = 1 - pow(-2 * c + 2, 3) / 2;
    #end

    #debug concat("movement: ", vstr(3, movement, ", ", 0, 1), "\n")
    #debug concat("progress: ", str(progress, 0, 3), "\n")
    #debug concat("moveprog: ", vstr(3, movement * progress, ", ", 0, 1), "\n")
    #debug concat("position: ", vstr(3, start + movement * progress, ", ", 0, 1), "\n")
    camera
    {
        location start + movement * progress
        look_at <0.0, 0.0, 0.0>
        right x*image_width/image_height
    }
#end

#macro camera_move_straight_elastic(start, stop, c)
    #local movement = stop - start;
    #local c5 = (2 * pi) / 4.5;
    #if(c = 0)
        #local progress = 0;
    #elseif(c = 1)
        #local progress = 1;
    #elseif(c < 0.5)
        #local progress = -(pow(2, 20 * c - 10) * sin((20 * c - 11.125) * c5)) / 2;
    #else
        #local progress = (pow(2, -20 * c + 10) * sin((20 * c - 11.125) * c5)) / 2 + 1
    #end

    camera
    {
        location start + movement * progress
        look_at <0.0, 0.0, 0.0>
        right x*image_width/image_height
    }
#end
