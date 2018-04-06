module torzo(espesor=3,alfa=0.1,resoluciOn=100){

difference(){

   union(){
    //cabeza
    translate([0,espesor*2])
     circle(r=espesor*(5/8),$fn=resoluciOn);

    //torzo
    translate([0,espesor+2])
    square([espesor/2,4],center=true);
     square([3*espesor,2*espesor],center=true);
    
   //espalda 
  translate([0,(espesor/3)*2])
   square([14*(espesor/3),(espesor/3)*2],center=true);
  
    
    //Brazo Derecho
    translate([2*espesor,-espesor/2])
    square([(espesor/3)*2,espesor*3-(espesor/3)],center=true);
   
    translate([2*espesor,-5.5*(espesor/3)])
    circle(r=(espesor/3),$fn=resoluciOn);
    
    //Brazo Izquierdo
    mirror([1,0,0]){
        translate([2*espesor,-espesor/2])
    square([(espesor/3)*2,espesor*3-(espesor/3)],center=true);
   
    translate([2*espesor,-5.5*(espesor/3)])
    circle(r=(espesor/3),$fn=resoluciOn);
        
    }
    
}//fin union

translate([0,-espesor])
square([espesor-alfa,(espesor-alfa)*2],center=true);

translate([0,-(espesor/3)])
redondeador(espesor,resoluciOn);

}//fin difference
    
    
}//fin module


module redondeador(espesor=3,resoluciOn=100){

difference(){
    
    //masa
 translate([0,(espesor/3)*4])
   square([14*(espesor/3),(espesor/3)*4],center=true);
  
    //redondeador Derecha
  translate([2*espesor,3*(espesor/3)])
    circle(r=(espesor/3),$fn=resoluciOn);
    
    //redondeador izquierda
    mirror([1,0,0]){
       translate([2*espesor,3*(espesor/3)])
       circle(r=(espesor/3),$fn=resoluciOn);    
    }
    
    //primer mitad
     translate([0,(espesor/3)*2])
   square([14*(espesor/3)+espesor,(espesor/3)*2],center=true);
    
    //segunda mitad
     translate([0,(espesor/3)*4])
   square([12*(espesor/3),(espesor/3)*4],center=true);
    
}   

}//fin redondeador

//redondeador(espesor=3,resoluciOn=100);
torzo(espesor=6,alfa=0.1,resoluciOn=100);