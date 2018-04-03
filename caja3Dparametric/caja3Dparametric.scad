//Translate ()
x=20;
y=20;
z=20;
espesor=5;

difference(){
    cube([x,y,z],center=true);
    
    cube([x-espesor,y-espesor,z-espesor],center=true);
    
   translate([0,0,z-espesor])
    cube([x-espesor,y-espesor,z],center=true);
}
