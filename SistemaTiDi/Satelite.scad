use<CASEgamma.scad>
use<boards.scad>


   
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
    parte=1;
    
       
    module recortadorMink(lonX=20,lonY=20,lonZ=20,esf=1){
        minkowski(){
        cube([lonX-(2*esf),lonY-(2*esf),lonZ-(2*esf)],center=true);
            sphere(r=esf,$fn=100);
            }
    }
   

//PARTE CONTENEDORA

if(parte==1){
    difference(){
CASEgamma(lonX=90,lonY=90,lonZ=180,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
     
     //taladroRaspberry
       translate([-85/2,-56/2,-90+1.5+(alturaPostesRaspberry/2)])
    RaspberryPi(); 
      
       //Recorte postes
    translate([0,0,-45])
    cube([90-3,90-3,80-6],center=true);
        
        //recortes Laterales
        
        //inicial
          translate([45,0,-33])
           recortadorMink(75,75,50,15);
        
        for(i=[1:3]){
            rotate(90*i)
            translate([45,0,-45])
           recortadorMink(75,75,75,15);
        }
        
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


}
//fin parte 1 (CONTENEDORA)

if(parte==0){
    
    difference(){
       CASEgamma(lonX=90,lonY=90,lonZ=6,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
        recortadorMink(75,75,75,15);
    
        }
}



