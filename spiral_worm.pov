#version 3.7;
global_settings { assumed_gamma 1 }

#declare luminosity = 1.5;
#include "include/playground.inc"
#include "include/colormaps.inc"

#include "include/spiral_worm.inc"

// Axis
//axis (4,4,4,0.02)

//
// Cameras
// 
camo (<0,3,6>, <0,1,0>, 43)

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

//-------------------------------------------------------------------
//
// Play with worm(s)
//

//
// Worm 01
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_01 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )

//
// Worm 02
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_02 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )

//
// Worm 03
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_03 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )

//
// Worm 04
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_04 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )

//
// Worm 05
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_05 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )

//
// Worm 06
//
#declare R = 1.3;
#declare R_min = 0;
#declare R_step = 0.05;
#declare ang = 0;
#declare ang_step = 1;
#declare Y = 0;
#declare Y_step =  0.15;
#declare length = 45;
#declare r_max = 0.2;
#declare c_step = 0.2;
#declare need_pins = true;

#declare worm_06 =  spiral_worm ( R, R_min, R_step, ang, ang_step, 
                                  Y, Y_step, length, r_max, c_step, need_pins )


object { worm_01 scale 0.4 translate <1.57,  1.5 ,0> }
object { worm_01 scale 0.4 translate <0,     1.5 ,0> }
object { worm_01 scale 0.4 translate <-1.57, 1.5 ,0> }
object { worm_01 scale 0.4 translate <1.57, -0.3 ,0> }
object { worm_01 scale 0.4 translate <0,    -0.3 ,0> }
object { worm_01 scale 0.4 translate <-1.57,-0.3 ,0> }
