#ifdef (Final_Textures)

#declare Jupiter_Texture  = texture { pigment { image_map { jpeg "textures-hi/jupiter.jpg"  map_type 1 } } }
#declare Europa_Texture   = texture { pigment { image_map { jpeg "textures-hi/Europa.jpg"   map_type 1 } } }
#declare Io_Texture       = texture { pigment { image_map { jpeg "textures-hi/Io.jpg"       map_type 1 } } }
#declare Ganymede_Texture = texture { pigment { image_map { jpeg "textures-hi/Ganymede.jpg" map_type 1 } } }
#declare Callisto_Texture = texture { pigment { image_map { jpeg "textures-hi/Callisto.jpg" map_type 1 } } }

#else

#declare Jupiter_Texture  = texture { pigment { image_map { jpeg "textures-low/jupiter.jpg"  map_type 1 } } }
#declare Europa_Texture   = texture { pigment { image_map { jpeg "textures-low/Europa.jpg"   map_type 1 } } }
#declare Io_Texture       = texture { pigment { image_map { jpeg "textures-low/Io.jpg"       map_type 1 } } }
#declare Ganymede_Texture = texture { pigment { image_map { jpeg "textures-low/Ganymede.jpg" map_type 1 } } }
#declare Callisto_Texture = texture { pigment { image_map { jpeg "textures-low/Callisto.jpg" map_type 1 } } }


#end