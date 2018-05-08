//use<LogoIdea161.scad>
//use<LogoDitacRegSCorch.scad>

//PRUEBAS PARA SCORCH CAD
//include<LogoIdea161.scad>
//include<LogoDitacRegSCorch.scad>


//Variables que se usaron si la integración del modulo
/*
lonX=60;
lonY=70;
lonZ=10;
//La medida Z es la mitad
//Espesor mínimo de estructuras el verdadero espesor o da Minkowski
espesor=1;
escalaTexto=8;
//postes=1;
//cube([lonX,lonY,lonZ],center=true);
diametroPoste=5;
tornillo=2.5;
*/



/*
####Explicación de variables#####
lonX                                    ->  longitud de cubo a esculpir en X
lonY                                    ->  longitud de cubo a esculpir en Y
lonZ                                    ->  longitud de cubo a esculpir en Z
espesor                             ->  espesor de cubo a esculpir
redondeadorMinkowski    -> radio de la esfera que se ocupa para la funcion Minkowki
//por borrar aqui
alturaSolapa                    ->altura extension de case para hacer que embone
*/




module CASEgamma(lonX=60,lonY=70,lonZ=10,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1){

if(parte==0){
difference(){
        cube([lonX,lonY,lonZ],center=true);
        cube([lonX-(2*espesor),lonY-(2*espesor),lonZ-(2*espesor)],center=true);
        
    translate([0,0,-lonZ])
        cube([lonX*2,lonY*2,lonZ*2],center=true);
        
}

//Poste (1,1)
translate([-diametroPoste+lonX/2,-diametroPoste+lonY/2,0])
poste(diametroPoste,tornillo,lonZ);

//Poste (-1,1)
translate([-diametroPoste+lonX/2,+diametroPoste-lonY/2,0])
poste(diametroPoste,tornillo,lonZ);


//Poste (1,-1)
translate([diametroPoste-lonX/2,-diametroPoste+lonY/2,0])
poste(diametroPoste,tornillo,lonZ);

//Poste (-1,-1)
translate([diametroPoste-lonX/2,diametroPoste-lonY/2,0])
poste(diametroPoste,tornillo,lonZ);
}//fin parte 0

if(parte==1){
difference(){
        cube([lonX,lonY,lonZ],center=true);
        cube([lonX-(2*espesor),lonY-(2*espesor),lonZ-(2*espesor)],center=true);
        
    translate([0,0,lonZ])
        cube([lonX*2,lonY*2,lonZ*2],center=true);
        
}

//Poste (1,1)
translate([-diametroPoste+lonX/2,-diametroPoste+lonY/2,-lonZ/2])
poste(diametroPoste,tornillo,lonZ);

//Poste (-1,1)
translate([-diametroPoste+lonX/2,+diametroPoste-lonY/2,-lonZ/2])
poste(diametroPoste,tornillo,lonZ);


//Poste (1,-1)
translate([diametroPoste-lonX/2,-diametroPoste+lonY/2,-lonZ/2])
poste(diametroPoste,tornillo,lonZ);

//Poste (-1,-1)
translate([diametroPoste-lonX/2,diametroPoste-lonY/2,-lonZ/2])
poste(diametroPoste,tornillo,lonZ);
}//fin parte 0





}//Fin modulo case gamma


//#######POSTE CASE GAMMA#####
module poste(diametroPoste=5,tornillo=2.5,alturaTornillo){
translate([0,0,alturaTornillo/4])
    difference(){

        cylinder(d=diametroPoste,$fn=100,h=alturaTornillo/2,center=true);
        cylinder(d=tornillo,$fn=100,h=alturaTornillo,center=true);
    }
}//Fin modulo poste (para case gamma)

//#####RENDERIZADOS#####
lonX=60;
lonY=80;
lonZ=10;
espesor=1.5;
diametroPoste=5;
tornillo=2.5;
CASEgamma();

//####LOGOS####
/*
tamaNioLogos=0.5;

translate([-20*tamaNioLogos,-lonY/4,lonZ/2])
union(){
   linear_extrude(height=espesor/2)
   Ditac(tamaNioLogos);


    translate([30*tamaNioLogos,5*tamaNioLogos])
    linear_extrude(height=espesor/2)
    Idea(tamaNioLogos/4);
}

*/