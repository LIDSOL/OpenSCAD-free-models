use<baseDitacCorr.scad>;


module ruedasCorr(dimX=1,resoluciOn=100,redondo=1,espesor=3,alfa=0.1,beta=(3*0.1)/32){


Radio=(dimX*(3*espesor/2));
    union(){
 difference(){
circle(r=Radio, $fn=resoluciOn);
square([2*espesor*dimX,2*espesor*dimX],center=true);


} 
    
intersection(){
    if(redondo==1){
baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,1);
    }
    else if(redondo==0){
        baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,0);
    }
circle(r=Radio, $fn=resoluciOn);

}
}

}
//espesor=3;

//square([espesor*6,espesor*6],center=true);

//linear_extrude(height=3)
ruedasCorr(dimX=2,resoluciOn=100,redondo=0,espesor=3,alfa=0.1,beta=(3*0.1)/32);