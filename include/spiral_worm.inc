//------------------------------------------------------------------------
//
// Persistence of Vision Ray Tracer version 3.8
// Scene Description Language (SDL)
// 
// Library of POV-Ray objects inspired by Roger Dean's artworks
//
// File: spiral_worm.inc
// Version: 1.0
// Last updated: 08-Mar-2023
//
// Author: Sergey Yanenko "Yesbird", 2023
// e-mail: See posts in news.povray.org
//
//------------------------------------------------------------------------

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
#macro draw_pins( ccmap, center, R, Y_step, lumps, lump_size, pins, pin_size, pin_len, pins_num)

  #declare ang_step = 360 / pins_num;
  #declare ang = 0;
  #union  {
    #for (i,0,pins_num)
      #local X = cosd(ang) * R;
      #local Y = sind(ang) * R;

       // Cone
       #if (pins)
         cone { <X,Y,0>, pin_size, <X,Y,0> * pin_len, 0
  
          pigment { gradient <X,Y,0>
                    color_map  {ccmap }
                    scale 0.7 
                    translate X*Y}
          normal { bumps scale 0.001 }
         }                                   
       #end

       // Sphere
       #if (lumps)
        sphere {<X,Y,0>, lump_size
          pigment { gradient <X,Y,0>
                    color_map  { ccmap }
                    scale 0.6 
                    translate X*Y}
          normal { bumps scale 0.001 }
       }
       #end

      // #debug concat("----- DEBUG: ang=", str(ang,5,3), " X=",  str(X,5,3), "\n")
      // #debug concat("----- DEBUG: lump_size=", str(lump_size,5,3), "\n")
      // #debug concat("----- DEBUG: pin_size=", str(pin_size,5,3), "\n")


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
#macro draw_spheres(cmap_body, cmap_pins, Y_step, length, r_max, c_step, lumps, lump_size, pins, pin_size, pin_len, pins_num)

  #declare c = 0;
  #while (c < length)
    #local R = r_max - (c / (pow(length, 1.6)  * r_max));
    #local center = _spline(c);
  
    sphere {
      center, R
      pigment { gradient -y
                color_map  { cmap_body }
                scale 26 
                translate 1 + c}
      normal { bumps scale 0.001 }
     }
  
     #if (R > 0)
       draw_pins(cmap_pins, center, R, Y_step, lumps, lump_size, pins, pin_size, pin_len, pins_num)
     #end
  
    #declare c = c + c_step;
  #end
#end

//
// Main
// 
#macro spiral_worm ( cmap_body, cmap_pins
                     optional R, optional R_min, optional R_step,
                     optional ang, optional ang_step, optional Y, optional Y_step,
                     optional length, optional r_max, optional c_step, optional lumps, optional lump_size
                     optional pins, optional pin_size, optional pin_len, optional pins_num )
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

  #if (!defined(local.lumps))
    #local lumps = true;
  #end

  #if (!defined(local.lump_size))
    #local lump_size = 3;
  #end

#if (!defined(local.lump_size))
    #local lump_size = true;
  #end

  #if (!defined(local.pins))
    #local pins = true;
  #end
  
  #if (!defined(local.pin_size))
    #local pin_size = 3;
  #end
  
  #if (!defined(local.pin_len))
    #local pin_len = 0.2;
  #end
  
  #if (!defined(local.pins_num))
    #local pins_num = 8;
  #end
  
  // Make it
  #declare ret = union {
    make_spline ( R, R_min, R_step, ang, ang_step, Y, Y_step)
    draw_spheres(cmap_body, cmap_pins, Y_step, length, r_max, c_step, lumps, lump_size, pins, pin_size, pin_len, pins_num)
  }

  ret
#end
