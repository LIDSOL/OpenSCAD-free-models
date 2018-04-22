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


module helice(alturasTotal=10,resoluciOn=100,
radioRosca=0.6,grosorRosca=1,vueltas=4){
    alturasRosca=alturasTotal/vueltas;
    for(i=[0:(vueltas-1)/2]){
        translate([0,0,alturasRosca*i])
    difference(){
        hull(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
            circle(r = radioRosca);
    
            translate([0,0,grosorRosca])
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
        circle(r = radioRosca);
    
        }
        cylinder(r=(Diametro/2)-(radioRosca*2)-(espesor*2),h=800,$fn=100);
    }
}

//SEGUNDO FOR
translate([0,0,alturasRosca/4+grosorRosca])
rotate(90)
for(i=[0:(vueltas-1)/2]){
        translate([0,0,alturasRosca*i])
    difference(){
        hull(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
            circle(r = radioRosca);
    
            translate([0,0,grosorRosca])
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
        circle(r = radioRosca);
    
        }
        cylinder(r=(Diametro/2)-(radioRosca*2)-(espesor*2),h=800,$fn=100);
    }
}

//Tercer FOR
translate([0,0,(2*alturasRosca/4)])
rotate(180)
for(i=[0:(vueltas-1)/2]){
        translate([0,0,alturasRosca*i])
    difference(){
        hull(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
            circle(r = radioRosca);
    
            translate([0,0,grosorRosca])
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 180, $fn = resoluciOn)
            translate([Diametro/2-espesor-radioRosca, 0, 0])
        circle(r = radioRosca);
    
        }
        cylinder(r=(Diametro/2)-(radioRosca*2)-(espesor*2),h=800,$fn=100);
    }
}

}//fin modulo

helice();
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