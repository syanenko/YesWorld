// convert blender x3d 
// type: Mball, Cubic Spline Sweep 
// m.miller 03.09.2023

#declare beetle_antenia =
sphere_sweep {
     cubic_spline
     18,
     <17.831772 , 11.058150 ,  -5.616360> , 1.000000 
     <17.831772 , 11.058150 ,  -5.616360> , 1.000000 
     <17.984888 , 10.804173 ,  -6.860529> , 0.361280 
     <18.865423 , 10.493756 ,  -8.058275> , 0.549695 
     <19.171696 , 10.070460 ,  -8.490338> , 0.361280 
     <19.297487 , 9.421408 ,  -10.185778> , 0.546041 
     <19.357647 , 9.054551 ,  -10.918645> , 0.361280 
     <19.392185 , 8.574816 ,  -12.293454> , 0.595403 
     <19.497955 , 8.123302 ,  -13.052838> , 0.411907 
     <19.505831 , 7.700006 ,  -15.273755> , 0.708744 
     <19.301695 , 7.417809 ,  -15.999570> , 0.427066 
     <18.337723 , 6.881634 ,  -17.814106> , 0.668747 
     <17.816044 , 6.627657 ,  -18.233717> , 0.444603 
     <15.763349 , 5.893945 ,  -19.730709> , 0.631572 
     <15.186855 , 5.668187 ,  -19.872469> , 0.425211 
     <13.703094 , 5.394615 ,  -20.033131> , 0.499738 
     <13.391220 , 5.301331 ,  -20.316652> , 0.346270 
     <13.391220 , 5.301331 ,  -20.316652> , 0.346270 
}
  

#declare beetle_head =
#declare th = 0.8 ;
#declare sf = 2.0 ;
blob {
     threshold th
     sphere{ <0,0,0>, 1, 1 scale <4.082, 1.905, 4.968> * sf  translate <18.137, 12.750, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <3.175, 3.175, 3.962> * sf  translate <17.657, 10.550, -0.059> }
     sphere{ <0,0,0>, 1, 1 scale <1.711, 1.533, 4.187> * sf  translate <27.669, 8.621, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <0.646, 0.643, 0.806> * sf  translate <13.641, 9.908, 3.742> }
     sphere{ <0,0,0>, 1, 1 scale <1.171, 1.171, 2.096> * sf  translate <14.772, 12.814, -2.377> }
     sphere{ <0,0,0>, 1, 1 scale <2.272, 2.320, 1.217> * sf  translate <24.007, 10.782, -6.590> }
     sphere{ <0,0,0>, 1, 1 scale <1.171, 1.171, 2.096> * sf  translate <14.772, 12.814, 1.734> }
     sphere{ <0,0,0>, 1, 1 scale <1.894, 1.355, 2.031> * sf  translate <13.324, 9.923, -1.910> }
     sphere{ <0,0,0>, 1, 1 scale <1.894, 1.355, 2.031> * sf  translate <13.324, 9.923, 1.834> }
     sphere{ <0,0,0>, 1, 1 scale <2.272, 2.320, 1.217> * sf  translate <24.007, 10.782, 6.004> }
     sphere{ <0,0,0>, 1, 1 scale <1.262, 1.262, 1.575> * sf  translate <12.974, 11.174, 2.108> }
     sphere{ <0,0,0>, 1, 1 scale <1.262, 0.889, 1.575> * sf  translate <11.288, 10.861, -1.938> }
     sphere{ <0,0,0>, 1, 1 scale <1.262, 0.889, 1.575> * sf  translate <11.250, 10.861, 2.108> }
     sphere{ <0,0,0>, 1, 1 scale <1.262, 1.262, 1.575> * sf  translate <13.012, 11.174, -1.938> }
     sphere{ <0,0,0>, 1, 1 scale <1.894, 0.954, 2.031> * sf  translate <11.656, 11.051, 0.226> }
     sphere{ <0,0,0>, 1, 1 scale <2.526, 0.535, 1.413> * sf  translate <12.434, 9.433, -0.025> }
     sphere{ <0,0,0>, 1, 1 scale <2.058, 2.051, 2.568> * sf  translate <26.058, 8.951, 4.541> }
     sphere{ <0,0,0>, 1, 1 scale <0.819, 0.817, 1.023> * sf  translate <13.641, 9.908, 4.829> }
     sphere{ <0,0,0>, 1, 1 scale <0.636, 0.634, 0.794> * sf  translate <11.919, 9.908, 5.151> }
     sphere{ <0,0,0>, 1, 1 scale <0.489, 0.487, 0.610> * sf  translate <12.793, 9.908, 5.093> }
     sphere{ <0,0,0>, 1, 1 scale <0.530, 0.528, 0.661> * sf  translate <12.916, 9.908, -5.068> }
     sphere{ <0,0,0>, 1, 1 scale <0.577, 0.575, 0.720> * sf  translate <11.969, 9.908, -4.991> }
     sphere{ <0,0,0>, 1, 1 scale <0.725, 0.723, 0.905> * sf  translate <13.467, 9.908, -4.144> }
     sphere{ <0,0,0>, 1, 1 scale <5.820, 4.626, 6.546> * sf  translate <24.279, 11.928, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <2.058, 2.051, 2.568> * sf  translate <22.286, 8.951, 4.541> }
     sphere{ <0,0,0>, 1, 1 scale <2.058, 2.051, 2.568> * sf  translate <26.058, 8.951, -4.813> }
     sphere{ <0,0,0>, 1, 1 scale <2.058, 2.051, 2.568> * sf  translate <22.286, 8.951, -4.813> }
     sphere{ <0,0,0>, 1, 1 scale <2.526, 1.357, 1.413> * sf  translate <12.434, 11.382, -0.025> }
     sphere{ <0,0,0>, 1, 1 scale <3.441, 2.144, 3.441> * sf  translate <33.654, 10.782, 0.000> }
     }




#declare beetle_eyes =
union {        
    sphere { <0,0,0>, 2.5 scale<1,1,1>  translate<24.28, 11.4, -7.8> }  
    sphere { <0,0,0>, 2.5 scale<1,1,1>  translate<24.28, 11.4, 7.8> } 
}


#declare beetle_collar =
#declare th = 0.9 ;
#declare sf = 2.0 ;
blob {
     threshold th
     sphere{ <0,0,0>, 1, 1 scale <3.262, 0.623, 3.129> * sf  translate <32.270, 11.796, -7.965> }
     sphere{ <0,0,0>, 1, 1 scale <3.266, 0.894, 4.089> * sf  translate <37.655, 11.796, -7.011> }
     sphere{ <0,0,0>, 1, 1 scale <4.325, 1.806, 5.416> * sf  translate <33.256, 11.796, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <4.192, 0.919, 10.014> * sf  translate <42.912, 11.997, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <3.094, 0.591, 2.968> * sf  translate <32.237, 11.796, 7.297> }
     sphere{ <0,0,0>, 1, 1 scale <3.266, 0.499, 4.089> * sf  translate <37.459, 11.796, 7.093> }
     sphere{ <0,0,0>, 1, 1 scale <4.565, 1.496, 4.486> * sf  translate <36.049, 13.564, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <9.774, 2.057, 9.110> * sf  translate <39.925, 8.516, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <2.906, 1.719, 4.780> * sf  translate <45.261, 14.132, -0.000> }
     sphere{ <0,0,0>, 1, 1 scale <1.294, 1.208, 1.223> * sf  translate <43.764, 7.145, 5.047> }
     sphere{ <0,0,0>, 1, 1 scale <1.294, 1.208, 1.223> * sf  translate <43.708, 7.145, -4.902> }
     sphere{ <0,0,0>, 1, 1 scale <5.093, 3.038, 9.110> * sf  translate <39.925, 11.796, 0.000> }
     }

   
     
#declare beetle_shell =
#declare th = 0.8 ;
#declare sf = 2.0 ;
blob {
     threshold th
     sphere{ <0,0,0>, 1, 1 scale <12.194, 4.814, 7.824> * sf  translate <60.537, 13.368, -8.296> }
     sphere{ <0,0,0>, 1, 1 scale <11.511, 4.869, 6.814> * sf  translate <79.106, 15.972, -6.337> }
     sphere{ <0,0,0>, 1, 1 scale <12.822, 5.764, 9.749> * sf  translate <67.258, 15.102, -8.411> }
     sphere{ <0,0,0>, 1, 1 scale <11.511, 4.869, 6.814> * sf  translate <79.106, 15.972, 5.185> }
     sphere{ <0,0,0>, 1, 1 scale <12.194, 4.814, 7.824> * sf  translate <60.537, 13.368, 6.568> }
     sphere{ <0,0,0>, 1, 1 scale <12.822, 5.764, 9.749> * sf  translate <67.258, 15.102, 7.835> }
     sphere{ <0,0,0>, 1, 1 scale <3.683, 2.760, 5.618> * sf  translate <49.401, 11.259, -0.000> }
     sphere{ <0,0,0>, 1, 1 scale <9.981, 2.248, 5.207> * sf  translate <77.809, 9.061, -0.000> }
     sphere{ <0,0,0>, 1, 1 scale <1.847, 1.386, 1.746> * sf  translate <53.275, 9.588, 6.353> }
     sphere{ <0,0,0>, 1, 1 scale <1.951, 1.464, 1.844> * sf  translate <63.727, 8.741, 4.964> }
     sphere{ <0,0,0>, 1, 1 scale <1.951, 1.464, 1.844> * sf  translate <63.727, 8.741, -5.690> }
     sphere{ <0,0,0>, 1, 1 scale <1.847, 1.386, 1.746> * sf  translate <52.608, 9.588, -6.950> }
     sphere{ <0,0,0>, 1, 1 scale <13.622, 0.686, 9.791> * sf  translate <68.702, 11.296, -0.000> }
     sphere{ <0,0,0>, 1, 1 scale <1.731, 1.386, 4.806> * sf  translate <70.446, 8.332, 0.000> }
     sphere{ <0,0,0>, 1, 1 scale <1.436, 1.386, 1.357> * sf  translate <52.497, 9.588, -0.037> }
     sphere{ <0,0,0>, 1, 1 scale <1.436, 1.386, 1.357> * sf  translate <63.722, 9.588, -0.037> }
     sphere{ <0,0,0>, 1, 1 scale <1.436, 1.386, 1.357> * sf  translate <67.723, 9.588, -0.037> }
     sphere{ <0,0,0>, 1, 1 scale <11.511, 3.556, 6.814> * sf  translate <79.106, 11.304, 5.185> }
     sphere{ <0,0,0>, 1, 1 scale <11.511, 3.556, 6.814> * sf  translate <79.106, 11.304, -6.337> }
     }



#declare beetle_leg_A =
sphere_sweep {
     cubic_spline
     15,
     <43.652, 6.943, -6.233> , 1.000
     <43.652, 6.943, -6.233> , 1.000
     <42.914, 10.210, -11.032> , 0.592
     <42.082, 13.888, -16.354> , 1.097
     <41.109, 13.192, -16.516> , 0.687
     <39.473, 10.438, -15.962> , 0.552
     <37.629, 4.203, -15.070> , 0.906
     <37.217, 3.689, -15.801> , 0.480
     <36.706, 3.131, -16.951> , 0.570
     <36.422, 2.908, -17.449> , 0.415
     <35.444, 1.976, -19.468> , 0.665
     <35.172, 1.522, -20.111> , 0.404
     <34.232, 0.923, -22.185> , 0.679
     <33.536, 0.681, -22.795> , 0.236
     <33.536, 0.681, -22.795> , 0.236   // end point
     }


#declare beetle_leg_B =
sphere_sweep {
     cubic_spline
     15,
     <53.572, 0.625, -33.129> , 0.236   // end point
     <53.572, 0.625, -33.129> , 0.236
     <53.491, 0.922, -32.385> , 0.679
     <53.332, 2.826, -30.043> , 0.404
     <53.229, 3.450, -29.454> , 0.665
     <52.786, 4.382, -27.220> , 0.415
     <52.642, 4.605, -26.857> , 0.570
     <52.214, 5.163, -25.304> , 0.480
     <52.010, 5.677, -24.574> , 0.906
     <50.022, 9.564, -23.487> , 0.552
     <48.147, 11.574, -22.884> , 0.687
     <47.421, 12.548, -21.950> , 1.097
     <49.411, 10.353, -16.339> , 0.592
     <52.432, 8.417, -7.455> , 1.000
     <52.432, 8.417, -7.455> , 1.000
     }



#declare beetle_leg_C =
sphere_sweep {
     cubic_spline
     15,
     <63.537, 6.748, -6.010> , 1.000
     <63.537, 6.748, -6.010> , 1.000
     <67.185, 8.959, -14.894> , 0.592
     <70.196, 10.483, -22.561> , 1.097
     <71.408, 9.537, -23.060> , 0.687
     <75.483, 8.277, -23.045> , 0.552
     <79.323, 5.677, -22.357> , 0.906
     <79.952, 5.163, -23.010> , 0.480
     <81.113, 4.605, -24.061> , 0.570
     <81.604, 4.382, -24.463> , 0.415
     <82.934, 3.450, -26.157> , 0.665
     <83.231, 3.015, -26.630> , 0.404
     <84.393, 0.964, -28.934> , 0.679
     <84.782, 0.647, -29.677> , 0.236
     <84.782, 0.647, -29.677> , 0.236   // end point
     }


#declare beetle_mouth_A =
sphere_sweep {
     cubic_spline
     8,
     <11.819, 9.907, -4.958> , 0.540
     <11.819, 9.907, -4.958> , 0.540
     <10.462, 9.907, -4.560> , 0.472
     <9.494, 9.907, -3.610> , 0.369
     <8.979, 9.907, -2.305> , 0.244
     <8.761, 9.907, -1.285> , 0.144
     <8.734, 9.907, -0.822> , 0.098
     <8.734, 9.907, -0.822> , 0.098
     }


#declare beetle_mouth_B =
sphere_sweep {
     cubic_spline
     8,
     <9.020, 10.099, -0.517> , 0.098
     <9.020, 10.099, -0.517> , 0.098
     <9.146, 10.099, -0.780> , 0.144
     <9.234, 10.099, -1.210> , 0.244
     <9.246, 10.099, -1.795> , 0.369
     <9.608, 10.099, -2.327> , 0.472
     <10.332, 10.099, -2.469> , 0.722
     <10.332, 10.099, -2.469> , 0.722
     }


#declare beetle_mouth_C =
sphere_sweep {
     cubic_spline
     8,
     <11.162, 9.147, -2.056> , 0.722
     <11.162, 9.147, -2.056> , 0.722
     <10.437, 9.147, -1.914> , 0.472
     <10.076, 9.147, -1.382> , 0.369
     <10.063, 9.055, -0.796> , 0.244
     <9.976, 8.891, -0.367> , 0.144
     <9.850, 8.721, -0.104> , 0.098
     <9.850, 8.721, -0.104> , 0.098
     }

#declare beetle_foot =
sphere_sweep {
     cubic_spline
     10,
     <0.382, 0.375, 0.158> , 0.162
     <0.382, 0.375, 0.158> , 0.162
     <-0.318, 0.293, -0.290> , 0.279
     <-1.349, 0.160, -0.109> , 0.162
     <-1.908, 0.320, 0.560> , 0.225
     <-1.979, 0.375, 1.402> , 0.162
     <-1.680, 0.174, 1.906> , 0.120
     <-1.200, 0.103, 2.064> , 0.110
     <-0.853, 0.071, 1.954> , 0.073
     <-0.853, 0.071, 1.954> , 0.073
     }


#declare foot_pos_A = <33.536, 0, -22.795> ; 
#declare foot_pos_B = <53.572, 0, -33.129> ; 
#declare foot_pos_C = <83.782, 0, -29.677> ;


//#declare beetle_material = material { beetle_skin_02 }

#declare beetle =
union {
    object { beetle_antenia     material {M_beetle_body}                }   
    object { beetle_antenia     material {M_beetle_body}    scale z*-1  } 
    object { beetle_head        material {M_beetle_body_2}              } 
    object { beetle_collar      material {M_beetle_body_2}              } 
    object { beetle_shell       material {M_beetle_body_2}              } 
    object { beetle_leg_A       material {M_beetle_body}                }
    object { beetle_leg_A       material {M_beetle_body}    scale z*-1  }
    object { beetle_leg_B       material {M_beetle_body}                }
    object { beetle_leg_B       material {M_beetle_body}    scale z*-1  }
    object { beetle_leg_C       material {M_beetle_body}                }
    object { beetle_leg_C       material {M_beetle_body}    scale z*-1  }
    object { beetle_mouth_A     material {M_beetle_body}                }
    object { beetle_mouth_A     material {M_beetle_body}    scale z*-1  } 
    object { beetle_mouth_B     material {M_beetle_body}                }
    object { beetle_mouth_B     material {M_beetle_body}    scale z*-1  } 
    object { beetle_mouth_C     material {M_beetle_body}                }
    object { beetle_mouth_C     material {M_beetle_body}    scale z*-1  }  
    object { beetle_eyes        material {M_beetle_eye}                 }
    
    object { beetle_foot     material {M_beetle_black} rotate y*-10 translate foot_pos_A             }
    object { beetle_foot     material {M_beetle_black} rotate y*-10 translate foot_pos_A  scale z*-1 }  
    object { beetle_foot     material {M_beetle_black} rotate y*-90 translate foot_pos_B             }
    object { beetle_foot     material {M_beetle_black} rotate y*-90 translate foot_pos_B  scale z*-1 }   
    object { beetle_foot     material {M_beetle_black} rotate y*-60 translate foot_pos_C             }
    object { beetle_foot     material {M_beetle_black} rotate y*-60 translate foot_pos_C  scale z*-1 } 
}
