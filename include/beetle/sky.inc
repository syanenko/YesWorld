// --- SKY  

#declare C_brown_gray =     color red 1 green 0.6 blue 0.32 ; 
#declare C_teal =           color rgb<.30,.51,.54> ; 

#declare CM_sky_dome_brown_blue =
color_map { 
    [0.0 .5 color C_teal color C_brown_gray]
    [0.5 1.0 color C_brown_gray color C_teal]  
}    

             
// --- C L O U D S  
#declare M_bozo_cloud_A = 
material {  
    texture {
        pigment {
              bozo
              turbulence 0.6
              colour_map {
                 [0.0 0.3   colour red 1.0 green 1.0 blue 1.0 filter 1.0
                            colour red 1.0 green 1.0 blue 1.0 filter 1.0]
                 [0.3 0.8   colour red 1.0 green 1.0 blue 1.0 filter 1.0
                            colour red 1.0 green 1.0 blue 1.0 filter .6]
                 [0.8 1.001 colour red 1.0 green 1.0 blue 1.0 filter .6
                            colour red 1.0 green 1.0 blue 1.0 filter 0]
              }
        }  
       finish {
          ambient 0
          diffuse 0 
          emission 1
       }
    }
} 


#declare world_offset = 0; 
#declare world_scale = <10000,500,10000>; 
#declare world_color_map = CM_sky_dome_brown_blue;
#declare world_emission = .3;  
#declare world_clouds = true;
#declare world_cloud_material = material {M_bozo_cloud_A scale world_scale.y} ;
 
#declare world_texture =
    texture{
       pigment {
        gradient y     
        color_map {CM_sky_dome_brown_blue}
       }
       finish {
          ambient 1.0                 
          diffuse 1
          emission world_emission                 
       }
     }



#declare skydome =  
    sphere { <0.0, 0.0, 0.0>, 1
       hollow on
       texture{ world_texture scale 3 translate y-0}
       scale world_scale
       translate y+world_offset
    }
    #if (world_clouds = true)
         sphere { <0.0, 0.0, 0.0>, .95 
            hollow on
            scale world_scale
            translate y+world_offset 
            material {world_cloud_material }
         }
    #end 
 
                      
// --- FOG 
#declare fog_color_tan = rgbft<0.33, 0.3, 0.25, 0.0, 0.0> * 1.3 ; 
#declare fog_color_gray = rgbft<0.17, 0.17, 0.17, 0.0, 0.0> * 2 ; 
#declare fog_color = fog_color_gray; 
#declare fog_distance = 2000;
#declare fog_turb = 20;
#declare fog_depth = 0; 
#declare fog_octaves = 10;
#declare f_offset = -500;

#if (show_fog = true) 
    fog {
        distance fog_distance
        color fog_color
        turbulence fog_turb  
        turb_depth fog_depth
        octaves fog_octaves   
        fog_offset f_offset  
        }
#end       
