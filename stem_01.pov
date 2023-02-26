#version 3.8;
global_settings { assumed_gamma 1.5 }

#declare luminosity = 0;
#include "include/playground.inc"
#include "include/colormaps.inc"

#include "include/stem_01.inc"

// Axis
// axis (60,60,60,1)

// Camera
camo(<0, 0, 190>, <0, 45, 0>, 60)

//
// Lights
//
light_source { <-2000, 10, -100> <2,2,2> shadowless }
light_source { <-1000, 100,  400> <1,1,1> shadowless }


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


#declare tex1 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -40 }
  
     normal { bumps scale 0.13 }} 

#declare tex2 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -32 }
  
     normal { bumps scale 0.13 }} 

#declare tex3 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -27 }
  
     normal { bumps scale 0.13 }}  

union {
  object { stem_01 (tex1) scale <3, 3, 3>       rotate <0, 0, 0>   translate <0,  0, 0> }
  object { stem_01 (tex2) scale <2, 2, 2>       rotate <0, 80, 0>  translate <15, -3, 0> }
  object { stem_01 (tex3) scale <1.7, 1.7, 1.7> rotate <0, 20, 0> translate <0, -3, 0> }
}
