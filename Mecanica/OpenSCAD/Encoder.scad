module Encoder(cuentas=16,Radio=20,RadioEje=3,doble=1){
toleranciaExterna=1;
toleranciaInterna=0.5;
angulo=360/cuentas;

RadioInterno=RadioEje+toleranciaExterna;
altoRanura=Radio-RadioInterno-toleranciaExterna;
Pi=3.14159;
PerimetroRadioInterno=RadioInterno*2*Pi;
anchoRanura=PerimetroRadioInterno/(2*cuentas);
//anchoRanura=1;

if(doble==0){
difference(){
circle(r=Radio);
 for(i=[1:cuentas]){
    rotate(i*angulo)
    translate([RadioInterno+(altoRanura/2),0,0])
    square([altoRanura,anchoRanura],center=true);
    }
  circle(r=RadioEje);
  }
echo(angulo);
}

if(doble==1){
 union(){
   difference(){
   circle(r=Radio);
    for(i=[1:cuentas]){
       rotate(i*angulo)
       translate([RadioInterno+(altoRanura/4),0,0])
       square([altoRanura/2,anchoRanura],center=true);
       }
     rotate(angulo/2)
     for(i=[1:cuentas]){
       rotate(i*angulo)
       translate([RadioInterno+(3*altoRanura/4),0,0])
       square([altoRanura/2,anchoRanura],center=true);
       }
     circle(r=RadioEje);
     }
    difference(){
       circle(r=RadioInterno+(altoRanura/2)+toleranciaInterna/2);
       circle(r=RadioInterno+(altoRanura/2)-toleranciaInterna/2);
    }
  }
echo(angulo);

}
//echo(anchoRanura);
//echo(RadioInterno);
}//FIN MODULO


//###RENDERIZADOS###
$fn=20;
//Encoder(cuentas=16,Radio=36/2,RadioEje=21/2,toleranciaExterna=4,toleranciaInterna=0,doble=0);
