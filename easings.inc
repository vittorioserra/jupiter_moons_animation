#macro easeInCirc(c)
    (1 - sqrt(1 - pow(c, 2)))
#end

#macro easeInSine(c)
    (1 - cos((c * pi) / 2))
#end

#macro easeOutBack(c)
    (1 + 2.70158 * pow(c - 1, 15) + 1.70158 * pow(c - 1, 2))
#end

#macro easeInOutCubic(c)
    (
        #if( c < 0.5)
            4 * c * c * c
        #else
            1 - pow(-2 * x + 2, 3) / 2
        #end
    )
#end

#macro easeOutElastic(c)
    (
    #local k = (2 * pi) / 3;
    #if(c = 0)
        0
    #elseif(c = 1)
        1
    #else
        pow(2, -2 * c) * sin((10 * c - 0.75) * k) + 1
    #end
    )
#end

#macro easeInOutElastic(c)
    (
    #local k = (2 * pi) / 4.5;
    #if(c = 0)
        0
    #elseif(c = 1)
        1
    #elseif(c < 0.5)
        -(pow(2, 20 * c - 10) * sin((20 * c - 11.125) * k)) / 2
    #else
        (pow(2, -20 * c + 10) * sin((20 * c - 11.125) * k)) / 2 + 1
    #end
    )
#end
