use<DienteCorr.scad>;
use<baseDitacCorr.scad>;
use<piezaDCorr.scad>;
use<agujeroRedondoCorr.scad>



module dientes(dimX=2,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32){
    
    union(){
    translate([1.5,2.5*espesor])
        //arreglar dientes
    DienteCorr(espesor,alfa,beta,resoluciOn,0);
    
    mirror([1,0]){
      translate([1.5,2.5*espesor])
             //arreglar dientes
    DienteCorr(espesor,alfa,beta,resoluciOn,0);
      
    }
    translate([0,1.5*espesor])
    square([3*espesor+4*(alfa+beta),espesor],center=true);
  }
}

module codo(dimX=2,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32,lados=4){
    angulo=360/lados;
    dientes();
    union(){
    mirror([0,1]){
    rotate(angulo)
     dientes();
    }
    
    difference(){
    circle(r=(espesor*5)/2,$fn=resoluciOn);
    agujeroRedondoCorr(espesor,alfa,beta,resoluciOn);
     }
   }
 
   
}

//dientes();
codo(dimX=2,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32,lados=10);
