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

use<LogoIdea161.scad>

//MEDIDAS TARJETA DE PRESENTACION
lonX=60;
lonY=90;

lonZ=10;
//La medida Z es la mitad para amboas casos (parte 1 y parte 2)

//Espesor mínimo de estructuras el verdadero espesor o da Minkowski
espesor=0.25;
//Si las estructuras no se requieren se puede escojer el valor de cero
espesorEstructuras=0;
redondeadorMinkowski=3;
alturaSolapa=1;
escalaTexto=8;
postes=1;
//cube([lonX,lonY,lonZ],center=true);


divisiones=6;
amplitudTornillobase=0.5;
parte=0;
toleranciaSolapaInterior=0.5;

if(parte==0){

difference(){

//Cubo "Case" a esculpir
minkowski(){
cube([lonX,lonY,lonZ],center=true);
sphere(r=redondeadorMinkowski,$fn=100);
}
//recortador rejillas
recortadorRejilla(lonX,lonY,lonZ,espesor,espesorEstructuras,redondeadorMinkowski);

translate([-lonX,-lonY,-alturaSolapa*(3/4)])
cube([lonX*2,lonY*2,lonZ*2]);

//posteAGUJERO(1,1)

//PROVISIONAL
diametro=4;
tornillo=2;
menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;

//Agujero para tornillo (1,1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);


//Agujero para tornillo (-1,1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);

//Agujero para tornillo (-1,-1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);

//Agujero para tornillo (1,-1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);



}//fin difference

//toleranciaSolapaInterior sirve para disminuir la fricción entre partes de la caja

//solapaInterior
translate([0,0,-alturaSolapa])
Solapa(lonX-(espesor)-toleranciaSolapaInterior,lonY-(espesor)-toleranciaSolapaInterior,espesor,redondeadorMinkowski/2,alturaSolapa*2);

//####Postes####

if(postes==1){

//replica de valores utilizados en recortadorRejilla
menX=(lonX-(2*espesor)-((divisiones-1)*espesor))/divisiones;
menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;

diametro=4;
tornillo=2;

//POSTE (1,1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (-1,1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (1,-1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (-1,-1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

}//fin postes

}

//fin parte == 0

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
translate([0,0,-alturaSolapa*(3/4)])
Solapa(lonX,lonY,espesor,redondeadorMinkowski,alturaSolapa*2);

separacionElementos=20;

//Texto
translate([-26,-separacionElementos,lonZ/2+espesor+redondeadorMinkowski/2])
 linear_extrude(height=redondeadorMinkowski)
 text(size=escalaTexto,font = "Simplex","IDEA 1.61");

//LOGO Idea 1.61
tamaNioLogo=20;
translate([0,separacionElementos,lonZ/2+espesor+redondeadorMinkowski/2])
 linear_extrude(height=redondeadorMinkowski)
 resize([tamaNioLogo,1.61*tamaNioLogo])
 LogoIdea();

//####Postes####

if(postes==1){

//replica de valores utilizados en recortadorRejilla
menX=(lonX-(2*espesor)-((divisiones-1)*espesor))/divisiones;
menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;

diametro=4;
tornillo=2;

//POSTE (1,1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,0])
poste(diametro,tornillo);

//POSTE (-1,1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,0])
poste(diametro,tornillo);

//POSTE (1,-1)
translate([lonX/2-diametro/2-espesor-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,0])
poste(diametro,tornillo);

//POSTE (-1,-1)
translate([-lonX/2+diametro/2+espesor+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,0])
poste(diametro,tornillo);

}//fin postes

 


}


/*
#####Module Poste#####
Modulo que hace postes para tornillo
diametro->diametro del poste
tornillo->diametro del agujero interno para atornillar
*/

module poste(diametro=5,tornillo=2.5){
translate([0,0,lonZ/4])
difference(){

cylinder(d=diametro,$fn=100,h=lonZ/2,center=true);
cylinder(d=tornillo,$fn=100,h=lonZ,center=true);
}


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

module Solapa(lonX=60,lonY=60,espesor=1,redondeadorMinkowski=0,alturaSolapa=3){
      translate([0,0,alturaSolapa/2])
       difference(){
        minkowski(){
                cube([lonX,lonY,alturaSolapa],center=true);
                cylinder(r=redondeadorMinkowski,h=alturaSolapa,$fn=100,center=true);
            }
        
            //A recortar
             minkowski(){
                cube([lonX-espesor,lonY-espesor,alturaSolapa*2],center=true);
                cylinder(r=redondeadorMinkowski/2,h=alturaSolapa,$fn=100);
            }
            
            translate([0,0,alturaSolapa*(3/2)])
            cube([lonX*2,lonY*2,alturaSolapa*2],center=true);
             translate([0,0,-alturaSolapa*(3/2)])
            cube([lonX*2,lonY*2,alturaSolapa*2],center=true);
            
            //cube([lonX-espesor*2,lonY-espesor*2,2*alturaSolapa],center=true);
        }
}



