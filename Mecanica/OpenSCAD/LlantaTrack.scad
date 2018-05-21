
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

module Roles(radio=30,ancho=6.1,alturaDentadoInterno=2){

//para éste caso de rodamiento el ancho es de 6.1mm
rodamiento(radioBalero=12,paredExterna=0.5,radioInterno=5,tol=0.2,ajusteEnteroBalines=1);


translate([0,0,ancho*(1/3)])
 rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);



translate([0,0,ancho*(-1/3)])
 rondana (ancho=ancho/3,radioInterno=radio-alturaDentadoInterno-1,radioExterno=radio);



translate([0,0,-ancho/2])
linear_extrude(height=ancho)
Encoder(cuentas=16,Radio=radio-alturaDentadoInterno,RadioEje=12,toleranciaExterna=0,toleranciaInterna=0,doble=0);
}

translate([0,-lonL/2,0])
Roles(radio=radio,ancho=ancho,alturaDentadoInterno=alturaDentadoInterno);


track(radio=radio,tol=0.1,espesor=2,ancho=ancho,lonL=lonL,modo=0,dientes=26,alturaDentado=1,alturaDentadoInterno=3);