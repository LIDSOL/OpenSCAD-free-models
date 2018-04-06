use<DienteCorr.scad> 

module ejesCorr(dim=2,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

//material

gamma=alfa+beta;


//diente izquierda
translate([0,-(espesor)/2-gamma])
rotate(90)
DienteCorr(espesor,alfa,beta,resoluciOn);

//diente derecha
translate([(dim)*(espesor)+2*gamma,0])
mirror([1,0]){
    
   translate([0,-espesor/2-gamma])
   rotate(90)
   DienteCorr(espesor,alfa,beta,resoluciOn);
}

//cuadrado parametrizable
translate([0,-(espesor)/2-gamma])
square([(dim)*espesor+2*gamma,espesor+2*gamma]);


}//fin module


linear_extrude(height=3)
ejesCorr(4);