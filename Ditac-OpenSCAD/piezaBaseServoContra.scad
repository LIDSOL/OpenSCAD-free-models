use<piezaDCorr.scad>;
use<agujeroCuadradoCorr.scad>


module BaseServoContra(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=3,numY=2,vacIo=0);
square([3*12,3*6],center=true);
}

difference(){ 
square([3*12.5,3*6.5],center=true);

translate([7,0])
agujeroCuadradoCorr();
    translate([-7,0])
agujeroCuadradoCorr();
}

}

}



//linear_extrude(height=3)
BaseServoContra();