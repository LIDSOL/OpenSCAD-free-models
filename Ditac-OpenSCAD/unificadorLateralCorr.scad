use<DienteCorr.scad> 
use<redondeador.scad>

module unificadorLateralCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,dimension=4){


//DIMENSION=4 para relacion par impar
//material
gamma=alfa+beta;


//dientes
    
translate([-((gamma+espesor)*5+gamma)/2,0])
difference(){
union(){
for(i=[0:1]){
    translate([dimension*(espesor+gamma)*i,0])
    //arreglarDIENTE
    DienteCorr(espesor,alfa,beta,resoluciOn,0);
    mirror([0,1]){
    square([(gamma+espesor)*(dimension+1)+gamma,espesor]);
    }
}
}
    
mirror([0,1]){
translate([(espesor)*dimension+(espesor/2)+(gamma*5),espesor/2])
redondeador(espesor,alfa,resoluciOn);
translate([espesor/2,espesor/2])

mirror([1,0]){
redondeador(espesor,alfa,resoluciOn);
}
}

}



}//fin module


//linear_extrude(height=3)
unificadorLateralCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,dimension=3);