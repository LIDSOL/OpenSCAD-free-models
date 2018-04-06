use<baseDitacRedondo.scad>;


module ruedasCorrRedondo(dimX=1,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32){


Radio=(dimX*(6*espesor/2));
    union(){
 difference(){
circle(r=Radio, $fn=resoluciOn);
square([2*espesor*dimX,2*espesor*dimX],center=true);


} 
    
intersection(){
baseDitacRedondo(espesor,alfa,beta,dimX,dimX,resoluciOn);
circle(r=Radio, $fn=resoluciOn);

}
}

}
espesor=3;

//square([espesor*6,espesor*6],center=true);

//linear_extrude(height=3)
ruedasCorrRedondo(1,100);