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

piezaDCorr(espesor,alfa,beta,resoluciOn,numX=1,numY=3,vacIo=0);

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
