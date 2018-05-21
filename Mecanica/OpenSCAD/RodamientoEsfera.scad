
include<./../../Utilidades/Utilities.scad>;

/*
//###Utilidasdes####
module rondana (ancho=8,radioInterno=5,radioExterno=12,resoluciOn=100){
    
    difference(){
            cylinder(r=radioExterno,h=ancho,center=true,$fn=resoluciOn);
            cylinder(r=radioInterno,h=2*ancho,center=true,$fn=resoluciOn);
    }
    
}//fin module rondana
*/

//###Modulo rodamiento###
module rodamiento(radioBalero=14,paredExterna=1,radioInterno=5,tol=0.2,ajusteEnteroBalines=1,resoluciOn=100){

Pi=3.14159;

radioExterno=radioBalero-paredExterna;

paredInterna=(radioExterno-radioInterno)/4;



radioEsfera=(radioExterno-radioInterno)/2-tol;
ancho=(radioEsfera*2);





//rondana(ancho=ancho,radioInterno=radioExterno,radioExterno=radioExterno+paredExterna);

difference(){
    rondana(ancho=ancho,radioInterno=radioInterno,radioExterno=radioExterno+paredExterna,resoluciOn=resoluciOn);
    
    rotate_extrude(convexity = 10,$fn=resoluciOn)
    translate([radioExterno-radioEsfera+tol, 0, 0])
    circle(r = radioEsfera+tol);
    
      rondana(ancho=2*ancho,radioInterno=radioInterno+paredInterna,radioExterno=radioExterno-paredInterna,resoluciOn=resoluciOn);

}

radioTrayectoria=radioExterno-radioEsfera+tol;
perimetroTrayectoria=2*Pi*radioTrayectoria;


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
//echo(ancho);
//return ancho;

angulo=360/(balinesCeil-ajusteEnteroBalines);

for(i=[0:(balinesCeil-ajusteEnteroBalines)]){
    rotate(i*angulo)
    translate([radioTrayectoria, 0, 0])
    sphere(r=radioEsfera);
    
}

}//fin module

//####RENDERIZADOS####

$fn=40;

//el ajuste entre balines le quita un balin en caso de ser necesario
rodamiento(radioBalero=12,paredExterna=0.5,radioInterno=5,tol=0.2,ajusteEnteroBalines=1,resoluciOn=250);


