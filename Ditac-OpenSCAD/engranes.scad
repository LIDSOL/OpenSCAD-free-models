use<agujeroCuadradoCorr.scad>
use<agujeroRedondoCorr.scad>
use<baseDitacCorr.scad>;
use<baseDitacRedondoCorr.scad>;
//linear_extrude(height=3)

dimX=3;
resoluciOn=100;
espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
tamaNIo=3;
redondo=1;

//linear_extrude(height=3)
union(){
difference(){
    if(tamaNIo==1){
        //engrane 8 dientes
import("8G.dxf",scale=1.33);
    } else if(tamaNIo==2){
         //engrane 16 dientes
import("16G.dxf",scale=1.33);
    } else if(tamaNIo==3){
         //engrane 24 dientes
import("24G.dxf",scale=1.33);
    } else if(tamaNIo==4){
         //engrane 32 dientes
import("32G.dxf",scale=1.33);
    }
square([(dimX*2)*espesor,(dimX*2)*espesor],center=true);
//agujeroCuadradoCorr();
//agujeroRedondoCorr();
}

baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,0,0,0,0,0,0);
//baseDitacCorr(espesor,alfa,beta,dimX,dimX,resoluciOn,redondo);
//baseDitacRedondoCorr(espesor,alfa,beta,dimX,dimX,resoluciOn);
}//fin union