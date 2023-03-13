// camera positions

#macro render_plan(f, nx, nz)
    camera {
        up <0, 1, 0>
        angle f    
        location <0, 5000, 0>
        look_at <0 , 0 ,  0> 
        translate <nx,0,-1>
    } 
#end 

#macro render_front_elev(f, nx, ny)
    camera {
        up <0, 1, 0>
        angle f    
        location <0, 0, -5000>
        look_at <0 , 0 ,  0> 
        translate <nx,ny,0>
    } 
#end 
 
 
#macro render_side_elev(f, nx, ny)
    camera {
        up <0, 1, 0>
        angle f    
        location <-5000, 0, 0>
        look_at <0 , 0 ,  0> 
        translate <nx,ny,0>
    } 
#end 


#macro render_ceiling(f, nx, ny)
    camera {
        up <0, 1, 0>
        angle f    
        location <0, -5000, 0>
        look_at <0 , 0 ,  0> 
        translate <nx,ny,0>
    } 
#end 



#macro render_top_left(f, pos)
    camera {
        up <0, 1, 0>
        angle f    
        location <-50, 50, -50> 
        look_at pos
    } 
#end 


#macro render_bottom_left(f, pos)
    camera {
        up <0, 1, 0>
        angle f    
        location <-50, -50, -50> 
        look_at pos
    } 
#end 



#macro render_top_right(f, pos)
    camera {
        up <0, 1, 0>
        angle f    
        location <100, 50, -50> 
        look_at pos
    } 
#end   


#macro render_bottom_right(f, pos)
    camera {
        up <0, 1, 0>
        angle f    
        location <50, -50, -50> 
        look_at pos
    } 
#end        

#macro render_ground_left(f, pos)
    camera {
        up <0, 1, 0>
        angle f    
        location <-50, 10, -50> 
        look_at pos
    } 
#end 