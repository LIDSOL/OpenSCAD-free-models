
include<./../../Utilidades/Utilities.scad>;


//###Modulo rodamiento###
module rodamiento(radioBalero=14,paredExterna=1,radioInterno=5,tol=0.2,ajusteEnteroBalines=1,resoluciOn=100){

Pi=3.14159;

radioExterno=radioBalero-paredExterna;
paredInterna=(radioExterno-radioInterno)/4;



radioEsfera=(radioExterno-radioInterno)/2;
ancho=(radioEsfera*2);

radioTrayectoria=radioExterno-radioEsfera;
perimetroTrayectoria=2*Pi*radioTrayectoria;


//rondana(ancho=ancho,radioInterno=radioExterno,radioExterno=radioExterno+paredExterna);

difference(){
    rondana(ancho=ancho,radioInterno=radioInterno,radioExterno=radioBalero,resoluciOn=resoluciOn);
    
    rotate_extrude(convexity = 10,$fn=resoluciOn)
    translate([radioTrayectoria, 0, 0])
    circle(r = radioEsfera);
    
      rondana(ancho=2*ancho,radioInterno=radioInterno+paredInterna,radioExterno=radioExterno-paredInterna,resoluciOn=resoluciOn);

}


//Calculo numero de balines
alfa=asin(radioEsfera/radioTrayectoria);
//beta=2*alfa
betaRadianes=(alfa*2)*(Pi/180);
segmentoEsfera=radioTrayectoria*betaRadianes;
balines=perimetroTrayectoria/(segmentoEsfera);
balinesCeil=ceil(balines);

//####Debugging####
//echo(balinesCeil);
echo("AnchoBalero",ancho);


angulo=360/(balinesCeil-ajusteEnteroBalines);

for(i=[0:(balinesCeil-ajusteEnteroBalines)]){
    rotate(i*angulo)
    translate([radioTrayectoria, 0, 0])
    sphere(r=radioEsfera-tol);
    
}


//postes balines (postes para qeu los balines puedan ser impresos)
translate([0,0,-radioEsfera])
for(i=[0:(balinesCeil-ajusteEnteroBalines)]){
    rotate(i*angulo)
    translate([radioTrayectoria, 0, 0])
    //sphere(r=radioEsfera-tol);
    cylinder(r=tol,h=radioEsfera);
}

}//fin module


//####COMPLEMENTOS####


module pinRodamiento(radioExterno=5,espesor=1,alturaPin=12,tol=0.1){

difference(){
    union(){
        rondana(ancho=alturaPin,radioInterno=radioExterno-espesor,radioExterno=radioExterno-tol);
       translate([0,0,(alturaPin/2)-espesor/4])
      rotate_extrude(convexity=10)
        translate([radioExterno-tol,0])
        circle(r=espesor/4);
        }
        //cilindros
    rotate([0,90,0])
    cylinder(r=espesor,h=10,center=true);
   rotate([90,90,0])
    cylinder(r=espesor,h=10,center=true);
//cubos
        
        translate([0,0,alturaPin/2])
        cube([espesor/2,radioExterno*4,alturaPin],center=true);

        rotate(90)        
        translate([0,0,alturaPin/2])
        cube([espesor/2,radioExterno*4,alturaPin],center=true);


}

}//fin pin rodamiento
//####RENDERIZADOS####

$fn=100;

//pinRodamiento(radioExterno=5,espesor=1,alturaPin=22,tol=0.1);

//el ajuste entre balines le quita un balin en caso de ser necesario
rodamiento(radioBalero=14,paredExterna=2,radioInterno=5,tol=0.5,ajusteEnteroBalines=1,resoluciOn=50);


