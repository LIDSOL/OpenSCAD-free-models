

//Parte donde se apoya el rollo
translate([25+(65/2)*cos(45),-(65/2)*sin(45)-25,-(26)+2])
difference(){
cylinder(d=31,$fn=100,h=26);
cylinder(d=31-2,$fn=100,h=26);

}


//apoyo
translate([0,30,-28])
rotate([-90,0,0])
difference(){
cube([30,70,6],center=true);
//recortador
    translate([0,0,1])
minkowski(){
    cube([0.1,70,0.1],center=true);
    //se agregaron 4 mm a la altura del acople 
    //Se garego 2mm a d1
    //se agrego 0mm a d2
cylinder(d1=15+2,d2=13,h=2+4,fn=100);
    
}
}//fin diferencia

linear_extrude(height=7)
difference(){
    
//figura
minkowski(){
//trayectoria
union(){
    translate([0,14])
square([0.1,28],center=true);
//pieza45grados
translate([(65/2)*cos(45),-(65/2)*sin(45)])
rotate(45)
square([0.1,65],center=true);
}
//redondeador
circle(r=30,$fn=100);

}

//cuadrado recortador
translate([-30,30])
square([60,30]);

}