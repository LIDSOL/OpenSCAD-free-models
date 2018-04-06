
module agujeroCuadradoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){


//beta=(3*alfa)/(32);
//materiales
gamma=alfa+beta;
//geometria
delta=espesor/6;
espesorReducido=espesor-2*gamma;
desplazamientoCirculo=((espesorReducido/2)+gamma);

//dibujo
//square([espesor,espesor],center=true);
union(){
square([espesorReducido,espesorReducido],center=true);


//PRIMER PICO
translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

//FIN PRIMER PICO

//SEGUNDO PICO

mirror([0,1]){
    
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

}

//FIN SEGUNDO PICO

//TERCER Y CUARTO PICO
mirror([1,0]){
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

mirror([0,1]){
    
    translate([desplazamientoCirculo,desplazamientoCirculo])
circle(r=delta,$fn=resoluciOn);


//angulos que conectan con el circulo
polygon(points=[[espesorReducido/2,delta/2],[desplazamientoCirculo+delta,desplazamientoCirculo],[desplazamientoCirculo,desplazamientoCirculo+delta], [delta/2,espesorReducido/2]]);

}
    
    }

//FIN TERCER Y CUARTO PICO

}//fin union
}//fin module


agujeroCuadradoCorr();
