Diametro=90;
espesor=4;
compartimiento1=80;
compartimiento2=95;
alturasRosca=10;
resoluciOn=20;


module compartimiento(Diametro=90,espesor=4,altura=80){
    difference(){
        cylinder(d=Diametro,$fnresoluciOn,h=altura,center=true);
        cylinder(d=Diametro-2*espesor,$fn=resoluciOn,h=2*compartimiento1,center=true);
    }
}

compartimiento(Diametro,espesor,compartimiento1);
translate([0,0,-0.5*alturasRosca])
cube([Diametro,2,compartimiento1-alturasRosca],center=true);

//cilindo helice abajo
translate([0,0,-(compartimiento1/2)-alturasRosca/2])
cylinder(d=Diametro-(3*espesor),$fn=100,h=alturasRosca,center=true);

//Helice abajo
translate([0,0,-(compartimiento1/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*3, $fn = resoluciOn)
translate([Diametro/2-espesor, 0, 0])
circle(r = 0.6);


//Helice arruba
translate([0,0,(compartimiento1/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*3, $fn = resoluciOn)
translate([Diametro/2-espesor, 0, 0])
circle(r = 0.6);