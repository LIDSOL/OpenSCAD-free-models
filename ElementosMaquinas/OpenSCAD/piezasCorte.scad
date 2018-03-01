use<elementosDiseNio.scad>
use<componentes.scad>

//medida del perfil estructural, esta medida es fija pero es importante para las transformaciones
medidaPerfil=20;

//diseño principal la medida X es 210 [mm]
medidaX=210;
//diseño principal la medida Y es 275 [mm]
medidaY=300;
//diseño principal la medida Z es 275 [mm]
medidaZ=210;


//resoluciOn
$fn=100;

module agujerosPerfil2(){
translate([0,10])
circle(r=6/2);
    
translate([0,-10])
circle(r=6/2);
}

module agujerosBaleros(modo=1){
medidaPerfil=20;
medidaDetalle=0.7;
separaciOnBaleros=63;
radioBaleros=22/2;
    
distanciaCentrosSimple=medidaPerfil-(2*medidaDetalle)+(2*radioBaleros);
distanciaCentrosDoble=(2*medidaPerfil)-(2*medidaDetalle)+(2*radioBaleros);

//para perfil simple
if(modo==1){
    
translate([distanciaCentrosSimple/2,separaciOnBaleros/2])
circle(r=8/2);
   
translate([-distanciaCentrosSimple/2,-separaciOnBaleros/2])
circle(r=8/2); 
   
translate([distanciaCentrosSimple/2,-separaciOnBaleros/2])
circle(r=8/2); 
   
 translate([-distanciaCentrosSimple/2,separaciOnBaleros/2])
circle(r=8/2);  

}
//para perfil doble
if(modo==2){

translate([distanciaCentrosDoble/2,separaciOnBaleros/2])
circle(r=8/2);
   
translate([-distanciaCentrosDoble/2,-separaciOnBaleros/2])
circle(r=8/2); 
   
translate([distanciaCentrosDoble/2,-separaciOnBaleros/2])
circle(r=8/2); 
   
 translate([-distanciaCentrosDoble/2,separaciOnBaleros/2])
circle(r=8/2); 

}

}

//coduigo universal para rueda de diametro n y agujero interno n
//para los espaciadores las medidas son: r=(8/2)+3 dif r=(8/2)
module rondanas(radioExterno=(8/2)+3,radioInterno=(8/2)){
difference(){
     circle(r=radioExterno);
    circle(r=radioInterno);
}

} 



module placaS(modo=2){
   difference(){
    square([medidaX+(2*medidaPerfil),medidaZ+medidaPerfil],center=true);
    
           
    //agujero corredera vertical
    if(modo==2){
    square([(6*4)+7+4+(40*2),(medidaZ+medidaPerfil)-(2*medidaPerfil)],center=true);
    translate([118,60])  
      mirror([1,0,0]){
        TArduinoX50Y54(resoluciOn=100);
      }
      translate([0,-((medidaZ+medidaPerfil)/2)+10])
    circle(r=4.5/2);
      
    }
    
    //agujeros montaje
    translate([medidaPerfil+(medidaX/2)-(medidaPerfil/2),((medidaZ+medidaPerfil)/2)-medidaPerfil])
    agujerosPerfil2();
    
    //agujero esquineros
    translate([medidaPerfil+(medidaX/2)-(medidaPerfil),-((medidaZ+medidaPerfil)/2)+medidaPerfil])
    square([20,6],center=true);
    
    mirror([1,0,0]){
       //agujeros montaje
    translate([medidaPerfil+(medidaX/2)-(medidaPerfil/2),((medidaZ+medidaPerfil)/2)-medidaPerfil])
    agujerosPerfil2();
    
    //agujero esquineros
    translate([medidaPerfil+(medidaX/2)-(medidaPerfil),-((medidaZ+medidaPerfil)/2)+medidaPerfil])
    square([20,6],center=true); 
    }
    
    
  }

}


module correderaDoble(modo=1){

unidad=20;
    


if(modo==1){
difference(){
//placa
translate([-5,0])
square([unidad*9.5,82],center=true);  
    
translate([(3*unidad),0])
agujerosNEMA();

//translate([-2*unidad-10,0])
    translate([-4*unidad,0])
    rotate(90) 
    agujerosPerfil2();
 
 agujerosBaleros(2); 
 }  
}

if(modo==2){
difference(){
//placa
translate([25,0])
square([unidad*6.5,82+20],center=true);

//translate([-35,0])
    agujerosDremel();
    
agujerosBaleros(2); 

 }
}

if(modo==3){
difference(){
//placa
translate([25,0])
square([unidad*6.5,82],center=true);  
    
translate([(3*unidad),0])
agujerosNEMA();
 
 agujerosBaleros(2); 
 }  
}



}

module agujerosDremel(){
    
    translate([0,85/2])
    circle(r=4.5/2);
    
    translate([0,-85/2])
    circle(r=4.5/2);
    
   translate([35,0])
    circle(r=19/2);
    
    translate([75,85/2])
    circle(r=4.5/2);
    
    translate([75,-85/2])
    circle(r=4.5/2);
    
}

module correderaSimple(){
    unidad=20;
union(){

difference(){

    
//placa
translate([-5,0])
square([unidad*8,82],center=true);

translate([(2.5*unidad),0])
agujerosNEMA();

agujerosBaleros(1);    
   
   //agujeros esquineros
   translate([-45,25])
    circle(r=4.5/2);
    
     translate([-45-29,25])
    circle(r=4.5/2);
}



}

}

module cuadradoAgujero(){
    unidad=20;
    difference(){
   
    square([unidad,unidad],center=true);
    
    circle(r=(8/2));
}
}

module cuadradoEsquinero(){
    unidad=20;
    union(){
    translate([0,(unidad/2)+(9)])
    square([unidad+12,6],center=true);
    difference(){
    
    translate([0,6])
    square([unidad,unidad+12],center=true);
    
    circle(r=(8/2));
    }
  }
}

module barraCuadrada(){
  unidad=20;
    difference(){
   
    square([unidad,medidaY],center=true);
        
        //agujero1
    translate([0,(medidaY/2)-10])
    circle(r=(8/2));
        
        //agujero2
    translate([0,-(medidaY/2)+10])
    circle(r=(8/2));
}

}


module cama(){
    
     
    
    unidad=20;
    
    difference(){
    square([170,190],center=true);
      
       //agujeros tornillos
      translate([0,(-190/2)+15])
      square([80,4.5],center=true);  
      
      //agujeros tornillos
      translate([0,(-190/2)+15+29])
      square([80,4.5],center=true);
     
     //agujeros fijaciOn
      separacion=40;
        translate([-separacion*2,-separacion/2-16])
     for(i=[0:4]){
            for(j=[0:3]){
            translate([i*separacion,j*separacion])
            circle(r=4/2);
            }
        }
     
      //agujeros fijacion rezago
      translate([-unidad*4,-unidad*3-16])
     circle(r=4/2);  
        
        //agujeros fijacion rezago
      translate([unidad*4,-unidad*3-16])
     circle(r=4/2);
       
        
    }
    
   
    
    

}

module barrasCama(){
    unidad=20;
    difference(){
    square([unidad*2+20,unidad],center=true);
        
        //agujero 1
        translate([unidad,0])
         circle(r=4/2);
        
         //agujero 2
        translate([-unidad,0])
         circle(r=4/2);
    }
}


module correderaSimpleCompleta(){
unidad=20;
medidaPerfil=20;
medidaDetalle=0.7;
separaciOnBaleros=63;
radioBaleros=22/2; 
   
distanciaCentrosSimple=medidaPerfil-(2*medidaDetalle)+(2*radioBaleros);
distanciaCentrosDoble=(2*medidaPerfil)-(2*medidaDetalle)+(2*radioBaleros); 
    
    //tornillo1
translate([-60,57,30])
rotate([180,0,0])
tornillo();
    
    //ajustador cama
    translate([-60,57,16])
    rotate([0,0,90])
    linear_extrude(height=6)
    cuadradoAgujero();
    
    //cama
    translate([-(medidaY/2)-30,47,0])
    rotate([90,270,0])
    linear_extrude(height=6)
    cama();
    
     //motor NEMA  
 translate([(2.5*unidad),0,56])
 rotate([180,0,0])
 NEMA();
    
    //placa acrilico
translate([0,0,10])
linear_extrude(height=6)
correderaSimple();
    
    
    //balero1
translate([distanciaCentrosSimple/2,separaciOnBaleros/2,0])
baleroPatineta();

//espaciador1
translate([distanciaCentrosSimple/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//tornillo1
translate([distanciaCentrosSimple/2,separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo2
translate([-distanciaCentrosSimple/2,-separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo3
translate([-distanciaCentrosSimple/2,separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo4
translate([distanciaCentrosSimple/2,-separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

 //balero2
translate([-distanciaCentrosSimple/2,-separaciOnBaleros/2,0])
baleroPatineta();

//espaciador2
translate([-distanciaCentrosSimple/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

 //balero3
translate([-distanciaCentrosSimple/2,separaciOnBaleros/2,0])
baleroPatineta();

//espaciador3
translate([-distanciaCentrosSimple/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

 //balero4
translate([distanciaCentrosSimple/2,-separaciOnBaleros/2,0])
baleroPatineta();

//espaciador4
translate([distanciaCentrosSimple/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

mirror([0,0,1]){
    
    //ajustador cama
    translate([-60,57,16])
    rotate([0,0,90])
    linear_extrude(height=6)
    cuadradoAgujero();
    
   //placa acrilico
translate([0,0,10])
linear_extrude(height=6)
correderaSimple();
        
//espaciador1
translate([distanciaCentrosSimple/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//espaciador2
translate([-distanciaCentrosSimple/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//espaciador3
translate([-distanciaCentrosSimple/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//espaciador4
translate([distanciaCentrosSimple/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));
    
}

}


module correderaDobleBaleros(){
 difference(){
    unidad=20;
  
  //translate([4,0])
square([unidad*3.7,82],center=true);
 
   agujerosBaleros(2);   
     }
    
}



module correderaDobleCompleta(modo=1){
    unidad=20;
medidaPerfil=20;
medidaDetalle=0.7;
separaciOnBaleros=63;
radioBaleros=22/2;    
    
distanciaCentrosSimple=medidaPerfil-(2*medidaDetalle)+(2*radioBaleros);
distanciaCentrosDoble=(2*medidaPerfil)-(2*medidaDetalle)+(2*radioBaleros);
    
  //motor NEMA  
 translate([(3*unidad),0,56])
 rotate([180,0,0])
 NEMA();


//placa acrilico
  if(modo==1){
translate([0,0,10])
linear_extrude(height=6)
correderaDoble();
  }
  
   if(modo==2){
translate([0,0,10])
linear_extrude(height=6)
correderaDoble(modo=3);
  }

//balero1
translate([distanciaCentrosDoble/2,separaciOnBaleros/2,0])
baleroPatineta();

//espaciador1
translate([distanciaCentrosDoble/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//tornillo1
translate([distanciaCentrosDoble/2,separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo2
translate([-distanciaCentrosDoble/2,-separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo3
translate([-distanciaCentrosDoble/2,separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();

//tornillo4
translate([distanciaCentrosDoble/2,-separaciOnBaleros/2,unidad])
rotate([180,0,0])
tornillo();



//balero2
translate([-distanciaCentrosDoble/2,-separaciOnBaleros/2,0])
baleroPatineta();

//espaciador2
translate([-distanciaCentrosDoble/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//balero3
translate([-distanciaCentrosDoble/2,separaciOnBaleros/2,0])
baleroPatineta();

//espaciador3
translate([-distanciaCentrosDoble/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//balero4
translate([distanciaCentrosDoble/2,-separaciOnBaleros/2,0])
baleroPatineta();

//espaciador4
translate([distanciaCentrosDoble/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//COPIA SIMETRIA

mirror([0,0,1]){

if(modo==1){
//placa acrilico
translate([0,0,10])
linear_extrude(height=6)
correderaDobleBaleros();
}
if(modo==2){
//placa acrilico
translate([0,0,10])
linear_extrude(height=6)
correderaDoble(modo=2);

}
  
    
//espaciador1
translate([distanciaCentrosDoble/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//espaciador2
translate([-distanciaCentrosDoble/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));
    
    //espaciador3
translate([-distanciaCentrosDoble/2,separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));
    
    //espaciador4
translate([distanciaCentrosDoble/2,-separaciOnBaleros/2,4])
linear_extrude(height=6)
rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

}

}

module case(){
espesor=6;

//placa trasera
translate([0,medidaPerfil/2,-(medidaZ/2)])
rotate([90,0,0])
linear_extrude(height=espesor)
placaS(2);
       
    //placa frontal
    translate([0,-medidaY+(medidaPerfil/2)-4,-(medidaZ/2)])
rotate([90,0,0])
linear_extrude(height=espesor)
placaS(0);

//barra1
translate([medidaPerfil+(medidaX/2)-20,6-(medidaY/2),-(medidaZ)+12])
linear_extrude(height=espesor)
barraCuadrada();
    
    //barra2
mirror([1,0,0]){
translate([medidaPerfil+(medidaX/2)-20,6-(medidaY/2),-(medidaZ)+12])
linear_extrude(height=espesor)
barraCuadrada();

}

//esquinero1
translate([medidaPerfil+(medidaX/2)-20,-6,-(medidaZ)+6])
linear_extrude(height=espesor)
cuadradoEsquinero();    
    
//esquinero2
mirror([1,0,0]){
translate([medidaPerfil+(medidaX/2)-20,-6,-(medidaZ)+6])
linear_extrude(height=espesor)
cuadradoEsquinero(); 
}

//esquineros 3 y 4
translate([0,-medidaY+10,0])
mirror([0,1,0]){
    //esquinero1
translate([(medidaPerfil+medidaX/2)-20,-6,-(medidaZ)+6])
linear_extrude(height=espesor)
cuadradoEsquinero();    
    
//esquinero2
mirror([1,0,0]){
translate([(medidaPerfil+medidaX/2)-20,-6,-(medidaZ)+6])
linear_extrude(height=espesor)
cuadradoEsquinero(); 
}

}



}

//####RENDERIZADOS####


//####2D###

//espaciadores
//rondanas(radioExterno=(8/2)+3,radioInterno=(8/2));

//ruedas
//rondanas(radioExterno=(22/2)+2,radioInterno=(8/2));

//espaciadores taladro
//rondanas(radioExterno=(4.5/2)+3,radioInterno=4.5/2);

//correderaDoble(modo=1);

//correderaDoble(modo=2);

//correderaDoble(modo=3);

//correderaDobleBaleros();

//correderaSimple();

//PIEZA DESCARTADA
//cuadradoAgujero();

//cama();

//barrasCama();

//placaS();

//placaS(modo=1);

//barraCuadrada();

cuadradoEsquinero();

//###3D###

//correderaDobleCompleta(modo=1);

//correderaDobleCompleta(modo=2);

//correderaSimpleCompleta();

//case();