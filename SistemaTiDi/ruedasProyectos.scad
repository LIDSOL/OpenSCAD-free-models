use<ruedasCorr.scad>;
use<ruedasCorrRedondo.scad>;
use<Encoder.scad>;
use<agujeroCuadradoCorr.scad>;
use<RedMotShaft.scad>;

module ruedasProyectos(rueda=0,dim=3,resoluciOn=100,tipo=2,cuentas=20,Radio=15){
    
union(){
 
 
  if(tipo==0){
     //rueda con centro cuadrado
     difference(){
    circle(r=4,$fn=resoluciOn);
    agujeroCuadradoCorr();
 }

}
    
 if(tipo==1){
     //rueda motor reductor (amarillo)
     difference(){
    circle(r=4,$fn=resoluciOn);
 
    RedMotShaft(resoluciOn);
 }
//fin if tipo ==1
}

 if(tipo==2){
     //rueda Pololu
     difference(){
    circle(r=3,$fn=resoluciOn);
 
    difference(){
    circle(r=(3-0.1)/2,$fn=resoluciOn);
    translate([0,-((3-0.1)/2+(1/2))+0.6+0.1])
    square([3,1],center=true);    
   }
 }

}

if(rueda==1){
    difference(){
        ruedasCorr(dim,resoluciOn,1);
//ruedasCorrRedondo(dim,resoluciOn);
  circle(r=3-0.5,$fn=resoluciOn);
    }
}
if(rueda==0){
    difference(){
      ruedasCorr(dim,resoluciOn,0);  
    //ruedasCorr(dim,resoluciOn);
  circle(r=3-0.5,$fn=resoluciOn);
  }
}

if(rueda==2){
   
   Encoder(cuentas,Radio,RadioEje=3-0.5,res=100,toleranciaExterna=1,toleranciaInterna=20,doble=0);
}

}//fin union

}//fin module



/*
EXPLICACION DE VARIABLES
rueda:
0-> rueda con agujeros cuadrados alrededor
1-> rueda con agujeros redondos alrededor
2-> rueda con encoder 
dim: dimensiones para ruedas que contengan patrones en el interior
resoluciOn: numero de lados para figuras con arcos
tipo:
0-> agujero cuadrado en el centro
1-> agujero motor reductor en el centro
2-> agujero tipo motor pololu en el centro
3 ->agujero redondo en el centro
Cuentas: numero de rendijas para encoder
Radio: radio para rueda tipo encoder


*/
ruedasProyectos(rueda=0,dim=6,resoluciOn=100,tipo=2,cuentas=10,Radio=10);

