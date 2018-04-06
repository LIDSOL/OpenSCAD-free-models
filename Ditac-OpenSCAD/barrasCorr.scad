use<baseDitacCorr.scad>
use<redondeador.scad>


module barrasCorr(dimX=2,dimY=2,espesor=3,alfa=0.1,beta=(3*0.1)/32,resolucion=100,redondo=1){


//materiales
gamma=alfa+beta;

//longitudes
lonX=(2*dimX)*espesor+gamma;
lonY=(2*dimY)*espesor+gamma;

difference(){ 
 //pieza a redondear  
baseDitacCorr(espesor,alfa,beta,dimX,dimY,resolucion,redondo);

     //primer redondeador
     translate([lonX/2,lonY/2])
     redondeador(espesor,alfa,resolucion);
   
   //segundo redondeador espejo del primero
    mirror([0,1]){
       translate([lonX/2,lonY/2])
      redondeador(espesor,alfa,resolucion);
    }
    
    //copia de los primeros 2 redondeadores
    mirror([1,0]){
         translate([lonX/2,lonY/2])
         redondeador(espesor,alfa,resolucion);
            mirror([0,1]){
               translate([lonX/2,lonY/2])
                redondeador(espesor,alfa,resolucion);
           }    
    }
}//fin diferencia

}//fin modulo


/*
redondo = 0 --> agujero cuadrado
redondo = 1 --> agujero redondo
*/


//linear_extrude(height=3)
barrasCorr(2,2,3,0.1,(3*0.1)/32,100,redondo=1);
