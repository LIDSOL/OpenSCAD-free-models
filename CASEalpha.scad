/*
####Explicación de variables#####
lonX                                    ->  longitud de cubo a esculpir en X
lonY                                    ->  longitud de cubo a esculpir en Y
lonZ                                    ->  longitud de cubo a esculpir en Z
espesor                             ->  espesor de cubo a esculpir
espesorEstructuras          -> longitud de costillas estructurales
redondeadorMinkowski    -> radio de la esfera que se ocupa para la funcion Minkowki
//por borrar aqui
alturaSolapa                    ->altura extension de case para hacer que embone
*/


lonX=60;
lonY=70;
lonZ=60;
espesor=1;
espesorEstructuras=0.75;
redondeadorMinkowski=1;
alturaSolapa=1;
//cube([lonX,lonY,lonZ],center=true);


divisiones=3;

parte=1;

if(parte==0){

difference(){

//Cubo "Case" a esculpir
minkowski(){
cube([lonX,lonY,lonZ],center=true);
sphere(r=redondeadorMinkowski,$fn=100);
}
//recortador rejillas
recortadorRejilla(lonX,lonY,lonZ,espesor,espesorEstructuras,redondeadorMinkowski);

translate([-lonX,-lonY,-alturaSolapa])
cube([lonX*2,lonY*2,lonZ*2]);



}//fin difference

//solapaInterior
translate([0,0,-alturaSolapa])
Solapa(lonX-(espesor),lonY-(espesor),espesor,redondeadorMinkowski/2,alturaSolapa);

}

if(parte==1){
    
 difference(){
   
//Cubo "Case" a esculpir
minkowski(){
cube([lonX,lonY,lonZ],center=true);
sphere(r=redondeadorMinkowski,$fn=100);
}
//recortador rejillas
recortadorRejilla(lonX,lonY,lonZ,espesor,espesorEstructuras,redondeadorMinkowski);

translate([-lonX,-lonY,-lonZ*2+alturaSolapa])
cube([lonX*2,lonY*2,lonZ*2]);



}//fin difference


//solapaExterior
translate([0,0,-alturaSolapa/2])
Solapa(lonX,lonY,espesor,redondeadorMinkowski,alturaSolapa);

}

/*
###Modulo recortadorRejilla####
Modulo que reutiliza los cortes Interiores a un cubo  o estructura similar para realizar costillas
*/

module recortadorRejilla(lonX=60,lonY=60,lonZ=60,espesor=1,espesorEstructuras=0.75,redondeadorMinkowski=1){

//recortador rejillas
//union(){

//Generacion de medidas de cubos que sirven para recortar "costills"
menX=(lonX-(2*espesor)-((divisiones-1)*espesor))/divisiones;
menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;
menZ=(lonZ-(2*espesor)-((divisiones-1)*espesor))/divisiones;

//Generacion de matriz cubica a partir de numero de divisiones
translate([-(lonX-2*espesor)/2,-(lonY-2*espesor)/2,-(lonZ-2*espesor)/2,])
for(i=[0:divisiones-1]){
    for(j=[0:divisiones-1]){
        for(k=[0:divisiones-1]){
            translate([(menX+espesor)*i,(menY+espesor)*j,(menZ+espesor)*k])
            cube([menX,menY,menZ]);
        }
    }
}



//cubo recortador de grueso "espesorEstructuras"
cube([lonX-2*espesor-2*espesorEstructuras,lonY-2*espesor-2*espesorEstructuras,lonZ-2*espesor-2*espesorEstructuras],center=true);

//}//fin union recortador rejillas

}//fin modulo recortadorRejilla

/*
###Modulo Solapa####
Modulo que reutiliza variables anteriores con la adicional:
alturaSolapa                    ->altura extension de case para hacer que embone
*/

module Solapa(lonX=60,lonY=60,espesor=1,redondeadorMinkowski=1,alturaSolapa=3){
      translate([0,0,alturaSolapa/2])
       difference(){
        minkowski(){
                cube([lonX,lonY,alturaSolapa],center=true);
                cylinder(r=redondeadorMinkowski,h=alturaSolapa,$fn=100);
            }
        
            //A recortar
             minkowski(){
                cube([lonX-espesor,lonY-espesor,alturaSolapa*2],center=true);
                cylinder(r=redondeadorMinkowski/2,h=alturaSolapa,$fn=100);
            }
            
            //cube([lonX-espesor*2,lonY-espesor*2,2*alturaSolapa],center=true);
        }
}


/*
//solapaExterior
Solapa(lonX,lonY,espesor,redondeadorMinkowski,3);
//solapaInterior
translate([0,0,2])
Solapa(lonX-(espesor),lonY-(espesor),espesor,redondeadorMinkowski/2,3);
*/