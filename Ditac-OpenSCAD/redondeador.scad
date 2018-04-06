 
 
 
 module redondeador(espesor=3,alfa=0.1,resolucion=100){
 
 beta=(3*alfa)/32;
gamma=alfa+beta;
 
 translate([-espesor/2,-espesor/2])
 difference(){
   translate([espesor,espesor])
    square([2*espesor,2*espesor],center=true);
   circle(r=espesor+gamma,$fn=resolucion);
 }
 
 }//fin module
 
 redondeador();