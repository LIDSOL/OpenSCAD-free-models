use<baseDitacCorr.scad>;
use<piezaDCorr.scad>;

module PiezaBase3D(espesor=3,beta=0.009,
resoluciOn=100,
numX=1,
numY=1,tamaNio=0.3,ajuste=-0.25){

//valores corte 2D
//alfa=0.1;
//beta=(3*0.1)/32;
//Valores "reales" para 3D
alfa=0;
echo(beta=(3*0.1)/32);

modo=0;



//control relaciOn par impar
listX=[for(a=[2:3:3*numX])a];
listY=[for(a=[2:3:3*numY])a];

//parseo relacion par-impar
dimX=listX[numX-1];
dimY=listY[numY-1];


//Prueba de differencia en 2D
/*
difference(){


piezaDCorr(espesor,alfa,beta,resoluciOn,numX,
numY,modo);

baseDitacCorr(espesor,0,-1.1,dimX,dimY,resoluciOn,0,0,0,0,0);

}
*/

tol=-1.1;

//Prueba 3D
difference(){
translate([0,0,-espesor/2])
linear_extrude(height=espesor)
piezaDCorr(espesor,alfa,beta,resoluciOn,numX,
numY,modo,tamaNio,1,ajuste);

translate([0,0,-(2*espesor)/3])
translate([0,0,-espesor/2])
linear_extrude(height=espesor)
baseDitacCorr(espesor,0,tol,dimX,dimY,resoluciOn,0,0,0,0,0);

translate([0,0,+(2*espesor)/3])
translate([0,0,-espesor/2])
linear_extrude(height=espesor)
baseDitacCorr(espesor,0,tol,dimX,dimY,resoluciOn,0,0,0,0,0);

}

}//fin modulo


PiezaBase3D(espesor=3,beta=0.009,
resoluciOn=100,
numX=1,
numY=1);



