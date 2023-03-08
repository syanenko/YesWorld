#include "math.inc"

//
// Make spiral spline
//
#macro make_spline ( R, R_min, R_step, ang, ang_step, Y, Y_step )

  #declare _spline = 
  spline {
    natural_spline
  
    #while(R >= R_min)
      #local X = cos(ang) * R;
      #local Z = sin(ang) * R;
       
      ang, <X,Y,Z>
      // #debug concat("----- DEBUG: ang=", str(ang,5,3), " X=" , str(X,5,3), " Y=" , str(Y,5,3), " Z=" , str(Z,5,3)"\n")
      #declare Y = Y + Y_step;
      #declare ang = ang + ang_step;    
      #declare R = R - R_step;
    #end
  }
#end

//
// Draw pins
//
#macro draw_pins(center, R, Y_step)

  #declare pin_len  = 3;
  #declare pin_size = 0.2;
  #declare pins_num = 8;
  #declare ang_step = 360 / pins_num;
  #declare ang = 0;
  #union  {
    #for (i,0,pins_num)
      #local X = cosd(ang) * R;
      #local Y = sind(ang) * R;

       // Cone
       cone {<X,Y,0>, pin_size, <X,Y,0> * pin_len, 0

        pigment { gradient <X,Y,0>
                  color_map  { ext_kindlmann }
                  scale 0.7 
                  translate X*Y}
        normal { bumps scale 0.001 }
       }                                   

       // Sphere
        sphere {<X,Y,0>, pin_size
          pigment { gradient <X,Y,0>
                    color_map  { ext_kindlmann }
                    scale 0.6 
                    translate X*Y}
          normal { bumps scale 0.001 }
      }

      // #debug concat("----- DEBUG: ang=", str(ang,5,3), " X=",  str(X,5,3), "\n")
      #declare ang = ang + ang_step;
    #end

    #local ang = VRotationD( <1, 0, 0>, <center.x, 0, center.z>, <0, 1, 0>);
    // #debug concat("----- DEBUG: ang=", str(ang,5,3), "\n")
    rotate <-90 * Y_step, ang, 0>
    translate center  
  }
#end

//
// Draw spheres
//
#macro draw_spheres(Y_step, length, r_max, c_step, need_pins)

  #declare c = 0;
  #while (c < length)
    #local R = r_max - (c / (pow(length, 1.6)  * r_max));
    #local center = _spline(c);
  
    sphere {
      center, R
      pigment { gradient -y
                color_map  { ext_kindlmann }
                scale 26 
                translate 1 + c}
      normal { bumps scale 0.001 }
     }
  
     #if (R > 0 & need_pins)
       draw_pins(center, R, Y_step)
     #end
  
    #declare c = c + 0.2;
  #end
#end

//
// Spiral worm main
// 
#macro spiral_worm ( optional R, optional R_min, optional R_step,
                     optional ang, optional ang_step, optional Y, optional Y_step,
                     optional length, optional r_max, optional c_step, optional need_pins )
  // Params 
  #if (!defined(local.R))
    #local R = 1.3;
  #end

  #if (!defined(local.R_min))
    #local R_min = 0;
  #end

  #if (!defined(local.R_step))
    #local R_step = 0.05;
  #end

  #if (!defined(local.ang))
    #local ang = 0;
  #end

  #if (!defined(local.ang_step))
    #local ang_step = 1;
  #end

  #if (!defined(local.Y))
    #local Y = 0;
  #end

  #if (!defined(local.Y_step))
    #local Y_step =  0.15;
  #end

  #if (!defined(local.length))
    #local length = 45;
  #end

  #if (!defined(local.r_max))
    #local r_max = 0.2;
  #end

  #if (!defined(local.c_step))
    #local c_step = 0.2;
  #end

  #if (!defined(local.need_pins))
    #local need_pins = true;
  #end
  
  // Make 
  #declare ret = union {
    make_spline ( R, R_min, R_step, ang, ang_step, Y, Y_step)
    draw_spheres(Y_step, length, r_max, c_step, need_pins)
  }

  ret
#end
