
use<Letras.scad>;

espesor=2;
toleranciaAdentro=1;
toleranciaComp=1.5;


//medidas tarjeta

lonX=87.01;
lonY=97.18;
lonZ=19.5;
altoPlaca=1.5;



/*
ES PARAMETRIZABLE!! :D
lonX=100;
lonY=100;
lonZ=100;
altoPlaca=1.5;
*/

//medidas externas 
ExlonX=lonX+(toleranciaAdentro+espesor)*2;
ExlonY=lonY+(toleranciaAdentro+espesor)*2;
//ExlonZ=lonZ+(toleranciaAdentro+espesor);
ExlonZ=lonZ+(toleranciaComp+altoPlaca+espesor);  
  
//medidas internas
InlonX=lonX+(toleranciaAdentro)*2;
InlonY=lonY+(toleranciaAdentro)*2;
//InlonZ=lonZ+(toleranciaAdentro);
InlonZ=lonZ+(toleranciaComp+altoPlaca);



/*
difference(){
     
 translate([-ExlonX/2,-ExlonY/2,0])
cube([ExlonX,ExlonY,ExlonZ]);
    
  translate([-InlonX/2,-InlonY/2,-InlonZ])
cube([InlonX,InlonY,InlonZ*2]);
  
 
  
}*/


 /*translate([-ExlonX/2,-ExlonY/2,0])
cube([ExlonX,ExlonY,ExlonZ]);
*/

/*
difference(){
translate([-ExlonX/2,-ExlonY/2,0])
cube([ExlonX,ExlonY,ExlonZ]);
    
translate([-InlonX/2,-InlonY/2,espesor])
cube([InlonX,InlonY,InlonZ*2]); 
    
}
*/


module taladroMalla(divisiones=3){
union(){

vastagos=divisiones-1;


//dimensiones de taladro de reja
dimTalCubX=(InlonX-(vastagos*espesor))/(divisiones+1);
dimTalCubY=(InlonY-(vastagos*espesor))/(divisiones+1);

transX=dimTalCubX+espesor; 
transY=dimTalCubY+espesor; 



translate([-(InlonX+espesor)/2,-(InlonY+espesor)/2,espesor])
union(){
for(i=[0:divisiones]){
   for(j=[0:divisiones]){
      translate([i*transX,j*transY,0])
//se le agrega al espesor para que el taladro consuma el material con errores en la frontera
      cube([dimTalCubX,dimTalCubY,InlonZ+espesor]);

   }
}
}//fin union for

//ajuste del costillar
factor=2;

translate([-(InlonX-toleranciaAdentro-factor)/2,-(InlonY-toleranciaAdentro-factor)/2,espesor+toleranciaAdentro])
cube([InlonX-toleranciaAdentro-factor,InlonY-toleranciaAdentro-factor,InlonZ]);
}//fin union global
}



difference(){
translate([-ExlonX/2,-ExlonY/2,0])
cube([ExlonX,ExlonY,ExlonZ]);
    
//Costillar
taladroMalla();
    
/*    
//AGUJEROS PLACa
translate([0,0,lonZ+espesor+toleranciaComp+espesor+altoPlaca-0.4])
rotate([0,180,0])

placa();
    */

translate([-37,-7,1])
rotate([0,180,180])

Letras(escala=0.6,altura=1);

}

/*
//PLACA
translate([0,0,lonZ+espesor+toleranciaComp+espesor+altoPlaca+0.1])
rotate([0,180,0])

placa();
*/

module poste(){
difference(){
resta=0;
cylinder(r=5/2,$fn=100,h=InlonZ+espesor-resta);
cylinder(r=2.5/2,$fn=100,h=InlonZ+6-resta);
}


}

resta=0;

/*
//refuerzo extra
translate([lonX/2-(3.5)-44,lonY/2-(3.5)+(espesor*2),espesor])
cube([espesor,espesor*1.2,InlonZ]);

//Superior Izquierdo
translate([lonX/2-(3.5),lonY/2-(3.5),0])
poste();

//refuerzoY Superior Izquierdo
translate([lonX/2-(3.5)-(espesor/2),lonY/2-(3.5)+(espesor),espesor])
cube([espesor,espesor*2.2,InlonZ-resta]);

//refuerzoX Superior Izquierdo
translate([lonX/2-(3.5)+(espesor),lonY/2-(3.5)-(espesor/2),espesor])
cube([espesor*2.2,espesor,InlonZ-resta]);


//Inferior Izquierdo

//ajuste
//translate([1,-1,0])
translate([-1,1,0])

//centramiento
translate([lonX/2-(3.5),-lonY/2+(3.5),0])
poste();

//refuerzoX Inferior Izquierdo
translate([lonX/2-(5.5)+(espesor*1.5),-lonY/2+(5.5)-(espesor),espesor])
cube([espesor*2.4,espesor,InlonZ-resta]);

//refuerzoY Inferior Izquierdo
translate([lonX/2-(5.5),-lonY/2+(5.7)-(espesor*3.8),espesor])
cube([espesor,espesor*2,InlonZ-resta]);

//Superior Derecho

//centramiento
translate([-lonX/2+(3.5),lonY/2-28.84,0])
poste();

//refuerzoX Superior Derecho
translate([-lonX/2+(4.5)-(espesor*3.5),lonY/2-28.84-(espesor/2),espesor])
cube([espesor*2,espesor,InlonZ-resta]);

//Inferior Derecho

//ajuste
translate([1,1,0])

//centramiento
translate([-lonX/2+(3.5),-lonY/2+(3.5),0])
poste();

//refuerzoY Inferior Derecho
translate([-lonX/2+(3.5),-lonY/2+(4.5)-espesor*3.5,espesor])
cube([espesor,espesor*2.6,InlonZ-resta]);

//refuerzoX Inferior Derecho
translate([-lonX/2+(4.5)-espesor*3.5,-lonY/2+(3.5),espesor])
cube([espesor*2.7,espesor,InlonZ-resta]);
*/
