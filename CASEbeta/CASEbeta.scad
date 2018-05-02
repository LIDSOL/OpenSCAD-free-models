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

lonX=60;
lonY=70;
lonZ=10;
//La medida Z es la mitad
//Espesor mínimo de estructuras el verdadero espesor o da Minkowski
espesorEstructuras=1;
redondeadorMinkowski=2;
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
//recortadorRejilla(lonX,lonY,lonZ,espesor,espesorEstructuras,redondeadorMinkowski);

cube([lonX,lonY,lonZ],center=true);
//cube([lonX-(2*espesor),lonY-(2*espesor),lonZ-(2*espesor)],center=true);


translate([-lonX,-lonY,-alturaSolapa*(3/4)])
cube([lonX*2,lonY*2,lonZ*2]);

//posteAGUJERO(1,1)

//PROVISIONAL
diametro=4;
tornillo=2;
//menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;

//Agujero para tornillo (1,1)
translate([lonX/2-diametro/2-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);


//Agujero para tornillo (-1,1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);

//Agujero para tornillo (-1,-1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);

//Agujero para tornillo (1,-1)
translate([lonX/2-diametro/2-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
cylinder(r=tornillo,$fn=100,h=lonZ*2,center=true);



}//fin difference

//toleranciaSolapaInterior sirve para disminuir la fricción entre partes de la caja

//solapaInterior
translate([0,0,-alturaSolapa])
Solapa(lonX-toleranciaSolapaInterior,lonY-toleranciaSolapaInterior,espesor,redondeadorMinkowski/2,alturaSolapa*2);

//####Postes####

if(postes==1){

//replica de valores utilizados en recortadorRejilla
//menX=(lonX-(2*espesor)-((divisiones-1)*espesor))/divisiones;
//menY=(lonY-(2*espesor)-((divisiones-1)*espesor))/divisiones;

diametro=4;
tornillo=2;

//POSTE (1,1)
translate([lonX/2-diametro/2-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (-1,1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (1,-1)
translate([lonX/2-diametro/2-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
poste(diametro,tornillo+amplitudTornillobase);

//POSTE (-1,-1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,-lonZ/2])
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
//recortadorRejilla(lonX,lonY,lonZ,espesor,espesorEstructuras,redondeadorMinkowski);

cube([lonX-(2*espesor),lonY-(2*espesor),lonZ-(2*espesor)],center=true);

translate([-lonX,-lonY,-lonZ*2+alturaSolapa])
cube([lonX*2,lonY*2,lonZ*2]);



}//fin difference


//solapaExterior
translate([0,0,-alturaSolapa*(3/4)])
Solapa(lonX,lonY,0,redondeadorMinkowski,alturaSolapa*2);

separacionElementos=20;

//Texto
translate([-26,-separacionElementos,lonZ/2+espesor+redondeadorMinkowski/2])
 linear_extrude(height=redondeadorMinkowski)
 text(size=escalaTexto,font = "Simplex","IDEA 1.61");

//LOGO Idea 1.61
tamaNioLogo=20;
translate([0,separacionElementos,lonZ/2+redondeadorMinkowski/2])
 linear_extrude(height=redondeadorMinkowski)
 resize([tamaNioLogo,1.61*tamaNioLogo])
 LogoIdea();

//####Postes####

if(postes==1){

//replica de valores utilizados en recortadorRejilla
menX=(lonX-((divisiones-1)*espesor))/divisiones;
menY=(lonY-((divisiones-1)*espesor))/divisiones;

diametro=4;
tornillo=2;

//POSTE (1,1)
translate([lonX/2-diametro/2-espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,0])
poste(diametro,tornillo);

//POSTE (-1,1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,lonY/2-diametro/2-espesor-menY+diametro/2,0])
poste(diametro,tornillo);

//POSTE (1,-1)
translate([lonX/2-diametro/2-espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,0])
poste(diametro,tornillo);

//POSTE (-1,-1)
translate([-lonX/2+diametro/2+espesorEstructuras/2,-lonY/2+diametro/2+espesor+menY-diametro/2,0])
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



module Solapa(lonX=60,lonY=60,0,redondeadorMinkowski=0,alturaSolapa=3){
      translate([0,0,alturaSolapa/2])
       difference(){
        minkowski(){
                cube([lonX,lonY,alturaSolapa],center=true);
                cylinder(r=redondeadorMinkowski,h=alturaSolapa,$fn=100,center=true);
            }
        
            //A recortar
             minkowski(){
                cube([lonX-espesor,lonY,alturaSolapa*2],center=true);
                cylinder(r=redondeadorMinkowski/2,h=alturaSolapa,$fn=100);
            }
            
            translate([0,0,alturaSolapa*(3/2)])
            cube([lonX*2,lonY*2,alturaSolapa*2],center=true);
             translate([0,0,-alturaSolapa*(3/2)])
            cube([lonX*2,lonY*2,alturaSolapa*2],center=true);
            
            //cube([lonX-espesor*2,lonY-espesor*2,2*alturaSolapa],center=true);
        }
}



