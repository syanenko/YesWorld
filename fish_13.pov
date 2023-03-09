#version 3.8;
global_settings { assumed_gamma 1.5 }

#declare luminosity = 0;
#include "include/playground.inc"
#include "include/colormaps.inc"

#include "include/fish_13/fish_13.inc"

// Axis
// axis (60,60,60,1)

// Camera
camo(<-200, 0, 0>, <3, 0, -4>, 60)

//
// Lights
//
light_source { <-2000, 100, -100> <1,1,1> shadowless }
light_source { <1000, 500, 400>  <1,1,1>  }

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

// Bumping common for all fishes
#declare normals = normal { bumps scale 0.13 }

//
// Fish 1
//
#declare colors = array mixed [8][5] {
  // Colormap  | Gradient  | Scale        | Rotate     | Translate
  {jet,        <0, -1,0>,  <1,    60, 1>, <1, 0, 1>,   <-50, -40, -1>} // 0 Body
  {parula,     <0,  1,0>,  <1,    10,  1>, <0, 0, 0>,   <-50, -28, -1>} // 1 Spike
  {jet,        <0,  1,0>,  <200, 120, 2>, <0, 0, 0>,   < 0,   -15,  0>} // 2 Pnts
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,   <10,   18, -1>} // 3 Upper lip
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,   <-50, -30, -1>} // 4 Lower lip
  {cool,       <0,  1,0>,  <1,  -40, 1>, <0, 0, 0>,     <0,    0,   0>} // 5 Fins skin

  {winter,     <1,-0.4,0>, <28, 30,   1>, <0, 0, 180>, <0,     0,  0>} // 6 Tail
  {winter,     <0,1,-1>,   <50, 30, 0.5>, <0, 0, 0>,   <-50, -30, -1>} // 7 Eye
}
object { fish_13(normals, colors)
         scale     1
         rotate    y * (45 + clock) 
         translate <0,33,-52> }
//
// Fish 2
//
#declare colors = array mixed [8][5] {
  // Colormap    | Gradient  | Scale        | Rotate     | Translate
  {ext_kindlmann,<0, -1,0>,  <1,  60,   1>, <1, 0, 1>,   <-50, -40, -1>} // 0 Body
  {jet,          <0,  1,0>,  <1,  60,   1>, <0, 0, 0>,   <-50, -42, -1>} // 1 Spike
  {ext_kindlmann,<0,  1,0>,  <1,  30,   2>, <0, 0, 0>,   < 0,   22,  0>} // 2 Pnts
  {hot,          <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,   <10,   18, -1>} // 3 Upper lip
  {hot,          <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,   <-50, -30, -1>} // 4 Lower lip
  {jet,          <0,  1,0>,  <100,  60, 1>, <0, 0, 0>,   <-50, -30, -1>} // 5 Fins skin
  {ext_kindlmann,<1,-0.4,0>, <45, 30,   1>, <0, 0, 180>, <-18, 0,  0>} // 6 Tail
  {winter,       <0,1,-1>,   <50, 30, 0.5>, <0, 0, 0>,   <-50, -30, -1>} // 7 Eye
}
object { fish_13(normals, colors)
         scale     1
         rotate    y * (45 + clock)
         translate  <0,33,52> }

//
// Fish 3
//
#declare colors = array mixed [8][5] {
  // Colormap  | Gradient  | Scale        | Rotate    | Translate
  {plasma,     <0, -1,0>,  <1,    60, 1>, <1, 0, 1>,  <-50, -20, -1>} // 0 Body
  {spring,     <0,  1,0>,  <1,    6,  1>, <0, 0, 0>,  <-50, -50, -1>} // 1 Spike
  {spring,     <0,  1,0>,  <200, 20,  2>, <0, 0, 0>,  < 0, 40,    0>} // 2 Pnts
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,  <10,   18, -1>} // 3 Upper lip
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>,  <-50, -30, -1>} // 4 Lower lip
  {jet,        <0,  1,0>,  <100,  60, 1>, <0, 0, 0>,  <-50, -20, -1>} // 5 Fins skin
  {plasma,     <-1, 1,0>,  <28, 30,   1>, <0, 0, 0>,  <0,    -0,  0>} // 6 Tail
  {winter,     <0, 1,-1>,  <50, 30, 0.5>, <0, 0, 0>,  <-50, -30, -1>} // 7 Eye
}
object { fish_13(normals, colors)
         scale     1
         rotate    y * (45 + clock)
         translate <0,-33,-52> }

//
// Fish 4
//
#declare colors = array mixed [8][5] {
  // Colormap  | Gradient  | Scale        | Rotate   | Translate
  {autumn,     <0, -1,0>,  <1,    40, 1>, <1, 0, 1>, <-50,  55, -1>} // 0 Body
  {jet,        <0,  1,0>,  <1,    35  1>, <0, 0, 0>, <50,   45, -1>} // 1 Spike  
  {jet,        <0,  1,0>,  <200, 120, 2>, <0, 0, 0>, < 0,   40,  0>} // 2 Pnts
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>, <10,   18, -1>} // 3 Upper lip
  {hot,        <1,0.4,0>,  <100,  60, 1>, <0, 0, 0>, <-50, -30, -1>} // 4 Lower lip
  {hsv,        <0,  1,0>,  <100,  60, 1>, <0, 0, 0>, <-50,  10, -1>} // 5 Fins skin
  {autumn,     <-1, 1,0>,  <28, 30,   1>, <0, 0, 0>, <0,    10,  0>} // 6 Tail
  {winter,     <0, 1,-1>,  <50, 30, 0.5>, <0, 0, 0>, <-50, -30, -1>} // 7 Eye
}
object { fish_13(normals, colors)
         scale     1
         rotate    y * (45 + clock)
         translate  <0,-33,52> }
