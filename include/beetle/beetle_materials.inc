//--- beetle materials

//--- C O L O R S
#ifndef (Transparent) #declare Transparent = rgbt 1 ;#end
#declare C_white =          color rgb<1,1,1>  ;
#declare C_black =          color rgb<0,0,0>  ;
#declare C_red =            color rgb<1,0,0>  ;  
#declare C_red_dark =       color rgb<.9,0,0> ; 
#declare C_gray50 =         color rgb<.5,.5,.5> ;

#declare CM_black_bands =
    color_map {
        [ 0.0       C_white ]  
        [ 0.3       C_white ]
        [ 0.50      C_black ]
        [ 0.9       C_white ]
        [ 1.0       C_white ]
        }  
        
        
// -----------------------------------------------------------------------------------------
//                     F I N I S H E S 
//------------------------------------------------------------------------------------------  

#declare F_velvet_metal =
    finish {
        ambient 0
        brilliance 8
        diffuse 1
        metallic
        specular 5
        roughness 1/20
        phong 3
        phong_size 100 //fresnel 
        reflection {0, .5 fresnel}
    }   
 
     
#declare F_metal_hard =
finish {
    conserve_energy 
    brilliance 5
    ambient 0
    diffuse 1 
    phong 20    
    phong_size 30
    metallic
    specular 5
    roughness 1/20
    reflection {0, .5 fresnel on } 
}


#declare F_bug_gloss =
    finish {
        ambient .5
        brilliance 8
        diffuse 1   
        //metallic
        specular 5
        roughness 1/100
        phong albedo 0.5
        phong_size 90  
        reflection {0, .8 fresnel}
    }
    
#declare F_gloss =
    finish {
        ambient .5
        brilliance 8
        diffuse 1   
        //metallic
        specular 5
        roughness 1/100
        phong albedo 0.5
        phong_size 70  
        reflection {.1, .4 fresnel}
    }
    
  
// -----------------------------------------------------------------------------------------
//                     P I G M E N T S
//------------------------------------------------------------------------------------------ 
   
#declare P_black_bands = 
   pigment { 
        bozo 
        color_map {CM_black_bands} 
        turbulence 0 
        }         
        
        
        
// -----------------------------------------------------------------------------------------
//                     N O R M A L S
//------------------------------------------------------------------------------------------  

#declare N_brush_xz = 
    normal {
       bozo 
       scale <1,.1,1>
       bump_size .2  
       turbulence 0 
    }  
    
#declare N_crackle_small = 
    normal {
        crackle
        turbulence .3 
        scale .1 
        bump_size 1
    }
        
#declare N_crackle_large = 
    normal {
        crackle
        turbulence .3 
        scale 1 
        bump_size .3
    }


// -----------------------------------------------------------------------------------------
//                     M A T E R I A L S
//------------------------------------------------------------------------------------------  

#declare M_gray50_satin = 
material{ 
    texture{ 
        pigment{ C_gray50 } 
        finish { F_gloss  }
        } 
    }




#declare default_material =  
material{ 
    texture {
        pigment{ rgb <0.4, 0.34, 0.2> } 
        finish {
            diffuse .9
            ambient .2 
            phong .5
            phong_size 40
            reflection .005
        } 
    }    
} 


#declare M_beetle_eye =  
material{ 
    texture {
        pigment{ C_black } 
        finish { F_bug_gloss }
        normal { N_crackle_large scale 1}
    }    
} 


// -----------------------------------------------------------------------------------------
//                      B E E T L E   L E G S 
//------------------------------------------------------------------------------------------ 
 
#declare img_diffuse = "include/beetle/beetle_diffuse.jpg"  
#declare img_bump    = "include/beetle/beetle_bump.jpg"  
#declare illum = 0 ;

#declare M_beetle_body = 
material {
    texture {
        pigment { 
            image_map {
                jpeg img_diffuse 
                interpolate 4 
            }
        }
    scale <100, 100, 1> translate <0,0,0>    
        finish  { F_velvet_metal }
        normal  { N_brush_xz     }
    }  
    rotate x*90
    translate <0,0,-34>   
}
   

       
#declare M_beetle_body_2 = 
material {
    texture {
        pigment { 
            image_map {
                jpeg img_diffuse 
                interpolate 4 
            }
        }
        scale <100, 100, 1> translate <0,0,0>    
        //finish  { F_velvet_metal }
        finish  { F_metal_hard   }
        normal  {
           bump_map {
                jpeg img_bump 
                interpolate 4 
           } 
           bump_size .2 
           scale <100, 100, 1> translate <0,0,0>
        }
    }  
    rotate x*90
    translate <0,0,-34>   
}

 
   

// -----------------------------------------------------------------------------------------
//                      B E E T L E   S K I N
//------------------------------------------------------------------------------------------  

  
#declare M_beetle_red = 
material {
    texture {
        pigment { C_red_dark } 
        finish { F_velvet_metal }
        normal { N_brush_xz }
    }   
}  

#declare M_beetle_black = 
material {
    texture {
        pigment { C_black } 
        finish  { F_velvet_metal }
        normal  { N_brush_xz scale 2}
    }   
}  


// -----------------------------------------------------------------------------------------
//                      S A M P L E    M A T E R I A L
//------------------------------------------------------------------------------------------  


#macro render_sample( mat, sz )
    
    camera {
        up <0, 1, 0>
        angle 65    
        location <0, 2, -5>
        look_at <0 , 0, 0> 
    } 

    light_source {
      <0,0,0>                
      color rgb <.14,.16,.14> * 7      
      spotlight               
      translate <-20, 20, -20> 
      point_at <0,0,0>   
      radius 3                
      tightness 2             
      falloff 14
      }

    light_source {
      <0,0,0>                
      color rgb <.14,.16,.14> * 3      
      spotlight               
      translate <20, -20, -10> 
      point_at <0,0,0>   
      radius 3                
      tightness 2             
      falloff 14
      }

    object { sphere { <0,0,0> 1 }   material {mat scale sz} hollow }
    
#end  



// -----------------------------------------------------------------------------------------
//                      U N D E R L A Y
//------------------------------------------------------------------------------------------


#declare img = "include/beetle/beetle_underlay.jpg"
#declare illum = .1 ;

#declare underlay_material = 
material {
    texture {
        pigment { 
            image_map {
                jpeg img 
                interpolate 4 
            }
        }
        
        finish {
            emission illum
            ambient 0
            diffuse 1
        }
    }    
}




