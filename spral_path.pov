#version 3.71;
 
global_settings {
   max_trace_level 15
   adc_bailout 0.001
   assumed_gamma 1
}

#declare luminosity = 1;
#include "include/playground.inc"
#include "include/colormaps.inc"

// Unzip it first !
#include "include/spiral_path.inc"

//
// Axis
//
// axis (3,3,3,0.02)
 
//
// Camera
//
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0.0382112490914982,-0.133476905137105,4.95613048689554>
        look_at <0.0382112490914982,-0.183476905137105,3.95613048689554>
        angle 42
        rotate <0,0,-0.485824211282429>
        rotate <-1.31397092791081,0,0>
        rotate <0,94.5473833118774,0>
        translate <0.05519253,0.19739041,-0.00093704>
        }
//
// Background
//
background {color srgb<13,17,23> / 256}

//
// Colormaps
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
// Path 1
// 
object{ spiral_path
  texture {
     pigment { gradient    y
               color_map { parula }
               scale        2
               translate    -1.2 }
  
     normal { bumps scale 0.01 }}
  rotate y * 60
  translate z * 0.9  
} 


//
// Path 2
// 
object{ spiral_path
  texture {
     pigment { gradient    y
               color_map { ext_kindlmann }
               scale        3.4
               translate    -2 }
  
     normal { bumps scale 0.02 }}

  rotate y * 60
  translate -z * 0.9
} 
