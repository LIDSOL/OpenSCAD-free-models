use<baseDitacCorr.scad>;


module ruedasCorr(dimX=1,resoluciOn=100,modo=0,espesor=3,alfa=0.1,beta=(3*0.1)/32){


Radio=(dimX*(3*espesor/2));
    union(){
 difference(){
circle(r=Radio, $fn=resoluciOn);
square([2*espesor*dimX,2*espesor*dimX],center=true);


} 
    
intersection(){
    //agujero Cuadrado
    if(modo==0){
baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,0);
    }
    //agujero Redondo
    else if(modo==1){
        baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,1);
    }
    //agujero Motor reductor "amarillo"
    else if(modo==2){
        baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,2);
    }
    //por agregar
    else if(modo==3){
        baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,3);
    }
    
circle(r=Radio, $fn=resoluciOn);

}
}

}
//espesor=3;

//square([espesor*6,espesor*6],center=true);

//linear_extrude(height=3)
ruedasCorr(dimX=2,resoluciOn=100,modo=0,espesor=3,alfa=0.1,beta=(3*0.1)/32);