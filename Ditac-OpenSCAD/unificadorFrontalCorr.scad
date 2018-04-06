use<DienteCorr.scad> 

module unificadorFrontalCorr(dim=2,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

//material

gamma=alfa+beta;

//dientes de arriba
translate([0,espesor/2])
for(i=[0:dim-1]){
    translate([2*espesor*i,0])
    //ARREGLER DIENTE
    DienteCorr(espesor,alfa,beta,resoluciOn,0);
}

//dientes de abajo

mirror([0,1]){
   translate([0,espesor/2])
     for(i=[0:dim-1]){
        translate([2*espesor*i,0])
         //ARREGLER DIENTE
        DienteCorr(espesor,alfa,beta,resoluciOn,0);
     }      
}

//diente izquierda
translate([0,-(espesor)/2-gamma])
rotate(90)
//ARREGLER DIENTE
DienteCorr(espesor,alfa,beta,resoluciOn,0);

//diente derecha
translate([(dim+(dim-1))*(espesor)+2*gamma,0])


mirror([1,0]){
    
   translate([0,-espesor/2-gamma])
   rotate(90)
    //ARREGLER DIENTE
   DienteCorr(espesor,alfa,beta,resoluciOn,0);
}

//cuadrado parametrizable
translate([0,-(espesor)/2-gamma])
square([(dim+(dim-1))*espesor+2*gamma,espesor+2*gamma]);


}//fin module

//linear_extrude(height=3)
unificadorFrontalCorr();