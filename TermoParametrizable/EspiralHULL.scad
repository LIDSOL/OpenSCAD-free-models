Diametro=90;
espesor=4;
//pasoRosca=0.6;
espesorRosca=1;

//compartimiento1=80;
//compartimiento2=95;
alturasRosca=10;
resoluciOn=100;
radioRosca=0.6;
vueltas=0.5;

difference(){
hull(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 45, $fn = resoluciOn)
       translate([Diametro/2-espesor-radioRosca, 0, 0])
    circle(r = radioRosca);
    
    translate([0,0,1])
    linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 45, $fn = resoluciOn)
       translate([Diametro/2-espesor-radioRosca, 0, 0])
    circle(r = radioRosca);
    
}
cylinder(r=Diametro/2-espesor*2,h=800,$fn=100);
}

/*
translate([0,0,4.8])
rotate(-90)
difference(){
hull(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
       translate([Diametro/2-espesor-radioRosca, 0, 0])
    circle(r = radioRosca);
    
    translate([0,0,1])
    linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
       translate([Diametro/2-espesor-radioRosca, 0, 0])
    circle(r = radioRosca);
    
}
cylinder(r=Diametro/2-espesor*2,h=800,$fn=100);
}
*/