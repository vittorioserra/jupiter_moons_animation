#switch (texture_level)
#case (1)
#declare Jupiter_Texture  = texture { pigment { image_map { jpeg "textures-hi/jupiter.jpg"  map_type 1 } } }
#declare Europa_Texture   = texture { pigment { image_map { jpeg "textures-hi/Europa.jpg"   map_type 1 } } }
#declare Io_Texture       = texture { pigment { image_map { jpeg "textures-hi/Io.jpg"       map_type 1 } } }
#declare Ganymede_Texture = texture { pigment { image_map { jpeg "textures-hi/Ganymede.jpg" map_type 1 } } }
#declare Callisto_Texture = texture { pigment { image_map { jpeg "textures-hi/Callisto.jpg" map_type 1 } } }
#break

#case (2)
#declare Jupiter_Texture  = texture { pigment { image_map { jpeg "textures-low/jupiter.jpg"  map_type 1 } } }
#declare Europa_Texture   = texture { pigment { image_map { jpeg "textures-low/Europa.jpg"   map_type 1 } } }
#declare Io_Texture       = texture { pigment { image_map { jpeg "textures-low/Io.jpg"       map_type 1 } } }
#declare Ganymede_Texture = texture { pigment { image_map { jpeg "textures-low/Ganymede.jpg" map_type 1 } } }
#declare Callisto_Texture = texture { pigment { image_map { jpeg "textures-low/Callisto.jpg" map_type 1 } } }
#break

#case (3)
#declare Jupiter_Texture  = texture { pigment { checker color rgb<1, 0, 0> color rgb<0, 0, 1> } scale 50000 }
#declare Europa_Texture   = texture { pigment { color <0, 1, 0> } }
#declare Io_Texture       = texture { pigment { color <0, 0, 1> } }
#declare Ganymede_Texture = texture { pigment { color <1, 1, 0> } }
#declare Callisto_Texture = texture { pigment { color <1, 0, 1> } }
#break

#end