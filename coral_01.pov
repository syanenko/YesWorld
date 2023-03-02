//------------------------------------------------------------------------
//
// Persistence of Vision Ray Tracer version 3.8
// Scene Description Language (SDL)
// 
// File: coral_01_list.pov
// Version: 1.0
// Last updated: 22-Feb-2023
//
// Author: Sergey Yanenko "Yesbird", 2023
// e-mail: See posts in news.povray.org
//
//------------------------------------------------------------------------
#declare luminosity = 1;
#include "include/playground.inc"
#include "include/colormaps.inc"
#include "include/coral_01.inc"

// Axis
// axis (3,3,3,0.02)

// Camera
camo (<10, 4.5, 0> * 3.5, <0, -0.2, 0>, 13.5)
// camp (<5,-5,5>, <0,0.3,0>, 35)
// camp (<5,0,0>, <0,0,0>, 45)
// camo (<0,15,3>, <0,0,3>, 45)


// Additional light
light_source {<5,13,10>, rgb <1,1,1> * 0.8 shadowless }

//
// Colormaps
//
#declare jet = make_colormap (jet,                0, 0);
#declare spring = make_colormap (spring,          0, 0);
#declare winter = make_colormap (winter,          0, 0);
#declare autumn = make_colormap (autumn,          0, 0);
#declare parula = make_colormap (parula,          0, 0);
#declare viridis = make_colormap (viridis,        0, 0);
#declare kindlmann = make_colormap (kindlmann,    0, 0);
#declare ext_kindlmann = make_colormap (ext_kindlmann,  0, 0);
// #declare cm = make_colormap (inferno,          0, 0);
// #declare cm = make_colormap (smooth_cool_warm, 0, 0);
// #declare cm = make_colormap (plasma,           0, 0);
// #declare cm = make_colormap (turbo,            0, 0);
// #declare cm = make_colormap (cool,             0, 0);
// #declare cm = make_colormap (summer,           0, 0);
// #declare cm = make_colormap (hsv,              0, 0);
// #declare cm = make_colormap (hot,              0, 0);

coral_01(jet,          ,,,,, y*1.3,  y*30,y*1.37-z*3)
coral_01(spring,       ,,,,, y*1.3,  y*35,y*1.37-z)
coral_01(winter,       ,,,,, y*1.3,  y*45,y*1.37+z )
coral_01(autumn,       ,,,,, y*1.3,  y*50,y*1.37+z*3)
coral_01(parula,       ,,,,,y*1.3,  y*30,-y*2 - z*2)
coral_01(ext_kindlmann,,,,,,y*1.3,  y*30,-y*2 )
coral_01(kindlmann,    ,,,,, y*1.3,  y*30,-y*2 + z*2)
