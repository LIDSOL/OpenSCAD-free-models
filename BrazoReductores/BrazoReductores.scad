
//home/pablovc/Documentos/OpenSCAD-free-models/SistemaTiDi
include<./../CASEgamma/CASEgamma.scad>;
include<./../Componentes/boards.scad>;
include<./../Componentes/sensores.scad>;
include<./../Componentes/motores.scad>;
include<./../Utilidades/Utilities.scad>;

espesor=1.5;
tolerancia=4;
espaciaminetoX=5;
escalamientoShaft=1.1;

module caseMayorRedDobleEje(modo=0){
  
    difference(){
        CASEgamma(lonX=64.2+(2*(espesor+tolerancia+espaciaminetoX)),lonY=18.8+(2*(espesor+tolerancia)),lonZ=22.5*2+espesor+tolerancia,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=0);
        //motor reductor
        translate([0,0,22.5/2])
        rotate([90,0,0])
    redDobleEje(modo=0,centrado=2);
        /*if(modo==0){  
    
        }*/
        if(modo==1){
            //coples parte mOvil
            translate([-64.2*2,0,(22.5*2+espesor+tolerancia+5)/4])
           rotate([0,90,0])
            rotate(90)
            linear_extrude(height=4*64.2)
        scale(escalamientoShaft)
        RedMotShaft();    
         
            translate([64.2/2,0,0])
            rotate([0,90,0])
            for(i=[0:3]){
                rotate(i*90)
                translate([6,0,0])
         sphere(r=3);
            }
            }
    }
    
}

//parte 0
/*
CASEgamma(lonX=64.2+(2*(espesor+tolerancia+espaciaminetoX)),lonY=18.8+(2*(espesor+tolerancia)),lonZ=5,espesor=1.5,diametroPoste=5,tornillo=3,parte=1);
*/

//#####RENDERIZADOS#####

caseMayorRedDobleEje(modo=1);
    