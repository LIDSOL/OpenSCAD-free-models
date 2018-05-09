

module ArduinoUNO(espesorArduino=1.6,taladroEntradas=10){
    
     /*
    medidas ARDUINO UNO
    68.6
    53.3
    12.5
    */
    
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

ArduinoUNO();