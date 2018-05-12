
//LOGO IDEA QUE funciona sin minkowski
module Idea(escala=0.5){

long=30;
esp=6;

//SE INSERTARON VALORES AQUI PARA VERSION 2014
grueso=3;
     radio=6;

scale(escala)
union(){
//linear_extrude(height=3)
//minkowski(){
//union(){
difference(){
  difference(){
    circle(r=long,$fn=100);
     circle(r=long-esp,$fn=100);
   }
   translate([0,-long*2])
 square([long*4,long*4],center=true);  
 }
 
 
 translate([0,-long])
 difference(){
     square([long*2,long*2],center=true);
     square([(long-esp)*2,long*3],center=true);
     
     
 }
 
 //barra led arriba
  translate([0,-long*(1.4)])
 square([long*2,esp],center=true);
 
 
//barra led abajo
  translate([0,-long*(2)])
 square([(long*2)+(2*esp),esp],center=true);
 
 //pata derecha
  translate([long*(0.4),-long*(2+0.75/2)])
 square([esp,long*(0.75)],center=true);
 
 
 //pata izquierda
  translate([-long*(0.4),-long*(2+0.5/2)])
 square([esp,long*(0.5)],center=true);
 
 //}//fin union
 
 //circle(r=3,$fn=20);
 //}
 
 
  
 translate([long*(0.3),0])
 union(){
//NO FUNCIONAN AQUI PARA VERSION 2014
 /*
grueso=3;
     radio=6;
*/ 
 difference(){

     circle(r=radio,$fn=100);
     circle(r=radio-grueso,$fn=100);
 }
 
 translate([radio*(0.3),-radio*(0.4)])
 rotate(-60)
 square([grueso,radio*3]);
 
 }
 
 }//fin union
 
 }//fin module
 
// resize([1,1.6])


Idea(0.1);
