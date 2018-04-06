use<DienteCorr.scad>

module esteticaR(dim=2 ,alto=1,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){
union(){
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


 radio=((espesor*((dim+(dim-1)+4)))/2)*sqrt(2);
   
//ajuste de la posición de la seccion circular
translate([(dim-0.5)*espesor,-sqrt(2)*radio/2-(espesor*(2/4))])


//Seccion circular
difference(){
    
intersection(){
   
circle(r=radio,$fn=resoluciOn);
    //cuadrado que corta la mitad del círculo
translate([0,radio])
    square([4*radio,2*radio],center=true);
}
//cuadrado que recorta la seccion deseada segun la raiz de dos
square([sqrt(2)*radio*2,sqrt(2)*radio],center=true);
}



}//fin union
}//fin module

//linear_extrude(height=3)
esteticaR();


