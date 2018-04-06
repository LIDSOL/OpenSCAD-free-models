module Diente(espesor=3,alfa=0.1,resoluciOn=100){
//EL DIENTE NO NECESITA GAMMA
    
beta=(3*alfa)/32;
gamma=alfa+beta;
ancho=2*gamma+espesor;

union(){
translate([0,-espesor/2])
    //abajo del eje es material para la unión
square([ancho,espesor]);
translate([ancho/2,espesor/2])
circle(r=ancho/2,$fn=resoluciOn);
}

}//fin modue

Diente(3,0.1,10);