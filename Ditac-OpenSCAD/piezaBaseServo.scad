use<piezaDCorr.scad>;
use<agujeroCuadradoCorr.scad>;


module BaseServo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=3,numY=2,vacIo=0);
square([3*12,3*6],center=true);
}

difference(){ 
square([3*12.5,3*6.5],center=true);
square([22.2,12],center=true);
translate([14,0])
circle(r=0.75,$fn=resoluciOn);
    translate([-14,0])
circle(r=0.75,$fn=resoluciOn);
}

}

}


module BaseServoContra(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=3,numY=2,vacIo=0);
square([3*12,3*6],center=true);
}

difference(){ 
square([3*12.5,3*6.5],center=true);

translate([10,0])
agujeroCuadradoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100);
    
    
translate([-10,0])
agujeroCuadradoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100);
}

}

}


//linear_extrude(height=3)
//BaseServo();

//SERVO SOLO PARA ESCALA DE 3MM
module servo3D(resoluciOn=100){

union(){

translate([5,0,15])
cylinder(h=5,center=true,$fn=resoluciOn,r=6);

translate([5,0,17.5])
cylinder(h=5,center=true,$fn=resoluciOn,r=2.25);

cube([22.2,12,26],center=true);
 
 translate([0,0,5.5])
 difference(){
     cube([32.1,12,2.5],center=true);
     
     translate([14,0,0])  
 cylinder(r=1,h=30,center=true,$fn=resoluciOn); 
     
     mirror([1,0,0]){
      translate([14,0,0])  
 cylinder(r=1,h=30,center=true,$fn=resoluciOn); 
         }
}

}//fin union

}
//FIN SERVO

/*
translate([0,0,-2])
servo3D();
*/

//linear_extrude(height=3)
//BaseServo();

BaseServoContra();
