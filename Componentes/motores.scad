//####UTILIDADES MOTORES####

module RedMotShaft(){
 
    difference(){
    circle(d=5.4);
        
    translate([0,3+(3.7/2)])
    square([6,6],center=true);   
       
     mirror([0,1,0]){
     translate([0,3+(3.7/2)])
    square([6,6],center=true);   
     }
   }
   
   }
   
   //####MOTORES####
   
   module redDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,modo=1){
    
    
    translate([0,0,-alto/2])
 union(){   
translate([11.2,eje/2,alto/2])
rotate([90,0,0])
     
     //para salida de motor
     if(modo==0){
    cylinder(d=5.4+0.1,h=eje);
     }
     //para visualizar motor
     else if(modo==1){
linear_extrude(height=eje)
RedMotShaft();
     }
     // para agarre
     else if(modo==2){  
     linear_extrude(height=eje)
     circle(r=2.3,center=true);
     }
    
translate([0,-ancho/2,0])
cube([largo,ancho,alto]);
    
     //ventana gomas
     translate([31.8+11,-ancho,alto/2-14/2])
  cube([25,ancho*2,14]);
     
     //tope motor reductor
     translate([11.2+11,eje/2,alto/2])
rotate([90,0,0])
cylinder(d=4,h=eje);
     
    //tornillos
    translate([31.8,eje/2,alto/2+(17.5/2)])
rotate([90,0,0])
cylinder(d=3,h=eje);
    
    translate([31.8,eje/2,alto/2-(17.5/2)])
rotate([90,0,0])
cylinder(d=3,h=eje);
   
 }//fin union 
}


//####RENDERIZADOS#####
$fn=100;

//modo 0 --> Para recortar agujero para salida de motor
//modo 1 --> Para visualizar shaft igual a motor
//modo 2- -> Agujero Redondo (misma medida baseDitacCorr)

//redDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,modo=1);
