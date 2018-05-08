use<CASEgamma.scad>
use<boards.scad>
//LOGOS
use<LogoIdea161.scad>
use<LogoDitacRegSCorch.scad>

//#####RENDERIZADOS#####
lonX=70;
lonY=75;
lonZ=25;
espesor=1.5;
diametroPoste=5;
tornillo=2.5;
parte=0;

if(parte==0){
   difference(){
       CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=0);
      /*
       medidas ARDUINO UNO
       68.6
       53.3
       12.5
       */
       translate([-53.3/2,68.6/2,-12.5/2])
       rotate(-90)
      ArduinoUNO(espesorArduino=1.6,taladroEntradas=20);
  }
  
  //####LOGOS####

tamaNioLogos=0.5;

translate([-20*tamaNioLogos+2,-lonY/4,lonZ/2])
union(){
   linear_extrude(height=espesor/2)
   Ditac(tamaNioLogos);


    translate([30*tamaNioLogos,5*tamaNioLogos])
    linear_extrude(height=espesor/2)
    Idea(tamaNioLogos/4);
}

  
}

if(parte==1){
   difference(){
       union(){
       CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
           
             
       //###Tornillos arduino#####
       
       alturaPostesArduino=12;
         diametroPosteArduino=6;
           tornilloArduino=3.2;

           
      translate([-53.3/2,68.6/2,-12.5])
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
           /*
       medidas ARDUINO UNO
       68.6
       53.3
       12.5
       */
       translate([-53.3/2,68.6/2,-12.5/2])
       rotate(-90)
      ArduinoUNO(espesorArduino=1.6,taladroEntradas=20);
       
     
       
  }
}


