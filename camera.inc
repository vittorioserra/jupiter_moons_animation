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
        look_at <0.0, 0.0,  0.0>
        right x*image_width/image_height  
    }    
#end    