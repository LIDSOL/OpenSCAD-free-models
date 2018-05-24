
//LOGOS
include<./../Logos/LogoIdea161.scad>;
include<./../Logos/LogoDitacRegSCorch.scad>;

//#####RENDERIZADOS#####

espesor=1.5;
//logos
tamaNioLogos=0.5;
//postes arduino


translate([-20*tamaNioLogos+2,0,0])
union(){
   linear_extrude(height=espesor/2)
   Ditac(tamaNioLogos);


    translate([30*tamaNioLogos,5*tamaNioLogos])
    linear_extrude(height=espesor/2)
    Idea(tamaNioLogos/4);
}

$fn=100;

difference(){
     translate([0,0,-espesor])
        cylinder(r=20,h=espesor);
    translate([0,10,-espesor*2])
    cylinder(r=2,h=4*espesor);
       
}