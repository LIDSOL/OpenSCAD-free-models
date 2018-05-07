//use<LogoIdea161.scad>


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




module CASEgamma(lonX=60,lonY=70,lonZ=10,espesor=1,diametroPoste=5,tornillo=2.5){

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

}//Fin modulo case gamma


//#######POSTE CASE GAMMA#####
module poste(diametroPoste=5,tornillo=2.5,alturaTornillo){
translate([0,0,lonZ/4])
    difference(){

        cylinder(d=diametroPoste,$fn=100,h=alturaTornillo/2,center=true);
        cylinder(d=tornillo,$fn=100,h=alturaTornillo,center=true);
    }
}//Fin modulo poste (para case gamma)

CASEgamma();
