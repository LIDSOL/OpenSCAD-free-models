Diametro=90;
espesor=4;
//pasoRosca=0.6;
espesorRosca=1;

//compartimiento1=80;
//compartimiento2=95;
alturasRosca=10;
resoluciOn=10;
radioRosca=0.6;
vueltas=0.5;


minkowski(){
    //union(){
            linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*0.5, $fn = resoluciOn)
       translate([Diametro/2-espesor-radioRosca, 0, 0])
    circle(r = radioRosca);
    //}
    cylinder(r=1,h=1,$fn=resoluciOn);  
}

/*
difference(){
    
hull(){
    union(){
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*0.5, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    }
    translate([0,0,espesorRosca])
    union(){
    linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*0.5, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    }
    
}

cylinder(r=Diametro/2-espesor*4,$fn=100,h=alturasRosca*2);
}


difference(){
    
hull(){
    union(){
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*0.5, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    }
    translate([0,0,espesorRosca])
    union(){
    linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*0.5, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    }
    
}

cylinder(r=Diametro/2-espesor*4,$fn=100,h=alturasRosca*2);
}
*/
