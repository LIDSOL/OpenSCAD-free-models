module DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=1,ajuste=0.5){
//EL DIENTE NO NECESITA GAMMA
    
gamma=alfa+beta;
ancho=2*gamma+espesor;
if(modo3D==0){
union(){
translate([0,-espesor/2])
    //abajo del eje es material para la unión
square([ancho,espesor]);
translate([ancho/2,espesor/2])
circle(r=ancho/2,$fn=resoluciOn);
}
}//fin if modo3D==0

if(modo3D==1){
    
    difference(){
union(){
translate([0,-espesor/2])
    //abajo del eje es material para la unión
square([ancho,espesor]);
translate([ancho/2,espesor/2])
circle(r=ancho/2,$fn=resoluciOn);
}

//#####Redondeador 1 (derecha) ######

//posicion
translate([ancho-(tamaNio*2),tamaNio-(gamma*0.5)+ajuste])
//render redondeador
translate([tamaNio,tamaNio])
union(){
translate([0,(2*tamaNio)-(tamaNio/10)])
difference(){
    square([2*tamaNio,2*tamaNio],center=true);
circle(r=tamaNio,$fn=100);
    
translate([-tamaNio,0])
    square([2*tamaNio,2*tamaNio],center=true);
    
    translate([0,tamaNio])
    square([2*tamaNio,2*tamaNio],center=true);
}
circle(r=tamaNio,$fn=100);

translate([tamaNio,0])
square([2*tamaNio,2*tamaNio],center=true);
}
//fin redondeador



//#####Redondeador 2 (izquierda) ######

//posicion
translate([(tamaNio*2),tamaNio-(gamma*0.5)+ajuste])
//render redondeador

mirror([1,0,0]){
translate([tamaNio,tamaNio])
union(){
translate([0,(2*tamaNio)-(tamaNio/10)])
difference(){
    square([2*tamaNio,2*tamaNio],center=true);
circle(r=tamaNio,$fn=100);
    
translate([-tamaNio,0])
    square([2*tamaNio,2*tamaNio],center=true);
    
    translate([0,tamaNio])
    square([2*tamaNio,2*tamaNio],center=true);
}
circle(r=tamaNio,$fn=100);

translate([tamaNio,0])
square([2*tamaNio,2*tamaNio],center=true);
}

}
//fin redondeador




}

}

}//fin module

//modo3D 0 --> pieza con final recto
//modo3D 1 --> pieza con final redondeado


DienteCorr(3,0.1,(3*0.1)/32,10,0.15,1);