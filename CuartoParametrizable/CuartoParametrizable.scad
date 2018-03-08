
//#####RECAMARA PARAMETRIZABLE ########

largo=4.42;
ancho=4.45;
alto=2.25;
grosor=0.15;
cube([largo,ancho,grosor],center=true);
//####PARED XZ1 #####
translate([0,(ancho-grosor)/2,(alto+grosor)/2])
cube([largo,grosor,alto],center=true);
//####PARED XZ2 #####
translate([0,-(ancho-grosor)/2,(alto+grosor)/2])
cube([largo,grosor,alto],center=true);
//####PARED XY1 #####
translate([(largo-grosor)/2,0,(alto+grosor)/2])
cube([grosor,ancho,alto],center=true);
//####PARED XY2 #####

translate([-(largo-grosor)/2,0,(alto+grosor)/2])
difference(){
cube([grosor,ancho,alto],center=true);
//ventana
cube([]);

}