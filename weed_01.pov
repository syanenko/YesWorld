#version 3.7;
global_settings { assumed_gamma 1.9 }

#declare luminosity = 0.7;
#include "include/playground.inc"

#include "include/colormaps.inc"
#include "shapes3.inc"

//
// Axis
//
//axis (3,3,3,0.02)

//
// Camera
//
camo (<5,0,0>, <0,0,0>, 50)

//
// Light
//
light_source {<5,5,5>, rgb <1,1,1> * luminosity shadowless}

//
// Background
//
background {color srgb<13,17,23> / 256}

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
// Weed
//
#macro weed_01 (_tex)

  #declare _weed =
    union {
     sphere_sweep {
         cubic_spline
         7,
         <-0.0133141,-0.000790786,0.0>,0.131825,
         <-0.0133141,-0.000790786,0.0>,0.131825,
         <0.0852752,0.426277,-0.118113>,0.102224,
         <-0.0994501,1.01313,0.0504987>,0.0503133,
         <-0.082195,1.2748,0.0306135>,0.0251861,
         <-0.0270831,1.38204,-0.0239959>,0.0551861,
         <-0.0270831,1.38204,-0.0239959>,0.0551861
         tolerance 0.000001
         }
    
        texture {_tex}
    }

    _weed // Return
#end


//
// Stems 1
//
#declare tex1 = texture { 
  pigment { gradient y
            color_map  { ext_kindlmann }
            scale 3 
            translate 2.2}
  
  normal {  bumps scale 0.006 }
}

union {
  object { weed_01 (tex1) scale <1,1,1>        rotate <0, 45, 0>   translate <0, 0, 0>           }
  object { weed_01 (tex1) scale <0.6,0.8,0.6>  rotate <0, -50, 0>  translate <0.2,   -0.1, 0>    }
  object { weed_01 (tex1) scale <0.5,0.65,0.5> rotate <0, -220, 0> translate <-0.12, -0.0, 0.12> }
  object { weed_01 (tex1) scale <0.7,0.6,0.7>  rotate <0, 250, 0>  translate <0.1,   -0.1, 0.1>  }

  scale 1.1  
  rotate y * (45 + clock)
  translate <0,0,1.5>
  // DEBUG: Clock
  #debug concat("DEBUG:---- Clock: ", str(clock,3,1), "\n")
}


//
// Stems 2
//
#declare tex2 = texture { 
  pigment { gradient -y
            color_map  { kindlmann }
            scale 2.5 
            translate -0.2}

  normal {  bumps scale 0.006 }
}

union {
  object { weed_01 (tex2) scale <1,1,1>        rotate <0, 45,   0> translate <0,        0,   0>  }
  object { weed_01 (tex2) scale <0.6,0.8,0.6>  rotate <0, -50,  0> translate <0.2,      0,   0>  }
  object { weed_01 (tex2) scale <0.5,0.65,0.5> rotate <0, -220, 0> translate <-0.12, -0.1, 0.12> }
  object { weed_01 (tex2) scale <0.7,0.6,0.7>  rotate <0, 250,  0> translate <0.1,   -0.1,  0.1> }

  scale 1.1
  rotate y * (85 + clock)
  translate <0,0,-1.5>
}


//
// Stems 3
//
#declare tex3 = texture { 
  pigment { gradient -y
            color_map  { parula }
            scale 3 
            translate -0.2}

  normal {  bumps scale 0.006 }
}

union {
  object { weed_01 (tex3) scale <1,1,1>        rotate <0, 45,   0> translate <0,      0, 0   > }
  object { weed_01 (tex3) scale <0.6,0.8,0.6>  rotate <0, -50,  0> translate <0.2,    0, 0   > }
  object { weed_01 (tex3) scale <0.5,0.65,0.5> rotate <0, -220, 0> translate <-0.12,  0, 0.12> }
  object { weed_01 (tex3) scale <0.7,0.6,0.7>  rotate <0, 250,  0> translate <0.1, -0.1, 0.1 > }
  
  scale 1.1  
  rotate y * (60 + clock)
}

//
// Stems 04
//
#declare tex4 = texture { 
  pigment { gradient y
            color_map  { viridis }
            scale 3.7 
            translate -2}
  
  normal {  bumps scale 0.006 }
}

union {
  object { weed_01 (tex4) scale <1,1,1>        rotate <0,   45, 0>   translate <0,     0, 0   > }
  object { weed_01 (tex4) scale <0.6,0.8,0.6>  rotate <0,  -50, 0>  translate <0.2, -0.1, 0   > }
  object { weed_01 (tex4) scale <0.5,0.65,0.5> rotate <0, -220, 0> translate <-0.12,   0, 0.12> }
  object { weed_01 (tex4) scale <0.7,0.6,0.7>  rotate <0,  250, 0>  translate <0.1, -0.1, 0.1 > }

  scale 1.1
  rotate y * (25 + clock)
  translate <0,-1.4,0.75>
}


//
// Stems 5
//
#declare tex5 = texture { 
  pigment { gradient y
            color_map  { jet }
            scale 3 
            translate -0.2}

  normal {  bumps scale 0.006 }
}

union {
  object { weed_01 (tex5) scale <1,1,1>        rotate <0, 45, 0>   translate <0,         0, 0>    }
  object { weed_01 (tex5) scale <0.6,0.8,0.6>  rotate <0, -50, 0>  translate <0.2,       0, 0>    }
  object { weed_01 (tex5) scale <0.5,0.65,0.5> rotate <0, -220, 0> translate <-0.12, -0.05, 0.12> }
  object { weed_01 (tex5) scale <0.7,0.6,0.7>  rotate <0, 250, 0>  translate <0.1,   -0.1,  0.1>  }

  scale 1.1
  rotate y * (70 + clock)
  translate <0,-1.4,-0.8>
}
