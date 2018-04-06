use<RedMotShaft.scad>
use<piezaDCorr.scad>
use<baseDitacCorr.scad>

//####RENDERIZADOS####

espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
resoluciOn=100;
espesor=3;
//para corte laser
alfa=0.1;
//para CNC
//alfa=0.5;

beta=(3*0.1)/32;
resoluciOn=100;
modo=1;

difference(){
    piezaDCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=2,
numY=2,modo=0,tamaNio=0.2,modo3D=0);
    square([espesor*6,espesor*6],center=true);
}


module recortador(largoEX,altoEY,largoIX,altoIY){
    difference(){
    square([largoEX,altoEY],center=true);
     square([largoIX,altoIY],center=true);
        }
}

difference(){
    
     if(modo==0){
  baseDitacCorr(3,0.1,(3*0.1)/32,3,3,100,3,0,0,0,0);
      }
    
  if(modo==1){
  baseDitacCorr(3,0.1,(3*0.1)/32,3,3,100,1,0,0,0,0);
      }
       if(modo==2){
  baseDitacCorr(3,0.1,(3*0.1)/32,3,3,100,2,0,0,0,0);
      }

recortador(espesor*10,espesor*10,espesor*6,espesor*6);
}



