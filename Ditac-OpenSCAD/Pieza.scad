use<Diente.scad>
use<baseDitac.scad>;

resoluciOn=10;
espesor=3;
alfa=0.1;
beta=(3*alfa)/32;
gamma=alfa+beta;

dimX=2;

dimY=2;

lonX=(2*dimX+1)*espesor;
lonY=(2*dimY+1)*espesor;

//linear_extrude(height=3)
union(){
baseDitac(espesor,alfa,dimX,dimY,resoluciOn);
//baseDitac();
//dientes arriba
translate([-lonX/2-gamma,lonY/2])
for(i=[0:dimX]){
    translate([2*i*espesor,0])
     Diente(espesor,alfa,resoluciOn);
}
//dientes abajo
mirror([0,1]){
translate([-lonX/2-gamma,lonY/2])
  for(i=[0:dimX]){
    translate([2*i*espesor,0])
     Diente(espesor,alfa,resoluciOn);
}
  
    
}

//dientes izquierda
rotate(90)
translate([-(3*espesor)/2-gamma,lonY/2])
for(i=[0:dimY-1]){
    translate([2*i*espesor,0])
     Diente(espesor,alfa,resoluciOn);
}

//dientesderecha
mirror([1,0]){
rotate(90)
translate([-(3*espesor)/2-gamma,lonY/2])
for(i=[0:dimY-1]){
    translate([2*i*espesor,0])
     Diente(espesor,alfa,resoluciOn);
}
}
}//finunion

