//#####CASEgamma####

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
translate([0,0,alturaTornillo/4])
    difference(){

        cylinder(d=diametroPoste,$fn=100,h=alturaTornillo/2,center=true);
        cylinder(d=tornillo,$fn=100,h=alturaTornillo,center=true);
    }
}//Fin modulo poste (para case gamma)


//####AGUJERO REDONDO######
module agujeroRedondoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/3,resolucion=100){

gamma=alfa+beta;
  
    
    
    circle(r=(espesor/sqrt(2))+gamma,$fn=resolucion,center=true);

 

}

//#######AGUJEROCUADRADO#####


module agujeroCuadradoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){


//beta=(3*alfa)/(32);
//materiales
gamma=alfa+beta;
//geometria
delta=espesor/6;
espesorReducido=espesor-2*gamma;
desplazamientoCirculo=((espesorReducido/2)+gamma);

//dibujo
//square([espesor,espesor],center=true);
union(){
square([espesorReducido,espesorReducido],center=true);


//PRIMER PICO
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

//FIN PRIMER PICO

//SEGUNDO PICO

mirror([0,1]){
    
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

}

//FIN SEGUNDO PICO

//TERCER Y CUARTO PICO
mirror([1,0]){
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

mirror([0,1]){
    
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

}
    
    }

//FIN TERCER Y CUARTO PICO

}//fin union
}//fin module

//#######AGUJERO MOTOR REDUCTOR#####
module RedMotShaft(resoluciOn=110){

    difference(){
    circle(d=5.4,$fn=resoluciOn);
        
    translate([0,3+(3.7/2)])
    square([6,6],center=true);   
       
     mirror([0,1,0]){
     translate([0,3+(3.7/2)])
    square([6,6],center=true);   
     }
   }

   
   }

//#######BASE DITAC ##########
module baseDitacCorr(espesorBD=3,alfaBD=0.1,beta=(3*0.1)/32,dimX=2,dimY=2,resoluciOn=100,modo=1,iniNoX=0,finNoX=0,iniNoY=0,finNoY=0){

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


//################RENDERIZADO###############
/*
*************Explicacion Variables*********

espesorBD=3-> espesor base ditac, se utiliza para los cálculos de espaciamiento entre agujeros

alfaBD=0.1->medida que se resta considerando la destruccion del material (corte laser)

beta=(3*0.1)/32 -> meida que se utiliza para frccion con los componentes
dimX=2->elementos a proyectar en la direccion X
dimY=2->elementos a proyectar en la direccion Y
resoluciOn=100 -> numero de lados en las figuras circuilares
modo=1->MODOS: 1 para agujeros cuadrados, 2, para agujeros redondos, 3 para agujeros con motores reductores
iniNoX=0 -> variable de inicio de la matriz en X
finNoX=0 -> variable de final de la matriz en X
iniNoY=0 -> variable de inicio de la matriz en YfinNoY=0 -> variable de final de la matriz en Y
*/


CASEgamma();

translate([0,0,20])
linear_extrude(height=3)
baseDitacCorr(3,0.1,(3*0.1)/32,2,2,100,2,0,0,0,0);


