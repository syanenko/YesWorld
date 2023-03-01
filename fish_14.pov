//----------- fish out of water v14 ----------- 2/28/23 miller
global_settings { max_trace_level 5 }
//
// Background
//
//background {color rgb <0.6, 0.62, 0.62>}
background {color rgb<13,17,23> / 256}


//--- C O L O R S
#ifndef (Transparent) #declare Transparent = rgbt 1 ;#end
#declare C_white =          color rgb <1.0, 1.0, 1.0>  ;
#declare C_black =          color rgb <0.0, 0.0, 0.0>  ;  
#declare C_gray50 =         color rgb <0.5, 0.5, 0.5>  ;
#declare P_clear =          pigment { C_black transmit 1 } ;



#declare C_map_mud_A = 
        color_map {
            [0.000 rgb <0.625, 0.659, 0.455>]
            [0.171 rgb <0.582, 0.449, 0.320>]
            [0.274 rgb <0.157, 0.151, 0.122>]
            [0.393 rgb <0.625, 0.619, 0.455>]
            [0.564 rgb <0.582, 0.519, 0.420>]
            [0.701 rgb <0.482, 0.392, 0.278>]
            [1.000 rgb <0.625, 0.659, 0.455>]
        }


#declare C_map_meat = 
        color_map {
            [0.000 rgb <0.4, 0.25, 0.1>]
            [0.171 rgb <0.2, 0.1, 0.1>]
            [0.274 rgb <0.3, 0.3, 0.1>]
            [0.393 rgb <0.4, 0.1, 0.0>]
            [0.564 rgb <0.0, 0.0, 0.0>]
            [0.701 rgb <0.4, 0.2, 0.15>]
            [1.000 rgb <0.4, 0.3, 0.2>]
        }


#declare M_meat =
material {
    texture {
        pigment { 
            agate 
            color_map {  C_map_meat } 
            scale 4 
            warp { turbulence .5 }
            } 
        normal { 
            agate 
            bump_size 3 
            scale 4 
            warp { 
                turbulence .5 
                }
            }
        finish {
            ambient .3
            diffuse 1 
            phong 2    
            phong_size 80
        } 
      }  
}

//--- textures
#declare T_fish_skin_gloss =
texture {
   pigment { 
        image_map { <1 0 0> 
            jpeg "include/fish_14/fish_14_diffuse.jpg" 
            interpolate 4 
            } 
   }
   scale <10, 5, 1> translate <0,0,0>
   finish { 
        ambient 0.2 
        diffuse 1 
        phong .75
        phong_size 50 
        
        }
   normal {
       bump_map {
            jpeg "include/fish_14/fish_14_bump.jpg" 
            interpolate 2 
       } 
       bump_size 8
       scale <10, 5, 1> translate <0,0,0>
   }
}
   


   
   
//--- textures
#declare T_fish_skin_fins =
texture {
   pigment { 
        image_map { <1 0 0> 
            jpeg "include/fish_14/fish_14_diffuse.jpg" 
            interpolate 2
            filter all .4
            } 
   }
   scale <10, 5, 1> translate <0,0,0>
   finish { 
        ambient .2
        diffuse 1 
        phong 1
        phong_size 60 
        }
   normal {
       bump_map {
            jpeg "include/fish_14/fish_14_bump.jpg" 
            interpolate 3 
       } 
       bump_size 12
       scale <10, 5, 1> translate <0,0,0>
   }
}


#declare M_water = 
material { 
    texture {
        pigment { color red 0.0 green 0.07 blue 0.0 }
        finish {
        reflection 0.45
        ambient 0.15
        diffuse 0.6 phong 1.0 phong_size 80
        }
    normal {
        ripples 0.7
        frequency 0.08
        translate <0, 0, 0>
        }
    }
}




//-- backlight
#macro light_array_1 ()
    light_source {
        <0,0,0> 
        #declare light_color = color red .13 green .14 blue .18 ;                      
        light_color * 25                   
        area_light
        <500, 0, 0> <0, 0, 500>         
        16, 16                          
        adaptive 0                    
        jitter                        
        circular                      
        orient                        
        translate <0, 40, 35>
    }   
#end
light_array_1()

//--under light green tint
#macro light_array_2 ()
    light_source {
        <0,0,0> 
        #declare light_color = color red .16 green .17 blue .09 ;                      
        light_color * 5                   
        area_light
        <500, 0, 0> <0, 0, 500>         
        16, 16                          
        adaptive 0                    
        jitter                        
        circular                      
        orient                        
        translate <-90, -50, -50>
    }   
#end
light_array_2()

//--- fill light
#macro light_array_3 ()
    light_source {
        <0,0,0> 
        #declare light_color = color red .13 green .16 blue .2 ;                      
        light_color * 5                   
        area_light
        <500, 0, 0> <0, 0, 500>         
        16, 16                          
        adaptive 0                    
        jitter                        
        circular                      
        orient                        
        translate <100, 40, -50>
    }   
#end
light_array_3()


#declare water = object { plane{ <0,1,0> 0 material{M_water} }}
//water




#declare fish_depth = .5 ;

#declare paper_Cut_Z =
union{ 
    plane{ <1,0,0> 0 }                        //--cut at center X
    plane{ <0,0,-1> 0 translate <0,0,.002>}   //--pos Z end
    plane{ <0,0,1> 0 translate <0,0,-.002>}   //--pos Z start     
    } 
       
       
#declare paper_Cut_Z_Curved =
union{ 
    plane{ <1,0,0> 0 }                                      //--cut at center X
    sphere{ <0,0,0> 50    translate <0,0,50> }             //--pos Z end
    sphere{ <0,0,0> 50.01 translate <0,0,50> inverse}      //--pos Z start     
    } 
    
 


#declare dorsal_spikes = 
union {
     sphere_sweep {
     cubic_spline
     15,
          <2.4, 4.24, 0.0 >, 0.00
          <2.37, 4.24, 0.0 >, 0.005
          <2.42, 4.17, 0.0 >, 0.015
          <2.48, 4.08, 0.0 >, 0.015
          <2.55, 3.99, 0.0 >, 0.02
          <2.61, 3.91, 0.0 >, 0.03
          <2.66, 3.82, 0.0 >, 0.04
          <2.73, 3.84, 0.0 >, 0.03
          <2.72, 3.95, 0.0 >, 0.03
          <2.70, 4.10, 0.0 >, 0.02
          <2.70, 4.28, 0.0 >, 0.015
          <2.70, 4.41, 0.0 >, 0.015
          <2.71, 4.54, 0.0 >, 0.01
          <2.72, 4.64, 0.0 >, 0.01
          <2.72, 4.64, 0.0 >, 0.00
     tolerance 0.000001 
     }

     sphere_sweep {
     cubic_spline
     17,
          <3.22, 4.883, 0.0 >, 0.01
          <3.2, 4.883, 0.0 >, 0.01
          <3.134, 4.718, 0.0 >, 0.012
          <3.081, 4.548, 0.0 >, 0.022
          <3.015, 4.314, 0.0 >, 0.024
          <2.980, 4.090, 0.0 >, 0.025
          <2.990, 3.939, 0.0 >, 0.033
          <3.039, 3.846, 0.0 >, 0.038
          <3.126, 3.834, 0.0 >, 0.034
          <3.229, 3.874, 0.0 >, 0.029
          <3.258, 4.011, 0.0 >, 0.024
          <3.309, 4.198, 0.0 >, 0.022
          <3.381, 4.392, 0.0 >, 0.022
          <3.456, 4.562, 0.0 >, 0.020
          <3.531, 4.717, 0.0 >, 0.016
          <3.639, 4.883, 0.0 >, 0.01
          <3.63, 4.883, 0.0 >, 0.01
     tolerance 0.000001
     }

     sphere_sweep {
     cubic_spline
     17,   
          <3.965, 4.838, 0.0 >, 0.01
          <3.965, 4.838, 0.0 >, 0.01
          <3.875, 4.670, 0.0 >, 0.012
          <3.800, 4.505, 0.0 >, 0.022
          <3.695, 4.286, 0.0 >, 0.024
          <3.618, 4.082, 0.0 >, 0.025
          <3.600, 3.938, 0.0 >, 0.033
          <3.709, 3.891, 0.0 >, 0.038
          <3.831, 3.914, 0.0 >, 0.034
          <3.907, 4.069, 0.0 >, 0.029
          <3.974, 4.190, 0.0 >, 0.024
          <4.035, 4.304, 0.0 >, 0.022
          <4.131, 4.454, 0.0 >, 0.022
          <4.221, 4.578, 0.0 >, 0.020
          <4.295, 4.685, 0.0 >, 0.016
          <4.360, 4.775, 0.0 >, 0.01
           <4.360, 4.775, 0.0 >, 0.01
     tolerance 0.000001
     }


     sphere_sweep {
     cubic_spline
     17,
          <4.745, 4.733, 0.0 >, 0.01
          <4.745, 4.733, 0.0 >, 0.01
          <4.618, 4.592, 0.0 >, 0.012
          <4.506, 4.450, 0.0 >, 0.022
          <4.352, 4.262, 0.0 >, 0.024
          <4.229, 4.082, 0.0 >, 0.025
          <4.176, 3.946, 0.0 >, 0.055
          <4.272, 3.875, 0.0 >, 0.038
          <4.395, 3.868, 0.0 >, 0.034
          <4.506, 4.001, 0.0 >, 0.029
          <4.608, 4.122, 0.0 >, 0.024
          <4.713, 4.228, 0.0 >, 0.022
          <4.825, 4.339, 0.0 >, 0.022
          <4.937, 4.447, 0.0 >, 0.020
          <5.036, 4.536, 0.0 >, 0.016
          <5.134, 4.625, 0.0 >, 0.01
          <5.134, 4.625, 0.0 >, 0.01
     tolerance 0.000001
     }
  
     sphere_sweep {
     cubic_spline
     17,
          <5.437, 4.522, 0.0 >, 0.01
          <5.437, 4.522, 0.0 >, 0.01
          <5.284, 4.409, 0.0 >, 0.012
          <5.146, 4.291, 0.0 >, 0.022
          <4.959, 4.137, 0.0 >, 0.024
          <4.803, 3.985, 0.0 >, 0.025
          <4.725, 3.874, 0.0 >, 0.055
          <4.821, 3.776, 0.0 >, 0.038
          <4.993, 3.795, 0.0 >, 0.034
          <5.048, 3.861, 0.0 >, 0.029
          <5.134, 3.949, 0.0 >, 0.024
          <5.253, 4.056, 0.0 >, 0.022
          <5.382, 4.153, 0.0 >, 0.022
          <5.505, 4.256, 0.0 >, 0.020
          <5.619, 4.350, 0.0 >, 0.016
          <5.734, 4.444, 0.0 >, 0.01
          <5.734, 4.444, 0.0 >, 0.01
     tolerance 0.000001
     }

     sphere_sweep {
     cubic_spline
     17,
          <5.922, 4.302, 0.0 >, 0.01
          <5.922, 4.302, 0.0 >, 0.01
          <5.769, 4.189, 0.0 >, 0.012
          <5.633, 4.077, 0.0 >, 0.022
          <5.444, 3.917, 0.0 >, 0.024
          <5.328, 3.820, 0.0 >, 0.037
          <5.210, 3.655, 0.0 >, 0.055
          <5.306, 3.556, 0.0 >, 0.038
          <5.424, 3.565, 0.0 >, 0.034
          <5.493, 3.633, 0.0 >, 0.029
          <5.548, 3.724, 0.0 >, 0.042
          <5.663, 3.831, 0.0 >, 0.022
          <5.793, 3.932, 0.0 >, 0.022
          <5.902, 4.006, 0.0 >, 0.020
          <6.014, 4.079, 0.0 >, 0.016
          <6.106, 4.137, 0.0 >, 0.01 
          <6.106, 4.137, 0.0 >, 0.01
     tolerance 0.000001
     }
 
     scale z*.5
}


#declare pelvic_fin_spin =
difference{
     lathe{
     cubic_spline
     39,
          <0.07, -0.01 >, 
          <0.13, -0.14 >, 
          <0.22, -0.29 >, 
          <0.32, -0.44 >, 
          <0.46, -0.64 >, 
          <0.56, -0.79 >, 
          <0.64, -0.92 >, 
          <0.73, -1.00 >, 
          <0.82, -1.07 >, 
          <0.91, -1.07 >, 
          <0.95, -1.01 >, 
          <0.96, -0.96 >, 
          <1.01, -0.94 >, 
          <1.05, -0.88 >, 
          <1.06, -0.82 >, 
          <1.09, -0.74 >, 
          <1.11, -0.70 >, 
          <1.12, -0.65 >, 
          <1.13, -0.63 >, 
          <1.15, -0.56 >, 
          <1.13, -0.52 >, 
          <1.09, -0.48 >, 
          <1.10, -0.46 >, 
          <1.15, -0.44 >, 
          <1.16, -0.40 >, 
          <1.16, -0.34 >, 
          <1.13, -0.30 >, 
          <1.15, -0.28 >, 
          <1.13, -0.23 >, 
          <1.14, -0.21 >, 
          <1.09, -0.14 >, 
          <1.00, -0.10 >, 
          <0.90, -0.07 >, 
          <0.78, -0.05 >, 
          <0.64, -0.03 >, 
          <0.51, -0.01 >, 
          <0.40, 0.02 >, 
          <0.29, 0.06 >, 
          <0.16, 0.07 > 
     }
    paper_Cut_Z
}


#declare pelvic_fin = 
union{
    object {
        pelvic_fin_spin
        translate <3.5,1.2,0> 
        texture {T_fish_skin_fins} //-- stamp material 
        translate <-3.5,-1.2,0>
        rotate x*5
        translate <3.5,1.3,-.1>
        
    }

    object {
        pelvic_fin_spin
        translate <3.5,1.2,0> 
        texture {T_fish_skin_fins} //-- stamp material 
        translate <-3.5,-1.2,0>
        rotate x*-5
        translate <3.5,1.3,.1>
        
    }
}



#declare anal_spines =
union {
     sphere_sweep {
     cubic_spline
     8,    
          <5.70, 1.70, 0.0 >, 0.10
          <5.72, 1.66, 0.0 >, 0.09
          <5.77, 1.54, 0.0 >, 0.08
          <5.81, 1.46, 0.0 >, 0.065
          <5.87, 1.34, 0.0 >, 0.04
          <5.90, 1.26, 0.0 >, 0.03
          <5.97, 1.14, 0.0 >, 0.01
          <5.97, 1.14, 0.0 >, 0.01
     tolerance 0.001
     }


     sphere_sweep {
     cubic_spline
     10,   
          <5.87, 1.66, 0.0 >, 0.09
          <5.87, 1.66, 0.0 >, 0.09
          <5.92, 1.49, 0.0 >, 0.06
          <6.01, 1.33, 0.0 >, 0.05
          <6.12, 1.21, 0.0 >, 0.05
          <6.27, 1.09, 0.0 >, 0.04
          <6.39, 0.99, 0.0 >, 0.03
          <6.48, 0.92, 0.0 >, 0.02
          <6.54, 0.87, 0.0 >, 0.01 
          <6.54, 0.87, 0.0 >, 0.01
     tolerance 0.001
     }


     sphere_sweep {
     cubic_spline
     10,
          <5.88, 1.71, 0.0 >, 0.06
          <5.88, 1.71, 0.0 >, 0.06
          <5.99, 1.59, 0.0 >, 0.04
          <6.14, 1.46, 0.0 >, 0.03
          <6.30, 1.33, 0.0 >, 0.02
          <6.47, 1.24, 0.0 >, 0.02
          <6.65, 1.16, 0.0 >, 0.01
          <6.78, 1.11, 0.0 >, 0.01
          <6.88, 1.08, 0.0 >, 0.00
          <6.88, 1.08, 0.0 >, 0.00
     tolerance 0.001
     } 
     scale <1,1,.5>
} 
     
     

#declare anal_fin_spin =  
difference{
     lathe{
          cubic_spline
          35,
          <0.03, -0.00 >, 
          <0.08, -0.23 >, 
          <0.13, -0.39 >, 
          <0.20, -0.59 >, 
          <0.29, -0.75 >, 
          <0.38, -0.90 >, 
          <0.44, -0.96 >, 
          <0.41, -0.81 >, 
          <0.47, -0.84 >, 
          <0.56, -0.91 >, 
          <0.67, -1.01 >, 
          <0.83, -1.11 >, 
          <0.95, -1.19 >, 
          <1.04, -1.23 >, 
          <1.00, -1.16 >, 
          <0.97, -1.01 >, 
          <0.98, -0.88 >, 
          <1.16, -0.96 >, 
          <1.36, -1.00 >, 
          <1.50, -0.89 >, 
          <1.61, -0.77 >, 
          <1.51, -0.69 >, 
          <1.64, -0.73 >, 
          <1.73, -0.62 >, 
          <1.82, -0.54 >, 
          <1.79, -0.46 >, 
          <1.88, -0.42 >, 
          <1.96, -0.30 >, 
          <1.98, -0.17 >, 
          <1.82, -0.10 >, 
          <1.56, -0.00 >, 
          <1.23, 0.09 >, 
          <0.86, 0.11 >, 
          <0.55, 0.09 >, 
          <0.28, 0.06 > 
     } 
    paper_Cut_Z
}
 
#declare anal_fin = object {anal_fin_spin scale 1 translate <5.53,2.10,0> texture{T_fish_skin_fins} }


#declare tail_spin = 
difference{
    lathe{
        cubic_spline
        47,
        <0.01, 0.08 >, 
        <0.09, 0.32 >, 
        <0.22, 0.44 >, 
        <0.42, 0.56 >, 
        <0.57, 0.69 >, 
        <0.76, 0.84 >, 
        <0.92, 0.98 >, 
        <1.08, 1.10 >, 
        <1.21, 1.20 >, 
        <1.32, 1.22 >, 
        <1.38, 1.16 >, 
        <1.38, 1.09 >, 
        <1.44, 0.99 >, 
        <1.48, 0.86 >, 
        <1.48, 0.74 >, 
        <1.47, 0.62 >, 
        <1.51, 0.55 >, 
        <1.51, 0.43 >, 
        <1.50, 0.33 >, 
        <1.44, 0.29 >, 
        <1.50, 0.25 >, 
        <1.52, 0.11 >, 
        <1.51, -0.01 >, 
        <1.54, -0.10 >, 
        <1.54, -0.21 >, 
        <1.51, -0.27 >, 
        <1.44, -0.29 >, 
        <1.51, -0.35 >, 
        <1.52, -0.43 >, 
        <1.53, -0.56 >, 
        <1.46, -0.59 >, 
        <1.51, -0.66 >, 
        <1.52, -0.76 >, 
        <1.51, -0.85 >, 
        <1.42, -0.85 >, 
        <1.47, -0.91 >, 
        <1.46, -1.06 >, 
        <1.42, -1.16 >, 
        <1.35, -1.23 >, 
        <1.23, -1.15 >, 
        <1.01, -1.00 >, 
        <0.78, -0.79 >, 
        <0.57, -0.60 >, 
        <0.40, -0.41 >, 
        <0.30, -0.32 >, 
        <0.11, -0.22 >, 
        <0.01, -0.10 > 
    }
    paper_Cut_Z
}

#declare tail_wedge = object {tail_spin scale 1 translate <8.15,2.4,0> texture{T_fish_skin_fins} }
    

#declare mouth_cutter =
     lathe{
     cubic_spline
     18,
          <0.00, 2.93 >, 
          <0.17, 2.84 >, 
          <0.28, 2.72 >, 
          <0.31, 2.58 >, 
          <0.31, 2.46 >, 
          <0.36, 2.35 >, 
          <0.41, 2.22 >, 
          <0.46, 2.11 >, 
          <0.49, 2.06 >, 
          <0.45, 2.06 >, 
          <0.39, 2.05 >, 
          <0.33, 2.03 >, 
          <0.28, 1.99 >, 
          <0.24, 1.95 >, 
          <0.24, 1.90 >, 
          <0.20, 1.85 >, 
          <0.11, 1.82 >, 
          <0.00, 1.77 > 
     }

  
       
#declare fish_body =
union{
    difference{
        sphere_sweep {
        cubic_spline
        15,
        <0.05, 2.26, 0.0 >, 0.35
        <0.56, 2.25, 0.0 >, 0.35
        <1.12, 2.29, 0.0 >, 0.62
        <1.61, 2.31, 0.0 >, 0.85
        <2.20, 2.42, 0.0 >, 1.00
        <2.92, 2.58, 0.0 >, 1.29
        <3.67, 2.59, 0.0 >, 1.40
        <4.63, 2.65, 0.0 >, 1.27
        <5.79, 2.61, 0.0 >, 1.01
        <6.72, 2.55, 0.0 >, 0.67
        <7.46, 2.46, 0.0 >, 0.40
        <8.06, 2.43, 0.0 >, 0.33 
        <8.43, 2.44, 0.0 >, 0.17
        <8.66, 2.46, 0.0 >, 0.10
        <8.83, 2.47, 0.0 >, 0.03
        tolerance 0.001
        }         
        object { mouth_cutter scale z*10 translate <0,0,0> material {M_meat} }
        sphere { <0,0,0> .20 scale <2,1,1> translate <0.28,2.22,0> material {M_meat } } 
    } 
    //--- mouth gum
    torus { 0.25,0.05 scale<1,1,1.05> material {M_meat} rotate<0,0,90> rotate<0,0,20> translate <0.44,2.23,0> }            
}    


#declare fish_tail =
union{
    sphere_sweep {
        cubic_spline
        8,  
        <8.28, 2.60, 0.0 >, 0.19 
        <8.28, 2.60, 0.0 >, 0.197
        <8.68, 2.94, 0.0 >, 0.11
        <8.94, 3.19, 0.0 >, 0.07
        <9.15, 3.40, 0.0 >, 0.04
        <9.35, 3.55, 0.0 >, 0.04
        <9.46, 3.60, 0.0 >, 0.04
        <9.46, 3.60, 0.0 >, 0.02 
        tolerance 0.001
    }


    sphere_sweep {
        cubic_spline
        8, 
        <8.28, 2.2, 0.0 >, 0.19
        <8.28, 2.2, 0.0 >, 0.19
        <8.68, 1.89, 0.0 >, 0.11
        <8.94, 1.63, 0.0 >, 0.07
        <9.15, 1.43, 0.0 >, 0.04
        <9.35, 1.28, 0.0 >, 0.04
        <9.5                       , 1.14, 0.0 >, 0.04
        <9.5, 1.14, 0.0 >, 0.02
        tolerance 0.001
    }
    
     scale <1,1,.6>
 
}

#declare top_fin_parts =
union{
    difference {
         lathe{
         cubic_spline
     80,
          <1.00, 5.65 >, 
          <1.26, 5.64 >, 
          <1.48, 5.63 >, 
          <1.40, 5.49 >, 
          <1.37, 5.35 >, 
          <1.56, 5.34 >, 
          <1.87, 5.29 >, 
          <1.69, 5.22 >, 
          <1.57, 5.04 >, 
          <1.80, 4.97 >, 
          <2.07, 4.84 >, 
          <1.89, 4.81 >, 
          <1.77, 4.73 >, 
          <1.70, 4.63 >, 
          <1.91, 4.53 >, 
          <2.13, 4.39 >, 
          <1.97, 4.38 >, 
          <1.86, 4.33 >, 
          <1.78, 4.25 >, 
          <1.94, 4.16 >, 
          <2.11, 4.05 >, 
          <1.97, 4.03 >, 
          <1.87, 3.99 >, 
          <1.77, 3.88 >, 
          <1.92, 3.75 >, 
          <2.04, 3.66 >, 
          <1.89, 3.65 >, 
          <1.78, 3.61 >, 
          <1.70, 3.53 >, 
          <1.96, 3.27 >, 
          <1.77, 3.25 >, 
          <1.68, 3.15 >, 
          <1.76, 3.05 >, 
          <1.84, 2.94 >, 
          <1.68, 2.90 >, 
          <1.59, 2.83 >, 
          <1.67, 2.72 >, 
          <1.74, 2.61 >, 
          <1.62, 2.58 >, 
          <1.53, 2.53 >, 
          <1.59, 2.43 >, 
          <1.64, 2.35 >, 
          <1.53, 2.33 >, 
          <1.45, 2.28 >, 
          <1.49, 2.22 >, 
          <1.52, 2.16 >, 
          <1.43, 2.15 >, 
          <1.35, 2.10 >, 
          <1.33, 2.04 >, 
          <1.36, 1.93 >, 
          <1.25, 1.92 >, 
          <1.18, 1.88 >, 
          <1.25, 1.77 >, 
          <1.31, 1.65 >, 
          <1.25, 1.61 >, 
          <1.32, 1.50 >, 
          <1.38, 1.34 >, 
          <1.32, 1.32 >, 
          <1.35, 1.24 >, 
          <1.33, 1.12 >, 
          <1.28, 1.08 >, 
          <1.24, 0.98 >, 
          <1.17, 0.93 >, 
          <1.14, 0.86 >, 
          <1.09, 0.83 >, 
          <1.06, 0.73 >, 
          <0.99, 0.72 >, 
          <0.94, 0.61 >, 
          <0.88, 0.60 >, 
          <0.84, 0.51 >, 
          <0.79, 0.49 >, 
          <0.71, 0.37 >, 
          <0.66, 0.36 >, 
          <0.56, 0.29 >, 
          <0.47, 0.21 >, 
          <0.36, 0.14 >, 
          <0.28, 0.09 >, 
          <0.21, 0.08 >, 
          <0.16, 0.04 >, 
          <0.11, 0.00 > 

          }  
         paper_Cut_Z
         plane{ <0,-1,0> 0 rotate z*30 translate <0,4.79,0> } 
    }     
    rotate <0,0,90> scale <1,1,1>translate <3.76,0,0>
}
#declare top_fin = object { top_fin_parts translate <4.26,2.75,0>  }

      
      


//--- belly fin
#declare belly_fin_part = 
difference{
    lathe{ 
        cubic_spline
        70,
        <0.02, 0.94 >, 
        <0.14, 1.01 >, 
        <0.41, 1.09 >, 
        <0.69, 1.17 >, 
        <0.97, 1.25 >, 
        <1.20, 1.29 >, 
        <1.44, 1.31 >, 
        <1.56, 1.30 >, 
        <1.65, 1.30 >, 
        <1.76, 1.29 >, 
        <1.80, 1.25 >, 
        <1.79, 1.20 >, 
        <1.88, 1.18 >, 
        <1.94, 1.13 >, 
        <1.92, 1.08 >, 
        <2.00, 1.06 >, 
        <2.07, 1.02 >, 
        <2.12, 0.97 >, 
        <2.10, 0.92 >, 
        <2.16, 0.90 >, 
        <2.22, 0.86 >, 
        <2.23, 0.82 >, 
        <2.19, 0.79 >, 
        <2.25, 0.76 >, 
        <2.30, 0.72 >, 
        <2.28, 0.68 >, 
        <2.34, 0.63 >, 
        <2.35, 0.59 >, 
        <2.32, 0.55 >, 
        <2.34, 0.51 >, 
        <2.30, 0.48 >, 
        <2.35, 0.42 >, 
        <2.34, 0.36 >, 
        <2.25, 0.36 >, 
        <2.15, 0.36 >, 
        <2.09, 0.34 >, 
        <2.10, 0.29 >, 
        <2.03, 0.27 >, 
        <1.96, 0.27 >, 
        <1.95, 0.21 >, 
        <1.92, 0.18 >, 
        <1.87, 0.16 >, 
        <1.76, 0.16 >, 
        <1.65, 0.15 >, 
        <1.62, 0.12 >, 
        <1.62, 0.08 >, 
        <1.57, 0.06 >, 
        <1.51, 0.06 >, 
        <1.42, 0.08 >, 
        <1.37, 0.08 >, 
        <1.33, 0.06 >, 
        <1.32, 0.02 >, 
        <1.29, 0.00 >, 
        <1.21, 0.02 >, 
        <1.12, 0.05 >, 
        <1.07, 0.03 >, 
        <0.99, 0.01 >, 
        <0.91, 0.02 >, 
        <0.82, 0.04 >, 
        <0.78, 0.01 >, 
        <0.70, 0.03 >, 
        <0.63, 0.11 >, 
        <0.58, 0.10 >, 
        <0.52, 0.10 >, 
        <0.46, 0.15 >, 
        <0.38, 0.23 >, 
        <0.29, 0.31 >, 
        <0.18, 0.38 >, 
        <0.12, 0.44 >, 
        <0.03, 0.50 > 
        } 
    paper_Cut_Z_Curved
    translate <7.2,3.65,0> 
    texture{T_fish_skin_fins}  //---stamp texture
    translate <-7.32,-3.65,0> 
}


#declare pectoral_fin_front =
object { belly_fin_part
         rotate <0,20,0> 
         rotate <-20,0,0>          
         translate <2.9,1.4,-.32>
         }  
         
#declare pectoral_fin_back =
object { belly_fin_part
         rotate <0,-20,0> 
         rotate <20,0,0>          
         translate <2.9,1.4,.32>
         }  


#declare body = 
union{
    object { fish_body }
    object { fish_tail texture{T_fish_skin_fins}}
    scale <1,1, fish_depth>
    }
 
         

#declare eye_L =
    sphere{ <0,0,0> 1
           scale <.35,.35,.2>
           translate <.92,4.06,0>  
           texture{T_fish_skin_gloss} //--- stamp texture
           translate <-.92,-4.06,0>
           rotate <15,0,0>  
           rotate <0,15,0>
           }
           
           
#declare eye_R =
    sphere{ <0,0,0> 1
           scale <.35,.35,.2>
           translate <.92,4.06,0>  
           texture{T_fish_skin_gloss}
           translate <-.92,-4.06,0>
           rotate <-15,0,0>  
           rotate <0,-15,0>
           }           
           


//--- build fish        
#macro fish14() 
    union{
        object { pelvic_fin }
        object { tail_wedge } 
        object { anal_fin }
        object { anal_spines texture{T_fish_skin_fins} }
        object { dorsal_spikes  texture{T_fish_skin_fins}}
        object { top_fin  texture{T_fish_skin_fins}}
        object { pectoral_fin_front }
        object { pectoral_fin_back } 
        object { body texture{T_fish_skin_gloss} }
        object { eye_L translate <1.3, 2.70, -.23>}
        object { eye_R translate <1.3, 2.70, .23> } 
    }
#end   

camera {
    location <2, 2, -18>
    up <0, 1, 0>
    look_at <1.35, 3, 0> 
    angle 30
}

object { fish14() rotate <0,-70,0> scale y*1.2 translate <-2.3,0,-2> }   
object { fish14() rotate <0,-30,0> scale y*1.3 translate <1.5,-1,15> } 
  