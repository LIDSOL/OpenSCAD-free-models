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



module cubo(espesor=3,alfa=0.1,
beta=(3*0.1)/32,
resoluciOn=100,dimX=1,dimY=1,dimZ=1,vacio1=1,vacio2=1,vacio3=1,vacio4=0,vacio5=0,vacio6=0){


//TAPA
translate([0,0,dimZ*6*espesor])
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimY,vacio1);
//FIN TAPA

//BASE
if(dimZ%2==1){
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimY,vacio2);
}
else{
    rotate(180)
   linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimY,vacio2); 
    
}
//FIN BASE

//LateralXZdetras
if(dimX%2==1){
translate([0,(3*dimY*espesor)+1.5,dimZ*3.5*espesor])
rotate([90,90,0])
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimZ,dimX,vacio3);
}else{
    translate([0,(3*dimY*espesor)+1.5,dimZ*3.5*espesor])
rotate([90,270,0])
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimZ,dimX,vacio3);
    
}
//FinLateralXZdetras

/*
translate([0,3.5*espesor,3.5*espesor])
rotate([90,90,0])
//base(vacio2);
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimZ,vacio3);

mirror([0,1,0]){
   translate([0,3.5*espesor,3.5*espesor])
   rotate([90,90,0])
   //base(vacio5);
    linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimZ,vacio4);
}

translate([2.5*espesor,0,3.5*espesor])
rotate([90,0,90])
//base(vacio3);
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimZ,vacio5);
    
mirror([1,0,0]){
   translate([2.5*espesor,0,3.5*espesor])
   rotate([90,0,90])
   //base(vacio4);
    linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,dimX,dimZ,vacio6);

}
*/
    
    
}

//FIN CUBO

cubo();

/*
//COMENTARIO2D

//6 de esta:
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=2,numY=1,vacIo=0);

//FIN COMENTARIO 2D
*/

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
