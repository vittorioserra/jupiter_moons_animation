#include "strings.inc"

#declare animation_persistent_directory = "animationpersistent/";
#declare animation_persistent_list = "";

#macro animation_start()
    // TODO check if the following makes sense
    #declare animation_framework_current_stage = 0;
    #declare local_clock = 0;
    #declare animation_step_duration = 0;
#end

#macro animation_step(step_function, duration)
    #if (clock >= animation_framework_current_stage)
        #if (clock < (animation_framework_current_stage + duration)) // clock within this step
            #declare local_clock = (clock - animation_framework_current_stage) / duration;
            #debug concat("[", str(clock, 0, 3), "] Stage ", str(animation_framework_current_stage, 0, 0), ": ", step_function, "(", str(local_clock, 0, 3), ")\n")
            Parse_String(concat(step_function, "(local_clock, false)"))
        #else // clock is beyond the end of this step
            // TODO not necessary anymore as we have persistent values?
            //Parse_String(concat(step_function, "((1 - clock_delta), true)")) // should be the local_clock calculated earlier
        #end
    #end
    #declare animation_framework_current_stage = animation_framework_current_stage + duration;
#end

// name is exactly max 8 characters
#macro animation_persistent_register_value(name, init_value)
    #local len = strlen(name);
    #if (len > 8)
        #error concat("Error: persistent identifier '", name, "' must be less than 8 characters long")
    #end
    #local pad = 8 - len;
    #while (pad > 0)
        #local name = concat(name, " ")
        #local pad = pad - 1;
    #end
    #local len = strlen(name);
    #debug concat(" len = ", str(len, 0, 3), "\n")
    // TODO check that name is unique!
    #declare animation_persistent_list = concat(animation_persistent_list, name)
    #debug concat("animation_persistent_register_value - Animation_persistent_list: '", animation_persistent_list, "'\n")
    #if (clock = 0)
        #debug "saving default value\n"
        animation_persistent_save_value(name, init_value)
    #end
#end

#macro animation_persistent_load_values()
    #local len = strlen(animation_persistent_list);
    #if (mod(len, 8) != 0 )
        #error concat("Error with animation_persistent_list: ", animation_persistent_list)
    #end
    #debug concat("animation_persistent_load_values - Animation_persistent_list: '", animation_persistent_list, "'\n")
    #local i = 1;
    #while (i < len)
        #local name = substr(animation_persistent_list, i, 8);
        #debug concat("    name: ", name, "\n")
        #local value = 0;
        animation_persistent_load_value(name, value)
        #debug concat("    value: ", str(value, 0, 3), "\n")
        Parse_String(concat("#declare ", name, " = ", str(value, 0, 10), ";"))
        //#debug concat("    rotation: ", str(rotation, 0, 3), "\n")
        #local i = i + 8;
    #end
#end

#macro animation_persistent_save_values()
    #local len = strlen(animation_persistent_list);
    #if (mod(len, 8) != 0 )
        #error concat("Error with animation_persistent_list: ", animation_persistent_list)
    #end
    #local i = 1;
    #while (i < len)
        #local name = substr(animation_persistent_list, i, 8);
        Parse_String(concat("#declare animation_persistent_temp = ", name, ";"))
        #debug concat("++++++animation_persistent_save_value(", name, ", ", str(animation_persistent_temp, 0, 10), ")\n")
        Parse_String(concat("animation_persistent_save_value(\"", name, "\", ", str(animation_persistent_temp, 0, 10), ")"))
        #local i = i + 8;
    #end
#end

#macro animation_persistent_load_value(name, value)
    #local filename = concat(animation_persistent_directory, name, ".txt");
	#if (file_exists(filename))
		#fopen file filename read
		#read (file, value)
		#fclose file
	#end
#end

#macro animation_persistent_save_value(name, value)
    #local filename = concat(animation_persistent_directory, name, ".txt");
	#fopen file filename write
	#write (file, value)
	#fclose file
#end
