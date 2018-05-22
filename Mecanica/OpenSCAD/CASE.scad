include<./../../CASEgamma/CASEgamma.scad>;
include<./../../Mecanica/OpenSCAD/SistemaTrack.scad>;
include<./../../Mecanica/OpenSCAD/LlantaTrack.scad>;


altoCase=50;
largo=140;
ancho=80;
pin=7;
lonL=70;
espesorCase=1.5;

translate([0,0,altoCase/4])

difference(){
   CASEgamma(lonX=ancho,lonY=largo,lonZ=altoCase,espesor=espesorCase,diametroPoste=5,tornillo=2.5,parte=1);

 translate([-18.8/2+ancho/2-espesorCase,64.2,-22.5/2])
    rotate([0,180,90])
    redDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,modo=0);
    
    
    mirror([1,0,0]){
      translate([-18.8/2+ancho/2-espesorCase,64.2,-22.5/2])
    rotate([0,180,90])
    redDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,modo=0);
    
        }

}

translate([(pin+ancho)/2,-lonL/2,0])
rotate([0,90,0])
pinRodamiento(radioExterno=5,espesor=1,alturaPin=pin,tol=0.1);


mirror([1,0,0]){
    translate([(pin+ancho)/2,-lonL/2,0])
rotate([0,90,0])
pinRodamiento(radioExterno=5,espesor=1,alturaPin=pin,tol=0.1);
}