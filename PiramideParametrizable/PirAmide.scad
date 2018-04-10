
  
     alturaPyramid=4;
     niveles=3;
     baseInicial=50;
for(i=[0:niveles]){
    translate([0,0,i*alturaPyramid])
    linear_extrude(height = alturaPyramid, scale = 0.8)
            square([baseInicial-i*alturaPyramid*3, baseInicial-i*alturaPyramid*3], center = true);

}