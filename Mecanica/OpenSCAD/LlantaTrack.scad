
include<./../../Componentes/motores.scad>;
include<Encoder.scad>;
include<Track.scad>;
//include<Rodamientos.scad>;
include<RodamientoEsfera.scad>;
include<./../../Utilidades/Utilities.scad>;


//RedMotShaft();


radio=30;
lonL=70;
ancho=6.1;
alturaDentadoInterno=2;

module Roles(radio=30,ancho=6.1,alturaDentadoInterno=2,modo=0){

if(modo==0){
    //para éste caso de rodamiento el ancho es de 6.1mm
      rodamiento(radioBalero=12,paredExterna=0.5,radioInterno=5,tol=0.2,ajusteEnteroBalines=1);


        translate([0,0,ancho*(1/3)])
        rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);



        translate([0,0,ancho*(-1/3)])
        rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);



        translate([0,0,-ancho/2])
        linear_extrude(height=ancho)
        Encoder(cuentas=16,Radio=radio-alturaDentadoInterno,RadioEje=12,toleranciaExterna=0,toleranciaInterna=0,doble=0);
}//fin modo 0

if(modo==1){
     //para éste caso de rodamiento el ancho es de 6.1mm
      //rodamiento(radioBalero=12,paredExterna=0.5,radioInterno=5,tol=0.2,ajusteEnteroBalines=1);

difference(){
    cylinder(r=12,h=6.1,center=true);
    
    translate([0,0,-6.1])
    linear_extrude(height=6.1*2)
    RedMotShaft();
}


        translate([0,0,ancho*(1/3)])
        rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);

        translate([0,0,ancho*(-1/3)])
        rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);


      //impulsores de cadena

for(i=[0:3]){
    rotate(90*i)
   translate([radio-ancho/6,0,0])
   cube([ancho/3,ancho/6,ancho/3],center=true);
}

        translate([0,0,-ancho/2])
        linear_extrude(height=ancho)
        Encoder(cuentas=16,Radio=radio-alturaDentadoInterno,RadioEje=12,toleranciaExterna=0,toleranciaInterna=0,doble=0);
    
    
}//fin modo 1

}

$fn=20;

/*
translate([0,-lonL/2,0])
Roles(radio=radio,ancho=ancho,alturaDentadoInterno=alturaDentadoInterno,modo=0);

translate([0,lonL/2,0])
Roles(radio=radio,ancho=ancho,alturaDentadoInterno=alturaDentadoInterno,modo=1);
*/


//track(radio=radio,tol=0.1,espesor=2,ancho=ancho,lonL=lonL,modo=0,dientes=26,alturaDentado=1,alturaDentadoInterno=3);