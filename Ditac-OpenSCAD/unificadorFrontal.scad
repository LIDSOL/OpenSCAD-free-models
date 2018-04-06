use<Diente.scad>;


resoluciOn=10;
espesor=3;
alfa=0.1;
beta=(3*alfa)/32;
gamma=alfa+beta;

//dimX=2;

dimY=2;

//lonX=(2*dimX+1)*espesor;
lonY=(2*dimY+1)*espesor;

linear_extrude(height=espesor)
union(){
 //Diente(espesor,alfa,resoluciOn);
square([espesor,lonY-2*(espesor)],center=true); 
 
 //diente arriba
  translate([-espesor/2,(3*espesor/2)])
     Diente(espesor-2*gamma,alfa,resoluciOn);
     
     //diente abajo
 
 mirror([0,1]){
       translate([-espesor/2,(3*espesor/2)])
     Diente(espesor-2*gamma,alfa,resoluciOn);
     
 }
 
 //dientes izquierda
 rotate(90)
translate([-(3*espesor)/2,espesor/2])
for(i=[0:dimY-1]){
    translate([2*i*espesor,0])
     Diente(espesor-2*gamma,alfa,resoluciOn);
}
//fin dientes izquierda
//dientes derecha
mirror([1,0]){
 rotate(90)
translate([-(3*espesor)/2,espesor/2])
for(i=[0:dimY-1]){
    translate([2*i*espesor,0])
     Diente(espesor-2*gamma,alfa,resoluciOn);
}
}

//fin dientes derecha
}//fin union