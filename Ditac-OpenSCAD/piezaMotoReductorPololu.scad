use<piezaDCorr.scad>

module Pololu(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){

union(){
    
difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=2,numY=1,vacIo=0);
square([3*10,3*4],center=true);
}

difference(){ 
square([3*10.5,3*4.5],center=true);
translate([8.75,0])
circle(r=1,$fn=resoluciOn);
    translate([-8.75,0])
circle(r=1,$fn=resoluciOn);
}

}

}

//rueda Pololu
module motorPololu(resoluciOn=100){

rotate([90,0,0])
union(){
translate([0,-2,(25/2)-2])
linear_extrude(height=12)
difference(){
    circle(r=(3-0.1)/2,$fn=resoluciOn);
    translate([0,-((3-0.1)/2+(1/2))+0.6+0.1])
    square([3,1],center=true);    
   }

cube([15,11.5,25],center=true);

translate([0,-11.5/2+1.5,-1])
difference(){   
cube([25.5,3,14],center=true);
    
translate([-9,0,0])
rotate([90,0,0])
cylinder(r=1,$fn=100,h=6,center=true);
    
mirror([1,0,0]){
   translate([-9,0,0])
rotate([90,0,0])
cylinder(r=1,$fn=100,h=6,center=true);   
}

}
}//fin union

}//fin motorPololu

linear_extrude(height=3)
Pololu();

translate([0,-1,9])
motorPololu();