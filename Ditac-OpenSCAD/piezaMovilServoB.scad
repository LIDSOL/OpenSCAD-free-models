use<DienteCorr.scad>
use<baseDitacCorr.scad>;
use<piezaDCorr.scad>;

module ServoB(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=1,numY=3,vacIo=0);
square([3*4,3*12],center=true);
}

difference(){ 
square([3*4.5,3*12.5],center=true);


circle(r=6,$fn=resoluciOn);
    
}

}

}

ServoB();






