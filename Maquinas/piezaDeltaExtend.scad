perfil=20;
extensiOn=2;
resoluciOn=100;
angulo=60;




module redondeador(perfil=20,extensiOn=3,resoluciOn=100,espesor=0){
    
    //El círculo del redondeador se encuentra en el centro
difference(){
  translate([0,perfil/2,0])
  cube([perfil*extensiOn,perfil*extensiOn,perfil-2*(espesor)],center=true);
   cylinder(r=perfil*(extensiOn/2),$fn=resoluciOn,h=perfil,center=true);   
  }

}


//redondeador();


module pizza(perfil=20,extensiOn=2,resoluciOn=100,angulo=60,espesor=0){

difference(){
  //translate([0,perfil/2,0])
  difference(){
      //el cubo a redondear se debe mover el valor del radio del círculo redondeador
      translate([0,perfil*(extensiOn/4),0])
    cube([perfil*extensiOn,perfil*(extensiOn/2),perfil-2*(espesor)],center=true);
    
  redondeador(perfil=perfil,extensiOn=extensiOn,resoluciOn=resoluciOn,espesor=espesor);
 }
 
rotate(angulo)
  translate([perfil*extensiOn,-perfil*extensiOn,0])
 cube([perfil*extensiOn*2,perfil*extensiOn*2,perfil],center=true);
 
 }
 
 }
 
 
  

module semiCil(espesor=3,perfil=20,extensiOn=3,resoluciOn=100,angulo=60){
    mueveY=sin(60)*espesor;
 mueveX=cos(60)*espesor;
    
difference(){
     //Pizza grande
 pizza(perfil=perfil,extensiOn=extensiOn,resoluciOn=resoluciOn,angulo=angulo);
 translate([-mueveX,mueveY,0])
 //talandro
 pizza(perfil=perfil,extensiOn=extensiOn,resoluciOn=resoluciOn,angulo=angulo,espesor=espesor);
 }
 }

 /*
mueveY=cos(60)*perfil;
 mueveX=sin(60)*perfil;
 */
 
 module piezaPerfil(tol=0.1, resoluciOn=100, diametroTornillosM=4){
 


difference(){


 semiCil(espesor=3,perfil=20,extensiOn=3,resoluciOn=100,angulo=60);
   
    
    //agujeros rectos
    
    for(i=[1:2]){
 translate([-10*i,0,0])
 rotate([90,0,0])
cylinder(r=diametroTornillosM/2+tol,h=20,$fn=resoluciOn,center=true); 
    }
    
    //fin agujeros rectos
    
    //agujeros en ángulo
    
    for(i=[1:2]){
     rotate(-360/3)
translate([-10*i,0,0])
 rotate([90,0,0])
cylinder(r=diametroTornillosM/2+tol,h=20,$fn=resoluciOn,center=true); 
    }
    //fin agujeros en ángulo
    
}



}//fin module


module trianguloCentral(diametroTornillosM=4,ladoTriangulo=20,tol=0.1,resoluciOn=100){


 radioPieza=ladoTriangulo/(2*cos(30));

//cilindro sujeta Perfiles
for(i=[1:3]){

rotate(-90)   
rotate(-120*i)
rotate([90,0,0])
cylinder(r=diametroTornillosM/2+tol,$fn=resoluciOn,h=10);

}

cylinder(r=radioPieza,$fn=3,center=true,h=ladoTriangulo);
 
 }

//#######RENDERIZADOS#######
ladoTriangulo=20;
radioPieza=ladoTriangulo/(2*cos(30));
translate([-sin(30)*radioPieza,10,0])
piezaPerfil();

trianguloCentral();



 

 
 