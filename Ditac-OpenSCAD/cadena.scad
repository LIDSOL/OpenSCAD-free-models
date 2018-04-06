use<baseDitac.scad>;
use<redondeador.scad>;
use<agujeroRedondo.scad>;



module cadena(espesor=3,alfa=0.1,dimX=1,dimY=6,resolucion=100,iniNoX=0,finNoX=0,iniNoY=1,finNoY=1){


//materiales
beta=(3*alfa)/32;
gamma=alfa+beta;

//longitudes
lonX=(2*dimX)*espesor+gamma;
lonY=(2*dimY)*espesor+gamma;

difference(){ 
 //pieza a redondear  
baseDitac(espesor,alfa,dimX,dimY,resolucion,iniNoX,finNoX,iniNoY,finNoY);

//agujeroRedondo arriba
translate([0,espesor*(dimY-1)])
agujeroRedondo(espesor,alfa,resolucion);
    
    //agujeroRedondo abajo
translate([0,-espesor*(dimY-1)])
agujeroRedondo(espesor,alfa,resolucion);


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
espesor -> espesor del material
alfa -> medida por destruccion del material por corte lAser
dimX -> numero de elementos (cuadros u agujeros) en el arreglo X
dimY -> numero de elementos (cuadros u agujeros) en el arreglo Y
resoluciOn -> calidad de partes circulares en el dibujo (100 Optima)
iniNoX -> inicio en el arreglo base (agujeros cuadrados) en X
iniNoY -> inicio en el arreglo base (agujeros cuadrados) en Y
finNoX -> fin en el arreglo base (agujeros cuadrados) en X
finNoY -> fin en el arreglo base (agujeros cuadrados) en Y
*/
cadena(3,0.1,3,6,100,0,0,1,1);
