



//SENSOR SOLO PARA ESCALA DE 3MM
module sensorHC04(){
    union(){
linear_extrude(height=12.5)
    translate([12,0])
circle(r=8);
    linear_extrude(height=12.5)
    translate([-12,0])
circle(r=8);
 cube([45,20,4],center=true);
    }
}//FIN SENSOR


module sensorMQ(taladroEntradas=20){
tornillos=3;
espesorSensor=1.5;
//taladroEntradas=20;

//tornillos
translate([2,2,espesorSensor])
cylinder(d=tornillos,h=taladroEntradas,$fn=100);

translate([2+27,2,espesorSensor])
cylinder(d=tornillos,h=taladroEntradas,$fn=100);

translate([2+27,20.3-2,espesorSensor])
cylinder(d=tornillos,h=taladroEntradas,$fn=100);

translate([2,20.3-2,espesorSensor])
cylinder(d=tornillos,h=taladroEntradas,$fn=100);

//NO SE HAN INCLUIDO TOLERANCIAS
//sensor
translate([20,20.3/2,espesorSensor])
cylinder(d=20+0.2,h=taladroEntradas,$fn=100);

//tarjeta
cube([32,20.3,espesorSensor]);

}//fin sensor MQ

module sensorDHT11(taladroEntradas=20){

espesorSensor=1.5;
cube([29,14,espesorSensor]);

//NO SE HAN INCLUIDO TOLERANCIAS
translate([7,14/2,espesorSensor])
cylinder(d=3+0.2,h=taladroEntradas,$fn=100);

translate([20,14/2,espesorSensor+taladroEntradas/2])
cube([17,13,taladroEntradas],center=true);

}

//####RENDERIZADOS#####
$fn=100;

//sensorHC04();

//translate([-29/2,-14/2,0])
 //sensorDHT11(30);

//translate([-32/2,-20.3/2,0])
//sensorMQ();

