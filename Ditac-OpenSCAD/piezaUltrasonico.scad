use<DienteCorr.scad>
use<baseDitacCorr.scad>;
use<piezaDCorr.scad>;

//parametrizables
//numX=3;
//numY=3;
/*
resoluciOn=10;
espesor=3;
alfa=0.1;
beta=(3*alfa)/32;
*/


module Ultrasonico(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){
    
    
union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=3,numY=2,vacIo=0);
square([3*16,3*6],center=true);
}

difference(){ 
square([3*16.5,3*6.5],center=true);
translate([12,0])
circle(r=8,$fn=resoluciOn);
    translate([-12,0])
circle(r=8,$fn=resoluciOn);
}

}




}

//SENSOR SOLO PARA ESCALA DE 3MM
module sensorHC04(reoluciOn=100){
    union(){
linear_extrude(height=12.5)
    translate([12,0])
circle(r=8,$fn=resoluciOn);
    linear_extrude(height=12.5)
    translate([-12,0])
circle(r=8,$fn=resoluciOn);
 cube([45,20,4],center=true);
    }
}//FIN SENSOR

sensorHC04();


linear_extrude(height=3)
Ultrasonico(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100);




