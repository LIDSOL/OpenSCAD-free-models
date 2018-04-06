use<baseDitac.scad>
use<redondeador.scad>


module barras(espesor=3,alfa=0.1,dimX=2,dimY=2,resolucion=100){


//materiales
beta=(3*alfa)/32;
gamma=alfa+beta;

//longitudes
lonX=(2*dimX)*espesor+gamma;
lonY=(2*dimY)*espesor+gamma;

difference(){ 
 //pieza a redondear  
baseDitac(espesor,alfa,dimX,dimY,resolucion);

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


barras(3,0.1,1,1,100);
