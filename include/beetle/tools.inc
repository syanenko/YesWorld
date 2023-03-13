//--- macro tools


#macro image_underlay ()
    #declare thin_box = box { 
        <0,0,0>,
        <1.0,1,1.0>
        } 
    object {
        thin_box  
        material{mat}
        scale img_scale
        rotate img_rot 
        translate img_pos  
        no_shadow
        }
#end  


//--- add to difference
#declare paper_Cut_Z =
union{ 
    plane{ <1,0,0> 0 }                        //--cut at center X
    plane{ <0,0,-1> 0 translate <0,0,.002>}   //--pos Z end
    plane{ <0,0,1> 0 translate <0,0,-.002>}   //--pos Z start     
    } 
       

//--- add to difference      
#declare paper_Cut_Z_Curved =
union{ 
    plane{ <1,0,0> 0 }                                      //--cut at center X
    sphere{ <0,0,0> 50    translate <0,0,50> }             //--pos Z end
    sphere{ <0,0,0> 50.01 translate <0,0,50> inverse}      //--pos Z start     
    } 
    


