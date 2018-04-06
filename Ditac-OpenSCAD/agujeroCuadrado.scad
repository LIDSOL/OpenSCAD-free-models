module agujeroCuadrado(espesor=3,alfa=0.1,resoluciOn=100,version=1){


//espesor=3;

//agujero cuadrado virtual
//square([espesor,espesor],center=true);
//delta=espesor/6;
//alfa=0.1;
beta=(3*alfa)/(32);
    
gamma=alfa+beta;
echo();
    
   
delta=espesor/6;
espesorReducido=espesor-2*gamma;
   

union(){
//esquina superior derecha
//agujero cuadrado con consideraciones del material
square([espesorReducido,espesorReducido],center=true);
//círculo
desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);
//fin esquina superori derecha
//agujero cuadrado con consideraciones del material
square([espesorReducido,espesorReducido],center=true);
//círculo
desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

//esquina superoir izquierda
mirror([1,0]){
   //agujero cuadrado con consideraciones del material
//square([espesorReducido,espesorReducido],center=true);
//círculo
//desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]); 
}
//fin esquinasuperioir izquierda

//esquinas inferioires
mirror([0,1]){
   //esquina inferoierior derecha
//agujero cuadrado con consideraciones del material
//square([espesorReducido,espesorReducido],center=true);
//círculo
//desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);
//fin esquina inferiori derecha
    
//agujero cuadrado con consideraciones del material
//square([espesorReducido,espesorReducido],center=true);
//círculo
//desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

//esquina inferoroir izquierda
mirror([1,0]){
   //agujero cuadrado con consideraciones del material
square([espesorReducido,espesorReducido],center=true);
//círculo
//desplazamientoCirculo=((espesorReducido/2)+gamma);
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);
//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]); 
}
//fin esquinainfererioir izquierda
}
//fin esquinas inferioires
}//fin union
}//fin module

agujeroCuadrado(3,0.1,10,0);
