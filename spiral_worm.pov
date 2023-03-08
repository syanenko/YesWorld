#version 3.7;
global_settings { assumed_gamma 1 }

#declare luminosity = 1.5;
#include "include/playground.inc"
#include "include/colormaps.inc"

#include "include/spiral_worm.inc"

// Axis
// axis (2,2,2,0.02)

// Cameras
camo (<1,2,5> * 1.5, <0,1.1,0>, 35)
// camo (<0,6,0>, <0,0,0>, 45)

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

//-------------------------------------------------------------------
//
// Play with worm(s)
//
#declare Y_step = 0.15;

#declare  worm_01 = union {

  make_spline(,,,,,,Y_step)
  draw_spheres(Y_step,,,,,) }

object { worm_01 }
