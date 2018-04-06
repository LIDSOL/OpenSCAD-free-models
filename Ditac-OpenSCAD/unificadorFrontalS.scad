use<Diente.scad> 

module unificadorFrontalS(dim=2,espesor=3,alfa=0.1,resoluciOn=100){

//material
beta=(3*alfa)/32;
gamma=alfa+beta;

//dientes de arriba
translate([0,espesor/2])
for(i=[0:dim-1]){
    translate([2*espesor*i,0])
    Diente(espesor,alfa,resoluciOn);
}

//dientes de abajo

mirror([0,1]){
   translate([0,espesor/2])
     for(i=[0:dim-1]){
        translate([2*espesor*i,0])
        Diente(espesor,alfa,resoluciOn);
     }      
}

//diente izquierda
translate([0,-(espesor)/2-gamma])
rotate(90)
Diente(espesor,alfa,resoluciOn);

//diente derecha
translate([(dim+(dim-1))*(espesor)+2*gamma,0])


mirror([1,0]){
    
   translate([0,-espesor/2-gamma])
   rotate(90)
   Diente(espesor,alfa,resoluciOn);
}

//cuadrado parametrizable
translate([0,-(espesor)/2-gamma])
square([(dim+(dim-1))*espesor+2*gamma,espesor+2*gamma]);


}//fin module

unificadorFrontalS();