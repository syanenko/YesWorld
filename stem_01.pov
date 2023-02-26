#version 3.8;
global_settings { assumed_gamma 1.5 }
#include "functions.inc"

#declare luminosity = 0;
#include "include/playground.inc"
#include "include/colormaps.inc"

#include "include/stem_01.inc"

// Axis
// axis (60,60,60,1)

// Camera
camo(<0, 0, 170>, <5, 45, 0>, 60)

//
// Lights
//
light_source { <-2000, 10,  -100> <2,2,2>  shadowless }
light_source { <1000, 100,  400> <1,1,1> shadowless }


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
// Textures
//
// Tex 1
//
#declare tex1_1 =
  texture {
     pigment { gradient    y
               color_map { jet }
               scale        100
               translate   -40 }
     normal { bumps scale 0.08 }} 

#declare tex1_2 =
  texture {
     pigment { gradient    y
               color_map { parula }
               scale        100
               translate   -32 }
     normal { bumps scale 0.08 }} 

#declare tex1_3 =
  texture {
     pigment { gradient    y
               color_map { jet }
               scale        100
               translate   -27 }
     normal { bumps scale 0.08 }}


//
// Tex 2
//
#declare tex2_1 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -40 }
     normal { bumps scale 0.08 }} 

#declare tex2_2 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -32 }
     normal { bumps scale 0.08 }} 

#declare tex2_3 =
  texture {
     pigment { gradient    y
               color_map { kindlmann }
               scale        100
               translate   -27 }
     normal { bumps scale 0.08 }}

//
// Tex 3
//
#declare tex3_1 =
  texture {
     pigment { gradient    -y
               color_map { autumn }
               scale        100
               translate    -55 }
     normal { bumps scale 0.08 }} 

#declare tex3_2 =
  texture {
     pigment { gradient    -y
               color_map { autumn }
               scale        80
               translate    -20 }
     normal { bumps scale 0.08 }} 

#declare tex3_3 =
  texture {
     pigment { gradient    -y
               color_map { autumn }
               scale        75
               translate    -5}
     normal { bumps scale 0.08 }}
//
// Animation
//
#local m = 192;
#local step = mod(clock, m);

#if (step > m / 2)
  #local step = m - step;
#end
                         
#local sd1_x = ((m - step) / 500);
#local sd1_y = ((m - step) / 300);
#local sd1_z = sd1_x;

#local sd2_x = (step / 400);
#local sd2_y = (step / 300);
#local sd2_z = sd2_x;

#local sd3_x = (step / 500);
#local sd3_y = (step / 400);
#local sd3_z = sd3_x;

#debug concat("----- SCALE: ", str(step,1,3), " - ", "\n")

//
// Stems 01
//
union {
  object { stem_01 (tex1_1) scale <sd1_x, sd1_y, sd1_z> + 1.7 rotate <0, 0, 0>  translate <0,   2, 0> }
  object { stem_01 (tex1_2) scale <sd2_x, sd2_y, sd2_z> + 1.6 rotate <0, 80, 0> translate <15, -3, 0> }
  object { stem_01 (tex1_3) scale <sd3_x, sd3_y, sd3_z> + 1.2 rotate <0, 20, 0> translate <0,  -3, 0> }

  translate <65, 0, 0>
}

//
// Stems 02
//
union {
  object { stem_01 (tex2_1) scale <sd1_x, sd1_y, sd1_z> + 1.7 rotate <0, 0, 0>  translate <0,   2, 0> }
  object { stem_01 (tex2_2) scale <sd2_x, sd2_y, sd2_z> + 1.6 rotate <0, 80, 0> translate <15, -3, 0> }
  object { stem_01 (tex2_3) scale <sd3_x, sd3_y, sd3_z> + 1.2 rotate <0, 20, 0> translate <0,  -3, 0> }

  translate <0, 0, 0>
}

//
// Stems 03
//
union {
  object { stem_01 (tex3_1) scale <sd1_x, sd1_y, sd1_z> + 1.7 rotate <0, 0, 0>  translate <0,  2, 0> }
  object { stem_01 (tex3_2) scale <sd2_x, sd2_y, sd2_z> + 1.6 rotate <0, 80, 0> translate <15,-3, 0> }
  object { stem_01 (tex3_3) scale <sd3_x, sd3_y, sd3_z> + 1.2 rotate <0, 20, 0> translate <0, -3, 0> }

  translate <-65, 0, 0>
}
