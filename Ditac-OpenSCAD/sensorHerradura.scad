
use<piezaDCorr.scad>;

module Herradura(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){
union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,numX=2,numY=1,vacIo=0);
square([3*10,3*4],center=true);
}

difference(){ 
square([3*10.5,3*4.5],center=true);
square([11,6],center=true);
translate([9,0])
circle(r=1,$fn=100);
    translate([-9,0])
circle(r=1,$fn=100);
}

}
}


//SENSOR SOLO PARA ESCALA DE 3MM
module sensorH21A1(){
    
    union(){
    
difference(){
  linear_extrude(height=7)
  square([11,6],center=true);
    translate([0,0,4])
  cube([3.2,7,8],center=true);
}

 difference(){
     
   translate([0,0,-1.5])
   cube([24.5,6,3],center=true);
     
    translate([9.5,0,0])
    cylinder(r=1.5,$fn=100,h=7,center=true);
     
    mirror([1,0,0]){
    translate([9.5,0,0])
    cylinder(r=1.5,$fn=100,h=7,center=true);
    }
 }
 
 }//fin union
 
 }//FIN SENSOR
 
translate([0,0,6])
 sensorH21A1();


linear_extrude(height=3)
Herradura();
