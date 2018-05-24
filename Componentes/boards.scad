

module ArduinoUNODraft(taladroEntradas=10){
    
     /*
    medidas ARDUINO UNO
    68.6
    53.3
    12.5
    */
    
    //medidas
    espesorArduino=1.6;

//tarjeta
cube([68.6,53.3,espesorArduino]);

//entrada DC
translate([-taladroEntradas,3.3,espesorArduino])
cube([taladroEntradas,8.9,10.9]);

//entrada USB
translate([-taladroEntradas,31.7,espesorArduino])
cube([taladroEntradas,12,10.9]);

//Led RX TX
    //se tomo la coordenada de los pines analogicos mas 30 en el eje "Y"
translate([13.6+12.5,1+30,espesorArduino])
cube([2,4,10.9+taladroEntradas]);

//Led RX TX
    //se tomo la coordenada de los LED RX TX más 4mm (+4 por la medida de las ventanas) en el eje "Y"
translate([13.6+12.5,1+30+8,espesorArduino])
cube([2,2,10.9+taladroEntradas]);

//entrada pines (analogicos)
translate([13.6+12.5,1,espesorArduino])
cube([33,2,10.9+taladroEntradas]);

//entrada pines (digitales + PWM)
translate([13.6+2.5,53.3-2-1,espesorArduino])
cube([48,2,10.9+taladroEntradas]);

//###Tornillos arduino#####
translate([13.6,3,0])
rotate([180,0,0])
cylinder($fn=100,d=3.2,h=taladroEntradas);


translate([13.6+51.9,3+4.7,0])
rotate([180,0,0])
cylinder($fn=100,d=3.2,h=taladroEntradas);

translate([13.6+51.9,3+4.7+27.9,0])
rotate([180,0,0])
cylinder($fn=100,d=3.2,h=taladroEntradas);

translate([13.6+1.1,3+4.7+27.9+15.2,0])
rotate([180,0,0])
cylinder($fn=100,d=3.2,h=taladroEntradas);

//boton arduino
 //se redujo 8 mm en eje "x" y se aumento 1mm en eje "y" del la coordenada del último tornillo
      translate([13.6+1.1-8,3+4.7+27.9+15.2-1,0])
       cylinder(d=3.2,$fn=100,h=10.9+taladroEntradas);
   


}

module ArduinoUNO(TaladroEntradas=10,modo=0){
   
   /*
    medidas ARDUINO UNO
    68.6
    53.3
    12.5
    */
    
    echo("Medidas arduino",)
   
    if(modo==0){

            ArduinoUNODraft(TaladroEntradas=TaladroEntradas);
    }

     if(modo==1){
            translate([-68.6/2,-53.3/2,-12.5/2])
            ArduinoUNODraft(TaladroEntradas=TaladroEntradas);
    }

}


module RaspberryPi(taladroEntradas=10){
//Raspberry pi
    espesorTarjeta=1.6;
   
    medidaX=85;
    medidaY=56;
   
     /*
    medidas Rasberry Pi
     eje "x"= 85mm
     eje "y"= 56mm
      espesorTarjeta=1.6
    */
    
//tarjeta
cube([medidaX,medidaY,espesorTarjeta]);

//Conjunto USB
translate([medidaX,29-(14.3/2),espesorTarjeta])
cube([taladroEntradas,14.3,16]);

translate([medidaX,47-(14.3/2),espesorTarjeta])
cube([taladroEntradas,14.3,16]);

//Conector RJ45
translate([medidaX,10.25-(15.1/2),espesorTarjeta])
cube([taladroEntradas,15.1,13.5]);

//GPIO
translate([3.5*2,49,espesorTarjeta])
cube([52,6,8.5+taladroEntradas]);


//###TornillosRaspberry#####

translate([3.5,3.5,0])
rotate([180,0,0])
cylinder($fn=100,d=2.75,h=taladroEntradas);


translate([3.5+58,3.5,0])
rotate([180,0,0])
cylinder($fn=100,d=2.75,h=taladroEntradas);

translate([3.5,3.5+49,0])
rotate([180,0,0])
cylinder($fn=100,d=2.75,h=taladroEntradas);


translate([3.5+58,3.5+49,0])
rotate([180,0,0])
cylinder($fn=100,d=2.75,h=taladroEntradas);

}//fin raspberry Pi


//#####RENDERIZADOS####
//Se recomienda no tener renderizados (debugging)

//los modos se usan para reposicionar el objeto
/*
el primer argumento es la longitud de los taladros
el segundo argumento es el modo o posicionamiento
modo = 0 esquinado
modo = 1 el centro del objeto en el origen
*/

ArduinoUNO(20,1);




 //RaspberryPi(10,1);