//------------------------------------------------------------------------
//
// Persistence of Vision Ray Tracer version 3.8
// Scene Description Language (SDL)
// 
// LIbrary of POV-Ray objects inspired by Roger Dean's artworks
//
// File: yeslib.inc
// Version: 1.0
// Last updated: 20-Feb-2023
//
// Author: Sergey Yanenko "Yesbird", 2023
// e-mail: See posts in news.povray.org
//
//------------------------------------------------------------------------

//
// Coral_01
//
#macro coral_01 (_colormap, optional _state, optional _radius, optional _strength, optional _threshold, optional _shift, optional _scale, optional _rotate, optional _translate)

  // Params 
  #if (!defined(local._radius))
    #local _radius = -1.12;
  #end

  #if (!defined(local._strength))
    #local _strength = 1.3; 
  #end

  #if (!defined(local._threshold))
    #local _threshold = 2;
  #end

  #if (!defined(local._shift))
    #local _shift = 2;
  #end

  #if (!defined(local._scale))
    #local _scale = 1;
  #end

  #if (!defined(local._rotate))
    #local _rotate = 0;
  #end

  #if (!defined(local._translate))
    #local _translate = 0;
  #end

  // Body
  #declare body =
    blob {
      threshold _threshold
      
      sphere{  < 0,1,0>,  _radius, _strength}
      sphere{  < 0,1,1>,  _radius, _strength}
      sphere{  < 1,1,0>,  _radius, _strength}
      sphere{  < 0,1,-1>, _radius, _strength}
      sphere{  < -1,1,0>, _radius, _strength}
      sphere{  < 0,0,0>,  _radius, 2.4 scale y * 2 translate -y * 0.5}
      
      pigment { gradient -y
                color_map  { _colormap }
                scale 4
                translate 2.8 - clock / 8}
  
      normal {
        gradient y
        normal_map {
          [0.9  bumps scale 0.013]
        }
      }
  }
  
  // Groove
  #declare  groove = sphere{ < 0,0,0>, 1
    pigment { gradient -y
              color_map  { _colormap }
              scale 4
              translate 1.9}
  
    normal {
      gradient y
      normal_map { [0.9  bumps scale 0.013] }}
  
    scale <0.09, 0.8, 0.09>

    
    //
    // Translate dependant on param '_state' or clock for animation
    //
    // translate y * 0 // Clock start
    // translate y * 2 // Clock end

    #if (!defined(local._state))
      translate y * clock
    #else
      translate y * local._state 
    #end
  }
  
  // Object
  #difference
  {
    object{body}
  
    object{groove translate x  * 0.29}
    object{groove translate -x * 0.29}
    object{groove translate z  * 0.29}
    object{groove translate -z * 0.29}

    scale     _scale
    rotate    _rotate
    translate _translate
  }

  // DEBUG: Clock
  #debug concat("----- Clock: ", str(clock,3,1), "\n")
#end
