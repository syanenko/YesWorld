#version 3.7;
global_settings { assumed_gamma 1 }

#include "math.inc"

#declare luminosity = 1.5;
#include "include/playground.inc"
#include "include/colormaps.inc"

// Axis
// axis (2,2,2,0.02)

// Cameras
camo (<1,3,5> * 1.5 , <0,1,0>, 35)
// camo (<0,5,0> * 1.5, <0,2,0>, 45)

//------------------------------------------------------------------------


//
// Colormap
//
#declare _f = 0;
#declare _t = 0;
#declare jet              = make_colormap (jet,              _f, _t);
#declare spring           = make_colormap (spring,           _f, _t);
#declare hot              = make_colormap (hot,              _f, _t);
#declare winter           = make_colormap (winter,           _f, _t);
#declare hsv              = make_colormap (hsv,              _f, _t);
#declare autumn           = make_colormap (autumn,           _f, _t);
#declare parula           = make_colormap (parula,           _f, _t);
#declare summer           = make_colormap (summer,           _f, _t);
#declare turbo            = make_colormap (turbo,            _f, _t);
#declare cool             = make_colormap (cool,             _f, _t);
#declare viridis          = make_colormap (viridis,          _f, _t);
#declare smooth_cool_warm = make_colormap (smooth_cool_warm, _f, _t);
#declare plasma           = make_colormap (plasma,           _f, _t);
#declare ext_kindlmann    = make_colormap (ext_kindlmann,    _f, _t);
#declare kindlmann        = make_colormap (kindlmann,        _f, _t);
#declare inferno          = make_colormap (inferno,          _f, _t);

//
// Prepare spiral spline points
//
#declare r_min = 0;
#declare r_max = 1;    
#declare r_step = 0.05;

#declare points_num = (r_max - r_min ) / r_step + 1;
#declare points = array mixed [points_num][2];
#debug concat("----- DEBUG: points_num=", str(points_num,5,3), "\n")

#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare y_step = 0.13;

#declare p = 0;
#declare r = r_max;
#while (r >= r_min)
  #local X = cos(ang) * r; 
  #local Z = sin(ang) * r;
  #declare points[p][1] = <X,Y,Z>;
  #debug concat("----- DEBUG: point=<", vstr(3, points[p][1],",", 0,1), ">\n")
  #local Y = Y + y_step;

  #declare points[p][0] = ang;
  #declare ang = ang + ang_step;    
  #declare r = r - r_step;
  #declare p = p + 1;


#end


//
// Sweep sphere
//
sphere_sweep {
    b_spline 
    // cubic_spline
    // linear_spline
    points_num  
        #for (i,0,points_num-1)
            //points[i][1], 0.1
            points[i][1], 0.2 - points[i][0] / 100
        #end
  
    pigment { gradient -y
              color_map  { ext_kindlmann }
              scale 3.5 
              translate 2.5}
}

#if (0)

//
// Make spline
//
#declare _spline =
  spline {
    natural_spline
      #for (i,0,points_num-1)
          points[i][0], points[i][1]
      #end
  }

//
// Draw peaks
//
#macro draw_pins(center, R)

  #declare pin_len  = 2.5;
  #declare pin_size = 0.2;
  #declare pins_num = 8;
  #declare ang_step = 360 / pins_num;
  #declare ang = 0;
  #union  {
    #for (i,0,pins_num)
      #local X = cosd(ang) * R;
      #local Y = sind(ang) * R;

       // Cone
/*
       cone {<X,Y,0>, pin_size, <X,Y,0> * pin_len, 0

        pigment { gradient <X,Y,0>
                  color_map  { ext_kindlmann }
                  scale 0.7 
                  translate X*Y}
        normal { bumps scale 0.001 }
      }                                   
*/
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
    rotate <-90 * y_step, ang, 0>
    translate center  
  }
#end
  
//
// Draw spheres
//
declare length = 45;
#declare r_max = 0.2;

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

   #if (R > 0)
     draw_pins(center, R)
   #end

  #declare c = c + 0.2;
#end

//
// Sweep
//
/*
#declare c = 0;
sphere_sweep {
  linear_spline
  100,
  #while (c < 9.9)
    _spline(c),  0.33 - c / 30
    #declare c = c + 0.1;
  #end

  pigment { gradient -y
            color_map  { ext_kindlmann }
            scale 3 
            translate 2.2}
}
*/
#end
