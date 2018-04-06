
use<piezaDCorr.scad>;
use<agujeroRedondoCorr.scad>;

module Servo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,modelo=2,modo=0){

union(){
    

    if(modelo==1){
        difference(){
piezaDCorr(espesor,alfa,beta,resoluciOn,numX=3,numY=1,vacIo=0);
        square([3*12,3*4],center=true);
        }
    }
    if(modelo==2){
        difference(){
        piezaDCorr(espesor,alfa,beta,resoluciOn,numX=1,numY=3,vacIo=0);
        square([3*4,3*12],center=true);
        }
    }



difference(){ 

if(modelo==1){
square([3*12.5,3*4.5],center=true);
}

if(modelo==2){
  square([3*4.5,3*12.5],center=true);  
}



if(modo==0){
circle(r=6.5/2,$fn=100);
    
}
else if(modo==1){
agujeroRedondoCorr();
}
   

}


 }
}//fin modulo pieza

module piNon(){

union(){

cylinder(h=6,r=6,$fn=100);

translate([12,0,3])
cylinder(h=3,r=4,$fn=100);

translate([0,0,4.5])
cube([25,8,3],center=true);

mirror([1,0,0]){
translate([12,0,3])
cylinder(h=3,r=4,$fn=100);   
}

}//fin union

}//fin piNon


//pieza de ensamble
//piNon();

//El modelo 1, y 2, es para que las terminaciones en las puntas sean de 2 o de 3 dientes, el modo 0, es para que se trace un agujero tal que se pueda acoplar con el servo, y el modo 1 es para que haga un agujero redondo tal que pueda apoyarse en los ejes

//linear_extrude(height=3)
Servo();






