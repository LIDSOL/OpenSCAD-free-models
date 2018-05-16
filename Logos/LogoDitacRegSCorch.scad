//use<DienteCorr.scad>

//######DIENTE CORREGIDO##### :D
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


//######CODIGO LOCAL#####
module fondo(espesor=3,resoluciOn=100){


union(){
square([9*espesor,3*espesor],center=true);

translate([4.5*espesor,1.5*espesor])
rotate(-90)
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);

mirror([1,0,0]){
  translate([4.5*espesor,1.5*espesor])
rotate(-90)
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);  
}


translate([-4.5*espesor,1.5*espesor])
for(i=[1:3]){
    translate([i*2*espesor,0])
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);
}

mirror([0,1,0]){
    
    translate([4.5*espesor,1.5*espesor])
rotate(-90)
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);

mirror([1,0,0]){
  translate([4.5*espesor,1.5*espesor])
rotate(-90)
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);  
}
    
   translate([-4.5*espesor,1.5*espesor])
for(i=[1:3]){
    translate([i*2*espesor,0])
DienteCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,tamaNio=0.15,modo3D=0,ajuste=0.5);
} 
}

}

}



module D (espesor=3,resoluciOn=100,escala=2,largo=0.20,centro=0){
union(){
difference(){
circle(r=(espesor-1)*escala,$fn=100);
circle(r=(espesor-1.5)*escala,$fn=100);
    translate([-2*espesor*escala,-espesor*escala])
    square([2*espesor*escala,2*espesor*escala]);
}
translate([-espesor*largo*escala,1.5*escala])
square([(espesor*largo+0.1)*escala,0.5*escala]);

mirror([0,1,0]){
    translate([-espesor*largo*escala,1.5*escala])
square([(espesor*largo+0.1)*escala,0.5*escala]);
}

if(centro==1){
    union(){
    difference(){
    circle(r=espesor/4*escala,$fn=100);
    translate([-espesor/4*escala,-espesor/4*escala])
    square([espesor/4*escala,2*espesor/4*escala]);
    }
    
    translate([-(espesor*largo)*escala,-espesor/4*escala])
    square([(espesor*largo+0.1)*escala,espesor/2*escala]);
    }
}


}

}

//D();

module logo(espesor=3){

difference(){
    fondo();
    translate([-4*espesor,0])
D();
    
    translate([1.035*espesor,-1*espesor])
    rotate(90)
    D(espesor=3,resoluciOn=100,escala=2,largo=0.125,centro=1);
    
    mirror([1,0,0]){
          translate([-4*espesor,0])
        D();
    }
    translate([0,espesor+0.5])
    square([espesor*5,1],center=true);
    
    translate([-espesor+0.1,0])
    square([1,espesor*2+1.5],center=true);
    
    translate([-espesor*2+0.1,-espesor/2-0.4])
    square([1,espesor+0.75],center=true);
    
    translate([-espesor*2+0.1,espesor/4+0.5])
    square([1,1],center=true);
    
    
}

}

//color("red")
//linear_extrude(height=3)
//scale(1)

module Ditac(escala=0.5,registrado=0){
   scale(escala)
     union(){
         logo();


         if(registrado==1){
              translate([8.5,-7])
              //Modulo de Texto no funciona en version 2014
              text("R", size = 0.5, font = "Liberation Sans", halign = "center", valign = "center", $fn = 16);

              translate([8.5,-7])
               difference(){
               circle(r=0.6,$fn=100);
               circle(r=0.5,$fn=100);    
              }
          }
   }
 }//Fin modulo Ditac
 
 //####RENDERIZADOS####
 //Se recomienda no tener renderizados (debugging)
 
// Ditac(0.25);