//use<agujeroCuadrado.scad>
use<agujeroRedondoCorr.scad>
use<agujeroCuadradoCorr.scad>
use<RedMotShaft.scad>

module baseDitacCorr(espesorBD=3,alfaBD=0.1,beta=(3*0.1)/32,dimX=2,dimY=2,resoluciOn=100,modo=1,iniNoX=0,finNoX=0,iniNoY=0,finNoY=0,iniNoX2=0,finNoX2=0,iniNoY2=0,finNoY2=0){

//beta=(3*alfaBD)/32;
gamma=alfaBD+beta;

lonX=(2*dimX+1)*espesorBD+2*gamma;
lonY=(2*dimY+1)*espesorBD+2*gamma;



translate([-lonX/2,-lonY/2])
difference(){
  //cuadrado a taladrar
square([lonX,lonY]);


//taladros en foma del agujero cuadrado
    
//reposicionamiento de taladros
translate([1.5*espesorBD+gamma,1.5*espesorBD+gamma])
   
for(i=[iniNoX:dimX-1-finNoX]){
    for(j=[iniNoY:dimY-1-finNoY]){
        translate([2*i*espesorBD,2*j*espesorBD])
      if(modo==0){
        agujeroCuadradoCorr(espesorBD,alfaBD,beta,resoluciOn);
       }
       else if(modo==1){
      agujeroRedondoCorr(espesorBD,alfaBD,beta,resoluciOn);
       }
       else if(modo==2){
       RedMotShaft(resoluciOn);
       }
    }
}






}//fin difference



}//fin module


//parametros
//espesor
//alfa, lo que se llava el material por corte
//beta, lo que el material llleva por fircción
//dimension x, longitud
//dimension y, altura
//resolucion, en los egmentos circulares
//parametro
//      redondo=1 --> agujeros redondos
//      redondo=0 --> agujeros cuadrados
//parametro for izquierda
//parametro for derecha
//parametro for abajo
//parametro for arriba
//todos los parámetros ceros significa todo taladrado
//el parámetro a ingresar es una fila menos de agujeros, por lo que no se debe ingresar un número mayor a la mitad de la dimensiOn

/*union(){
baseDitacCorr(3,0.1,(3*0.1)/32,7,7,100,0,0,0,0,0);
    square([20,20],center=true);
}*/

echo((3*0.1)/32);
//diferenciación para 3D
//baseDitacCorr(3,0,-1,7,7,100,0,0,0,0,0);

baseDitacCorr(3,0.1,(3*0.1)/32,7,7,100,2,0,0,0,0);


