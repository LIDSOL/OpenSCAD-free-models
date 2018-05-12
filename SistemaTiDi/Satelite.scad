use<CASEgamma.scad>
use<boards.scad>
use<Utilities.scad>

   
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
           RecortadorEstrella(taladro=50, medidaTriangulo=14,
    distanciaTriangulos=8,ajuste=2.5,redondeadorPoly=2.5);
    
    translate([-45,0,-45])
             rotate([90,0,90])
           RecortadorEstrella(taladro=50, medidaTriangulo=14,
    distanciaTriangulos=8,ajuste=2.5,redondeadorPoly=2.5);
        
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


//}
//fin parte 1 (CONTENEDORA)



//Texto
translate([-30,-45,-65])
rotate([90,0,0])
 linear_extrude(height=1)
 text(size=escalaTexto,font = "Simplex","Idea 1.61");



}//fin CASE sat


module RecortadorEstrella(taladro=50, medidaTriangulo=15,
    distanciaTriangulos=10,ajuste=2.4,redondeadorPoly=5){
    for(i=[0:3]){
                   
                rotate(90*i)
                   union(){
                     translate([-medidaTriangulo*ajuste,distanciaTriangulos,-medidaTriangulo/2])
                     linear_extrude(height=medidaTriangulo)
                     recortadorMinkPoly(medidaTriangulo,medidaTriangulo,redondeadorPoly);
            
                     mirror([0,1,0]){
                       translate([-medidaTriangulo*ajuste,distanciaTriangulos,-medidaTriangulo/2])
                       linear_extrude(height=medidaTriangulo)
                       recortadorMinkPoly(medidaTriangulo,medidaTriangulo,redondeadorPoly);
                    }
                 }
            
              } 
              
              //cilindro central
               cylinder(r=10,$fn=100,h=20,center=true);      


}


module TAPAsat(){

    
    medidaTriangulo=15;
    distanciaTriangulos=9;
        difference(){
           CASEgamma(lonX=90,lonY=90,lonZ=6,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
           //recortadorMink(75,75,75,15);
            
            RecortadorEstrella(taladro=50, medidaTriangulo=14,
    distanciaTriangulos=8,ajuste=2.5,redondeadorPoly=2.5);
            
                 
                
        }
        
 
 
 }//fin tapa sat
 
  module BASEsensores(){
     
 tornillo=2.5;
 diametroPoste=5;
 lonX=90;
 lonY=90;
 espesor=1.5;
      
      difference(){
   linear_extrude(height=1.5)
difference(){
    

    //espacioes entre miniProto=36mm
    
    
    panelMatriz(lonX-(2*espesor),lonY-(2*espesor),taladro=3.5/2,divisiones=(lonX-(2*espesor))/36);
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
 
 
 //#######RENDERIZADOS########
 
CASEsat();
 
rotate([180,0,0]) 
TAPAsat();

translate([0,0,-60])
BASEsensores();
 

