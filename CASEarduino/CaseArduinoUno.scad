include<./../Componentes/boards.scad>;
include<./../CASEgamma/CASEgamma.scad>;
//LOGOS
include<./../Logos/LogoIdea161.scad>;
include<./../Logos/LogoDitacRegSCorch.scad>;
//Recortadores
include<./../Utilidades/Utilities.scad>;

//#####RENDERIZADOS#####
lonX=70;
lonY=75;
lonZ=25;
espesor=1.5;
diametroPoste=5;
tornillo=2.5;
parte=0;
//logos
tamaNioLogos=0.5;
//postes arduino
alturaPostesArduino=12;
diametroPosteArduino=6;
tornilloArduino=3.2;
tol=0.5;
recorrimiento=2;

if(parte==0){
   difference(){
       translate([0,0,-recorrimiento])
       CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ+recorrimiento,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=0);
    
       translate([0,0,-recorrimiento/2])
       rotate(-90)
      ArduinoUNO(taladroEntradas=20,tol=tol,modo=1);
    
       /*
       //transformacion inicial
       translate([-53.3/2,68.6/2,-12.5])
       rotate(-90)
       //se aumento 8 en eje y y se redujo 1mm en eje x del la coordenada del último tornillo
      translate([13.6+1.1-1,3+4.7+27.9+15.2+8,0])
       cylinder(r=1,$fn=100,h=lonZ*2);
       */
  }
  
  //####LOGOS####

//tamaNioLogos=0.5;

translate([-20*tamaNioLogos+2,-lonY/4,lonZ/2-recorrimiento/2])
union(){
   linear_extrude(height=espesor/2)
   Ditac(tamaNioLogos);


    translate([30*tamaNioLogos,5*tamaNioLogos])
    linear_extrude(height=espesor/2)
    Idea(tamaNioLogos/4);
}


//####TEXTO###
translate([-20*tamaNioLogos-3,-lonY/4+10,lonZ/2-recorrimiento/2])
linear_extrude(height=espesor/2)
 text(size=4,font = "Simplex","PabloVC");
  
}

if(parte==1){
   difference(){
       union(){
           translate([0,0,-recorrimiento])
       CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ-recorrimiento,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
           
             
       //###Tornillos arduino#####
       /*
       alturaPostesArduino=12;
         diametroPosteArduino=6;
           tornilloArduino=3.2;
*/
           
      translate([-53.3/2,68.6/2,-12.5-recorrimiento/2])
       rotate(-90)
union(){       
translate([13.6,3,0])
poste(diametroPosteArduino,tornilloArduino,alturaPostesArduino);

translate([13.6+51.9,3+4.7,0])
poste(diametroPosteArduino,tornilloArduino,alturaPostesArduino);

translate([13.6+51.9,3+4.7+27.9,0])
poste(diametroPosteArduino,tornilloArduino,alturaPostesArduino);

translate([13.6+1.1,3+4.7+27.9+15.2,0])
poste(diametroPosteArduino,tornilloArduino,alturaPostesArduino);
}
       }
          
      translate([0,0,-recorrimiento/2]) 
       rotate(-90)
      ArduinoUNO(taladroEntradas=20,tol=tol,modo=1);
       
     //recortador Estrella
       translate([0,-5,-50])
       linear_extrude(height=100)
       //RecortadorEstrella(lonX=53, lonY=30,orillas=1,redondeadorPoly=0.5);
       RecortadorEstrellaInverso(lonX=58,lonY=50,orillas=3,redondeadorPoly=2);
 
  }
}


