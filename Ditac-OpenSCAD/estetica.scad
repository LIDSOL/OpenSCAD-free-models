use<DienteCorr.scad>

module estetica(dim=2,alto=1,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

//material

gamma=alfa+beta;


//dientes de abajo

mirror([0,1]){
   translate([0,espesor/2])
     for(i=[0:dim-1]){
        translate([2*espesor*i,0])
        DienteCorr(espesor,alfa,beta,resoluciOn);
     }      
}






//cuadrado parametrizable
translate([0,-(espesor)/2-gamma])
//square([(dim+(dim-1))*espesor+2*gamma,espesor+2*gamma]);

polygon(points = [[0,0],[0,alto*(3/2)*espesor+(2*gamma)],[(dim+(dim-1))*espesor+2*gamma,((espesor+gamma)/2)],[(dim+(dim-1))*espesor+2*gamma,0]]);


}//fin module

//linear_extrude(height=3)
estetica();
