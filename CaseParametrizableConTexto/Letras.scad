

module Letras(escala=1,altura=1){

union(){
 linear_extrude(height=altura*2)
 text(size=20*escala,font = "Simplex","Texto");

 linear_extrude(height=altura*2)
 translate([0,-35*escala,0])
 text(size=12*escala,font = "Simplex","LOGO");
 }//fin union letras
 
}

Letras();