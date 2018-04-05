Radio=30;
pared=10;
grueso=4;
difference(){
cylinder(r=Radio,$fn=100,center=true,h=grueso);
cylinder(r=Radio-pared,$fn=100,center=true,h=grueso*2);
       
}