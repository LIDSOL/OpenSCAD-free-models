difference(){


union(){
cube([36+10,36/2,36+10],center=true);    
translate([(36/2)+(50/2),0,0])
cube([50,36/2,36+10],center=true);  

}
    rotate([90,0,0])
    cylinder(r=36/2,h=20,$fn=100,center=true);

translate([20,0,20])
cube([36+50,36/2,36+10],center=true); 

translate([80,0,10])
 rotate([0,90,0])
    cylinder(r=6/2,h=100,$fn=100,center=true);
    
}


