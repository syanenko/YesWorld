//------------------------------------------------------------------------
//
// Persistence of Vision Ray Tracer version 3.8
// Scene Description Language (SDL)
// 
// File: coral_01_animation.pov
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
// axis (2,2,2,0.02)

// Camera
camo (<5,3,3> * 1.2, <0, 0.05, 0>, 30)


// Additional light
light_source {<5,13,10>, rgb <1,1,1> * 0.8 shadowless }

//
// Colormaps
//
#declare parula = make_colormap (parula,0,0);

// 
// Coral
//
coral_01(parula,,,,,,y*1.3,,)
