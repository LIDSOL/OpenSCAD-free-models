use<piezaDCorr.scad>
use<piezaDRCorr.scad>
use<barrasCorr.scad>
use<barrasRedondoCorr.scad>
use<cadenaCorr.scad>
use<ejesCorr.scad>
use<ruedasCorr.scad>
use<ruedasCorrRedondo.scad>
use<unificadorFrontalCorr.scad>
use<unificadorLateralCorr.scad>
use<codo.scad>

espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
resoluciOn=100;
separaciOn=4;
vacIo=0;

module pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo=0)
linear_extrude(height=espesor){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX,numY,vacIo=0);
}

module cubo111(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo1=0,vacio2=0,vacio3=0,vacio4=0,vacio5=0,vacio6=0){
    //TAPA
    translate([0,0,6*espesor])
    pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo1=0);
    //BASE
pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo2=0);
    //LADO1
    translate([0,espesor*3.5,espesor*3.5])
    rotate([90,90,0])
    pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo2=0);
    //LADO2
    mirror([0,1,0]){
        translate([0,espesor*3.5,espesor*3.5])
    rotate([90,90,0])
    pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo2=0);
    }
    //LADO3
     translate([espesor*3.5,espesor*3.5,espesor*3.5])
    rotate([0,90,0])
    pieza3D(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,numY=1,vacIo2=0);
    
    
}

cubo111(espesor,alfa,beta,resoluciOn,numX=1,numY=1,vacIo1=0,vacio2=0,vacio3=0,vacio4=0,vacio5=0,vacio6=0);

//piezaDCorr(espesor,alfa,beta,resoluciOn,numX=2,numY=1,vacIo=0);

//piezaDRCorr(espesor,alfa,beta,resoluciOn,numX=1,numY=1,vacIo=0);

//barrasCorr(2,2,espesor,alfa,beta,resoluciOn);

//barrasRCorr(2,2,espesor,alfa,beta,resoluciOn);

//cadena(2,4,espesor,alfa,resoluciOn,0,0,1,1);

//ejesCorr(2,espesor,alfa,beta,resoluciOn);

//ruedasCorr(1,resoluciOn,espesor,alfa,beta);

//ruedasCorrRedondo(1,resoluciOn,espesor,alfa,beta);

//unificadorFrontalCorr(2,espesor,alfa,beta,resoluciOn);

//unificadorLateralCorr(espesor,alfa,beta,resoluciOn,4);

//codo(dimX=2,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32,lados=10);
