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


ruedasProyectos(rueda=2,dim=5,resoluciOn=100,tipo=1,cuentas=12,Radio=20);

