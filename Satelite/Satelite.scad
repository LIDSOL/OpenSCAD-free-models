
//home/pablovc/Documentos/OpenSCAD-free-models/SistemaTiDi
include<./../CASEgamma/CASEgamma.scad>;
include<./../Componentes/boards.scad>;
include<./../Componentes/sensores.scad>;
include<./../Utilidades/Utilities.scad>;

   
     /*
    medidas Rasberry Pi
     eje "x"= 85mm
     eje "y"= 56mm
      espesorTarjeta=1.6
    */
    
   // translate([-85/2,-56/2,-90+3])
   // RaspberryPi();
    
    diametroPosteRaspberry=6;
    tornilloRaspberry=2.75;
    alturaPostesRaspberry=10;
    //parte=1;
    
       
 /*   module recortadorMink(lonX=20,lonY=20,lonZ=20,esf=1){
        minkowski(){
        cube([lonX-(2*esf),lonY-(2*esf),lonZ-(2*esf)],center=true);
            sphere(r=esf,$fn=100);
            }
    }*/
   

//PARTE CONTENEDORA
module CASEsat(){
//if(parte==1){
    difference(){
CASEgamma(lonX=90,lonY=90,lonZ=180,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
     
     //taladroRaspberry
       translate([-85/2,-56/2,-90+1.5+(alturaPostesRaspberry/2)])
    RaspberryPi(); 
      
       //Recorte postes
    translate([0,0,-35])
    cube([90-3,90-3,50],center=true);
        
        //Recorte sensores
        
        translate([-20,-35,-20])
        rotate([0,-90,90])
        translate([-32/2,-20.3/2,0])
       sensorMQ(50);
        
         translate([0,-35,-20])
           rotate([20,-90,90])
        translate([-29/2,-14/2,0])
        sensorDHT11();


        
        
        //RECORTES Laterales
        
        //inicial
          translate([45,0,-33])
           recortadorMink(75,75,50,15);
          
          
             translate([0,45,-45])
             rotate([90,0,0])
                         
            translate([0,0,-4])
            linear_extrude(height=6)
            RecortadorEstrellaLocal();
   
    
    translate([-45,0,-45])
             rotate([90,0,90])
               translate([0,0,-4])
            linear_extrude(height=6)
           RecortadorEstrellaLocal();
        
      /*for(i=[1:3]){
            rotate(90*i)
            translate([45,0,-45])
           recortadorMink(75,75,75,15);
        }*/
        
    
    }//fin difference
    




   //###TornillosRaspberry#####
translate([-85/2,-56/2,-90+1.5+(alturaPostesRaspberry/2)])
union(){
translate([3.5,3.5,0])
rotate([180,0,0])
poste(diametroPosteRaspberry,tornilloRaspberry,alturaPostesRaspberry);


translate([3.5+58,3.5,0])
rotate([180,0,0])
poste(diametroPosteRaspberry,tornilloRaspberry,alturaPostesRaspberry);

translate([3.5,3.5+49,0])
rotate([180,0,0])
poste(diametroPosteRaspberry,tornilloRaspberry,alturaPostesRaspberry);    
    
translate([3.5+58,3.5+49,0])
rotate([180,0,0])
    poste(diametroPosteRaspberry,tornilloRaspberry,alturaPostesRaspberry);
}//fin union tornillos


//######Texto#######
translate([-32,-45,-65])
rotate([90,0,0])
 linear_extrude(height=1)
// text(size=10,font = "Simplex","Idea 1.61");
text(size=12,font = "Simplex","RisoSAT");


     //######Apoyos######
        
        //(1,1)
        translate([40,40,-90])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
         //(-1,-1)
        translate([-40,-40,-90])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
                //(-1,1)
        translate([-40,40,-90])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
                //(1,-1)
        translate([40,-40,-90])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);


}//fin CASE sat


module RecortadorEstrellaLocal(){
   
   lonX=90;
    lonY=90;
    orillas=5;

difference(){
    
    square([lonX-(orillas/2),lonY-(orillas/2)],center=true);
RecortadorEstrella(lonX=lonX, lonY=lonY,orillas=orillas,redondeadorPoly=3);
    }

}


module TAPAsat(){

    
    medidaTriangulo=15;
    distanciaTriangulos=9;
        difference(){
           CASEgamma(lonX=90,lonY=90,lonZ=6,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
           //recortadorMink(75,75,75,15);
            
            translate([0,0,-4])
            linear_extrude(height=6)
            RecortadorEstrellaLocal();
            
                 
                
        }
        
        //Apoyos
        
        //(1,1)
        translate([40,40,-1.6])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
         //(-1,-1)
        translate([-40,-40,-1.6])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
                //(-1,1)
        translate([-40,40,-1.6])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
                //(1,-1)
        translate([40,-40,-1.6])
        rotate([0,180,0])
        Apoyo(espesor=1.6,altura=5,longitud=10);
        
 
 }//fin tapa sat
 
  module BASEsensores(){
     
 tornillo=2.5;
 diametroPoste=5;
 lonX=90;
 lonY=90;
 espesor=1.5;
      toleranciaOrillas=1;
      
      difference(){
   linear_extrude(height=1.5)
difference(){
    

    //espacioes entre miniProto=36mm
    
    
    panelMatriz(lonX-(2*espesor)-(2*toleranciaOrillas),lonY-(2*espesor)-(2*toleranciaOrillas),taladro=3.5/2,divisiones=(lonX-(2*espesor))/36);
    echo((lonX-(2*espesor))/36);
    //circle(r=12,$fn=100);
    
    //Poste (1,1)
translate([-diametroPoste+lonX/2,-diametroPoste+lonY/2])
//poste(diametroPoste,tornillo,lonZ-(3*espesor/4),0);
    circle(r=tornillo/2,$fn=100);

//Poste (-1,1)
translate([-diametroPoste+lonX/2,+diametroPoste-lonY/2])
  circle(r=tornillo/2,$fn=100);

//Poste (1,-1)
translate([diametroPoste-lonX/2,-diametroPoste+lonY/2])
  circle(r=tornillo/2,$fn=100);

//Poste (-1,-1)
translate([diametroPoste-lonX/2,diametroPoste-lonY/2])
  circle(r=tornillo/2,$fn=100);

}

//DIFFERENCE 3D
//taladroRaspberry
        translate([-85/2,-56/2,-30+1.5+(alturaPostesRaspberry/2)])
        RaspberryPi(20); 


}

}//fin module base sensores
 
module Apoyo(espesor=1.6,altura=20,longitud=10){
    translate([-longitud/2,-longitud/2,0])
    difference(){         
    cube([longitud,longitud,altura]);
        translate([espesor,espesor,-altura/2])
        cube([longitud-(2*espesor),longitud-(2*espesor),altura*2]);
    }
}

 
 //#######RENDERIZADOS########
 
//CASEgamma(lonX=90,lonY=90,lonZ=6,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);

CASEsat();
 
rotate([180,0,0]) 
TAPAsat();



translate([0,0,-60])
BASEsensores();
 

