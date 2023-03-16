// beetle
// m.miller 3.11.2023 

#version 3.8; 
#declare quality = 0;    
// #declare use_area_lights = 1;    
#declare light_adaptive = 1; 
#declare Norm = <0,0,0>;

global_settings {    
    max_trace_level 5
    ambient_light <.05,.05,.07> * 15
    assumed_gamma 1.5
}                        

//
// Background
//
// background { rgb <0.10, 0.12, 0.13> }
// background {color rgb<13,17,23> / 256}

// -----------------------------------------------------------------------------------------
//                      S K Y
//------------------------------------------------------------------------------------------ 

#declare show_fog = false;
//#include "include/beetle/sky.inc"
//object { skydome no_shadow }


// -----------------------------------------------------------------------------------------
//                      S T A G E   L I G H T S
//------------------------------------------------------------------------------------------ 

#declare array_count = 2;
#declare intencity = 1;

// --- S K Y  L I G H T 1
#macro light_S1 ()
light_source {
    <0,0,0> 
    #declare light_color = color red .05 green .05 blue .05 ;                      
    light_color * intencity                   
    area_light
    <100, 0, 0> <0, 0, 100>         
    array_count, array_count                          
    adaptive 0                    
    jitter                        
    circular                      
    orient                        
    translate <200, 0, 0>
}   
#end
// light_S1()


// --- S K Y  L I G H T 2
#macro light_S2 ()
light_source {
    <0,0,0> 
    #declare light_color = color red .05 green .05 blue .05 ;                      
    light_color * intencity                   
    area_light
    <100, 0, 0> <0, 0, 100>         
    array_count, array_count                          
    adaptive 0                    
    jitter                        
    circular                      
    orient                        
    translate <0, 200, 0>
}   
#end
// light_S2()


// --- S K Y  L I G H T 3
#macro light_S3 ()
light_source {
    <0,0,0> 
    #declare light_color = color red .05 green .05 blue .05 ;                      
    light_color * intencity                   
    area_light
    <100, 0, 0> <0, 0, 100>         
    array_count, array_count                          
    adaptive 0                    
    jitter                        
    circular                      
    orient                        
    translate <0, 10, 200>
}   
#end
// light_S3()


// --- S K Y  L I G H T 4
#macro light_S4 ()
light_source {
    <0,0,0> 
    #declare light_color = color red .05 green .05 blue .05 ;                      
    light_color * intencity                   
    area_light
    <100, 0, 0> <0, 0, 100>         
    array_count, array_count                          
    adaptive 0                    
    jitter                        
    circular                      
    orient                        
    translate <125,80,125> // Camera
}   
#end
light_S4()


// --- U N D E R   L I G H T
#macro light_B ()
light_source {
      <0,0,0>                
      color rgb <.25,.5,.14> * 2
            
      spotlight               
      translate <100, -100, -10> 
      point_at <40,8,0>   
      radius 10                
      tightness 5             
      falloff 30
  }
#end
// light_B()


// --- S P O T   L I G H T
#macro light_C ()
light_source {
      <0,0,0>                
      color rgb <.25,.25,.34> * 2      
      spotlight               
      translate <50, 200, 50> 
      point_at <50,8,0>   
      radius 5                
      tightness 5             
      falloff 20
  }
#end
//light_C()



   
// -----------------------------------------------------------------------------------------
//                      B E E T L E
//------------------------------------------------------------------------------------------ 

#include "include/beetle/beetle_materials.inc"
#include "include/beetle/beetle.inc"
#include "include/beetle/tools.inc"

object { beetle translate <-52,0,0> rotate -y * (clock + 160)}
       

// -----------------------------------------------------------------------------------------
//                      F L O O R
//------------------------------------------------------------------------------------------ 
//#declare floor_plane = object{ plane{y,0} material{M_gray50_satin} no_shadow} 
//floor_plane
  

// -----------------------------------------------------------------------------------------
//                      U N D E R L A Y
//------------------------------------------------------------------------------------------

#declare img_scale = <100,100,.1> ; 
#declare img_rot = <90,0,0> ;
#declare img_pos = <0,0,-34> ;  
#declare mat = underlay_material;
//object { image_underlay() translate <0,.1,0>}      



// -----------------------------------------------------------------------------------------
//                      C A M E R A S
//------------------------------------------------------------------------------------------
#include "include/beetle/camera_rigs.inc"      
#declare ortho_fov = 1.5;   
#declare pers_fov = 65;

//render_sample (M_beetle_eye, 1)      

//render_plan(ortho_fov,50,-1)      
//render_ceiling(ortho_fov,50,-1)
//render_front_elev(ortho_fov,50,10) 
//render_side_elev(ortho_fov,60,10) 

// render_top_left(pers_fov,<50,2,0>)                     
// render_bottom_left(pers_fov,<60,10,0>) 
// render_top_right(pers_fov,<60,2,0>) 
// render_ground_left(pers_fov,<30,10,0>)


#declare luminosity = 1;
#include "include/playground.inc"

// Axis
// axis (50,50,50,1)

// Additional Light
light_source {<-100,120,100>, rgb <1,1,1> * 1.2 }
light_source {<50,-50,50>, rgb <1,1,1> * 0.2 }

// light_source {<125,3,100>, rgb <1,1,1> * 0.1}

//camo(<0,100,0>,<0,0,0>,50)
//camo(<100,0,0>,<0,0,0>,50)
camp(<125,110,125> * 1.1 ,<0,8.5,0>, 35)

