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

module motorPololu(){

rotate([90,0,0])
union(){
translate([0,-2,(25/2)-2])
linear_extrude(height=12)
difference(){
    circle(r=(3-0.1)/2);
    translate([0,-((3-0.1)/2+(1/2))+0.6+0.1])
    square([3,1],center=true);    
   }

cube([15,11.5,25],center=true);

translate([0,-11.5/2+1.5,-1])
difference(){   
cube([25.5,3,14],center=true);
    
translate([-9,0,0])
rotate([90,0,0])
cylinder(r=1,h=6,center=true);
    
mirror([1,0,0]){
   translate([-9,0,0])
rotate([90,0,0])
cylinder(r=1,h=6,center=true);   
}

}
}//fin union

}//fin motorPololu

//####ServoMotores####

module piNon(){

union(){

cylinder(h=6,r=6);

translate([12,0,3])
cylinder(h=3,r=4);

translate([0,0,4.5])
cube([25,8,3],center=true);

mirror([1,0,0]){
translate([12,0,3])
cylinder(h=3,r=4);   
}

}//fin union

}//fin piNon

//SERVO SOLO PARA ESCALA DE 3MM
module servo3D(){

union(){

translate([5,0,15])
cylinder(h=5,center=true,r=6);

translate([5,0,17.5])
cylinder(h=5,center=true,r=2.25);

cube([22.2,12,26],center=true);
 
 translate([0,0,5.5])
 difference(){
     cube([32.1,12,2.5],center=true);
     
     translate([14,0,0])  
 cylinder(r=1,h=30,center=true); 
     
     mirror([1,0,0]){
      translate([14,0,0])  
 cylinder(r=1,h=30,center=true); 
         }
}

}//fin union

}
//FIN SERVO

//####RENDERIZADOS#####
$fn=100;

//modo 0 --> Para recortar agujero para salida de motor
//modo 1 --> Para visualizar shaft igual a motor
//modo 2- -> Agujero Redondo (misma medida baseDitacCorr)

//redDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,modo=1);

//motorPololu();

//piNon();

//servo3D();