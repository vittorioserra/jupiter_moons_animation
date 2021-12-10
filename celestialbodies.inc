// TODO - Alessio : Jupiter rotation jerk reduction
#macro jupiter(ambient_scaler, cone_length, cone_transmit)
#local jupiter_radius = 150000;
sphere
{
        0, jupiter_radius
        texture { Jupiter_Texture }
        rotate y * -90
        rotate y * (-36 * clock)
        finish{ ambient ambient_scaler }
}
//shadow-cone highliting
cone
{
	0, jupiter_radius,
	x * jupiter_radius * cone_length, 0
	pigment{ color Gray transmit cone_transmit }
}
#end

// Moons of Jupiter
// not all orbital planes have the same inclination, and not all are inclined on the same axis, this should roughly give the
// idea of the different orbital planes to the audience

#macro io(radius_scaler, rev_angle, ambient_scaler, orbit_transmit)
sphere
{
        0, 7500 * radius_scaler
        texture { Io_Texture }
        rotate y * rev_angle // tidal lock rotation
        translate x * -250000
        rotate y * rev_angle // revolution
        finish { ambient ambient_scaler }
}
//orbit
torus
{
	250000, 2000
	pigment { color Green transmit orbit_transmit }
	finish { ambient 1 }
	no_shadow
}
#end

#macro europa(radius_scaler, rev_angle, ambient_scaler, orbit_transmit)
sphere
{
        0, 7500 * radius_scaler
        texture { Europa_Texture }
        rotate<0, rev_angle, 0> // tidal lock rotation   
        translate x* -300000
        rotate x * 10 // Vittorio - clarify this?
        rotate y * rev_angle //revolution
        finish { ambient ambient_scaler }
}     
//orbit
torus
{
	300000, 2000
	pigment{ color Red transmit orbit_transmit}
	finish { ambient 1 }
	no_shadow
}
#end

#macro ganymede(radius_scaler, rev_angle, ambient_scaler, orbit_transmit)
sphere
{
        0, 7500 * radius_scaler
        texture { Ganymede_Texture }
        rotate y * rev_angle //tidal lock rotation
        translate x * -400000
        rotate y * rev_angle // revolution
        rotate x * 5 // orbital plane inclination
        finish { ambient ambient_scaler }
}      
//orbit
torus
{
	400000, 2000
	pigment{ color Blue transmit orbit_transmit}
	rotate x * 5
	finish { ambient 1 }
	no_shadow
}
#end

#macro callisto(radius_scaler, rev_angle, ambient_scaler, orbit_transmit)
//Open Issue : represent high inclination and eclipse miss ? better to do with cone jerk
sphere
{
        0, 7500 * radius_scaler
        texture { Callisto_Texture }
	rotate y * rev_angle // tidal lock rotation   
	translate x * -500000
        rotate  y * rev_angle // revolution
        rotate z * -10 // orbital plane inclination
        finish { ambient ambient_scaler }
}     
//orbit
torus
{
	500000, 2000
	pigment{ color Orange transmit orbit_transmit}
	rotate z * -10
	finish { ambient 1 }
	no_shadow
} 
#end
