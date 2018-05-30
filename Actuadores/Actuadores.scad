
//home/pablovc/Documentos/OpenSCAD-free-models/SistemaTiDi
include<./../CASEgamma/CASEgamma.scad>;
include<./../Componentes/boards.scad>;
include<./../Componentes/sensores.scad>;
include<./../Componentes/motores.scad>;
include<./../Utilidades/Utilities.scad>;


radio=100;
radioColumna=15;
alturaColumna=210;

/*
translate([0,60,220])
cube([150,60,5],center=true); 
*/

module actuadores(){
    cylinder(d=7,h=8);
    translate([60,0,0])
    cylinder(d=7,h=8);
}



//base ultrasonico
translate([0,0,alturaColumna/2.2])
difference(){
cube([50,30,1],center=true);
    translate([0,0,3])
    rotate([180,0,0])
    sensorHC04();
}



translate([0,70,alturaColumna/2.2])
rotate(90)
rotate([-90,0,180])
linear_extrude(height=3)
estructuraTrapecio(largoEstructura=85,ladoLargo=35,ladoCorto=10);


//###subestructuras sensor ultrasonico
translate([0,15,alturaColumna/2.2])
for(i=[0:1]){
    translate([0,-(30-3)*i])
     rotate([-90,0,180])
     linear_extrude(height=3)
     estructuraTrapecio(largoEstructura=25,ladoLargo=10,ladoCorto=5);
}

mirror([1,0,0]){
translate([0,15,alturaColumna/2.2])
for(i=[0:1]){
    translate([0,-(30-3)*i])
     rotate([-90,0,180])
     linear_extrude(height=3)
     estructuraTrapecio(largoEstructura=25,ladoLargo=10,ladoCorto=5);
}

}

//fin subestructuras

//utilidades**
module estructuraTrapecio(largoEstructura=85,ladoLargo=35,ladoCorto=10){
polygon([[0,0],[largoEstructura,0],[largoEstructura,ladoCorto],[0,ladoLargo]]);
}






translate([0,radio-radioColumna,0])
union(){
cylinder(r=radioColumna,h=alturaColumna);
    
//priamide
difference(){
   linear_extrude(height=radioColumna*6,scale=1/6)
   square([radio+8,radioColumna*2],center=true);
    
    despInterno=12;
    translate([radio/2-despInterno,0,0])
    cylinder(r=1.5,h=8);
    
     translate([-radio/2+despInterno,0,0])
    cylinder(r=1.5,h=8);
}


 //poste 1
    translate([50,12,0])
    cylinder(r=3,h=alturaColumna*(0.75));
    
  //poste 2
    mirror([1,0,0]){
      translate([50,12,0])
      cylinder(r=3,h=alturaColumna*(0.75));  
    }
}


//BASE


!rotate(90)
difference(){
    linear_extrude(height=3)
   seccionRedondoPlano(radio=radio,distancia=radio);
   translate([3*radio,0,0])
    cube([radio*4,radio*4,6],center=true);
   //Recortador tornillos
   
 rotate(-90)
  translate([0,radio-radioColumna-10,0])
    union(){
    //poste 1
    translate([50,0,0])
    cylinder(r=2,h=alturaColumna*(0.75),center=true);
    
  //poste 2
    mirror([1,0,0]){
      translate([50,0,0])
      cylinder(r=2,h=alturaColumna*(0.75),center=true);  
    }
       } 

}


//actuadores
 //actuador 1
translate([radioColumna+7+30,radio-radioColumna+1,alturaColumna-radioColumna])
rotate([0,90,90])
actuadores();


 //actuador 2
mirror([1,0,0]){
    translate([radioColumna+7+30,radio-radioColumna+1,alturaColumna-radioColumna])
    rotate([0,90,90])
    actuadores();
}

translate([-(radioColumna+40),radio-6,alturaColumna-85])
cube([(radioColumna+40)*2,6,80]);

/*
translate([longitud+2,0,-2])
rotate([0,90,0])
rondana(ancho=12,radioInterno=2.5,radioExterno=4,resoluciOn=20);
*/
