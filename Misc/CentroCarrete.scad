
difference(){
    
    //forma deseada
union(){
cylinder(r=32/2,$fn=100,h=30);

translate([0,0,30])
cylinder(r=(32+6)/2,$fn=100,h=30);
    
}

//hueco interno
cylinder(r=(32/2)-2,$fn=100,h=60);

}