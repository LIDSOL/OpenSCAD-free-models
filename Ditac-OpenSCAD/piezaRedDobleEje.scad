use<RedDobleEje.scad>
use<piezaDCorr.scad>



//motor(vista)
/*
translate([0,0,11])
rotate([90,0,0])
redDobleEje();
//piezaRedDobleEje(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,espesor=3,modo=2);
*/

module piezaRedDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,resoluciOn=100,modo=2,espesor=3,modo=1){

    projection(){
    
        translate([0,0,espesor/2])
            difference(){

                //pieza abajo (primer argumento)
                translate([espesor*11,0,-espesor])
                linear_extrude(height=espesor)
                piezaDCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=5,
numY=2,modo=3,tamaNio=0.2,modo3D=0);

                //motor(recortador)
                translate([0,0,11])
                rotate([90,0,0])
                redDobleEje(largo,ancho,alto,eje,resoluciOn,modo);

            }
    }
    
}//fin module

//modo 0 --> Para recortar agujero para salida de motor

//modo 2- -> Agujero Redondo (misma medida baseDitacCorr)

piezaRedDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,resoluciOn=100,modo=2,espesor=3,modo=0);
