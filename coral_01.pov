//------------------------------------------------------------------------
//
// Persistence of Vision Ray Tracer version 3.8
// Scene Description Language (SDL)
// 
// File: coral_02.pov
// Version: 1.0
// Last updated: 22-Feb-2023
//
// Author: Sergey Yanenko "Yesbird", 2023
// e-mail: See posts in news.povray.org
//
//------------------------------------------------------------------------

#declare luminosity = 1;
#include "playground.inc"

#include "include/yeslib.inc"

#include "colormaps.inc"


// Axis
// axis (3,3,3,0.02)

// Camera
camp (<13.5, 4 ,3> * 3.5, <0, -1.4, 3>, 10)
// camp (<5,-5,5>, <0,0.3,0>, 35)
// camp (<5,0,0>, <0,0,0>, 45)
// camp (<0,5,0>, <0,0,0>, 45)


// Additional light
light_source {<5,13,10>, rgb <1,1,1> * 0.8 shadowless }

//
// Colormaps
//
#declare _f = 0;
#declare _t = 0;
 #declare jet = make_colormap (jet,              _f, _t); // !
 #declare spring = make_colormap (spring,           _f, _t); // !
 #declare winter = make_colormap (winter,           _f, _t); // !
 #declare autumn = make_colormap (autumn,           _f, _t); // !
 #declare parula = make_colormap (parula,           _f, _t); // !
 #declare ext_kindlmann = make_colormap (ext_kindlmann,    _f, _t); // !
 #declare viridis = make_colormap (viridis,          _f, _t); // !
 #declare kindlmann = make_colormap (kindlmann,        _f, _t); // !
// #declare cm = make_colormap (inferno,          _f, _t);
// #declare cm = make_colormap (smooth_cool_warm, _f, _t);
// #declare cm = make_colormap (plasma,           _f, _t);
// #declare cm = make_colormap (turbo,            _f, _t);
// #declare cm = make_colormap (cool,             _f, _t);
// #declare cm = make_colormap (summer,           _f, _t);
// #declare cm = make_colormap (hsv,              _f, _t);
// #declare cm = make_colormap (hot,              _f, _t);

coral_01(jet,          0.0,,,,, 1.2,  y*30,0)
coral_01(spring,       0.0,,,,, 1.2,  y*35,z*2)
coral_01(winter,       0.0,,,,, 1.2,  y*45,z*4)
coral_01(autumn,       0.0,,,,, 1.2,  y*50,z*6)
coral_01(parula,       0.35,,,,,1.2,  y*30,-y*3.1)
coral_01(ext_kindlmann,0.45,,,,,1.2,  y*30,-y*3 + z*2)
coral_01(viridis,      0.7,,,,, 1.2,  y*30,-y*3 + z*4)
coral_01(kindlmann,    1.3,,,,, 1.2,  y*30,-y*3 + z*6)
