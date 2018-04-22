/*Diametro=90;
espesor=4;

compartimiento1=80;
compartimiento2=95;
//alturasRosca=10;
resoluciOn=20;
radioRosca=0.6;
*/

/*
parte ->0 base
parte ->1 compartimiento 1
parte ->2 comparmiento 2
parte ->3 compartimiento tapa
parte -> 4 Tapa
parte -> 5 tapa pila
*/
parte=5;


module compartimiento(Diametro=90,espesor=4,altura=80,alturasRosca=10,Diametro=90,espesor=4,resoluciOn=20,radioRosca=0.6,vueltas=4){
    difference(){
        cylinder(d=Diametro,$fn=resoluciOn,h=altura,center=true);
        cylinder(d=Diametro-2*espesor,$fn=resoluciOn,h=2*altura,center=true);
    }
    
      //cilindo para cerrar tapa rosca
translate([0,0,-(altura/2)])
cylinder(d=Diametro,$fn=resoluciOn,h=espesor);
    
    
    //cilindo helice abajo
    translate([0,0,-(altura/2)-alturasRosca/2])
    difference(){

        
            cylinder(d=Diametro-(2*espesor)-(radioRosca*2),$fn=resoluciOn,h=alturasRosca,center=true);
        
        cylinder(d=Diametro-(4*espesor),$fn=resoluciOn,h=2*alturasRosca,center=true);
       
    }
    
    
    //Helice abajo
translate([0,0,-(altura/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*vueltas, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);


//Helice arriba
translate([0,0,(altura/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*vueltas, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);

}


if(parte==1){
    compartimiento(Diametro=90,espesor=4,altura=80,alturasRosca=10,Diametro=90,espesor=4,resoluciOn=100,radioRosca=0.6,vueltas=4);
  
//SEPARADOR
translate([0,0,-0.5*10])
cube([90,2,80-10],center=true);
}


if(parte==2){  compartimiento(Diametro=90,espesor=4,altura=95,alturasRosca=10,Diametro=90,espesor=4,resoluciOn=100,radioRosca=0.6,vueltas=4);
  

}


if(parte==3){

  compartimiento(Diametro=90,espesor=4,altura=35,alturasRosca=10,Diametro=90,espesor=4,resoluciOn=100,radioRosca=0.6,vueltas=4);
  

}


if(parte==0){
    
    Diametro=90;
espesor=4;

resoluciOn=100;
radioRosca=0.6;
    
    alturasRosca=20;
    altura=40;
    redondeadorMinkowski=10;
    
 difference(){
    
    union(){ 
    difference(){
        cylinder(d=Diametro,$fnresoluciOn,h=altura,center=true);
        cylinder(d=Diametro-2*espesor,$fn=resoluciOn,h=2*altura,center=true);
    }
    
      //cilindo para cerrar tapa rosca
    
    
translate([0,0,-(altura/2)])
    
    difference(){
    minkowski(){
cylinder(d=Diametro-(2*redondeadorMinkowski),$fn=resoluciOn,h=espesor);
    sphere(r=redondeadorMinkowski,$fn=resoluciOn);
    }
    cylinder(r=Diametro*2,$fn=resoluciOn,h=espesor*4);
}
    

//Helice arriba
translate([0,0,(altura/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*8, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
}//fin de la union

//cubo parametrizable
translate([0,40,0])
       cube([20,80,5],center=true);

        }//fin difference
        
        //batería
        //cube([60.4,49.9,4.6],center=true);
        
        
}



//TAPA

if(parte==4){
    
    
        redondeadorMinkowski=10;
    
    Diametro=90;
espesor=4;

alturasRosca=10;
resoluciOn=100;
radioRosca=0.6;
    altura=5;
      //cilindo para cerrar tapa rosca
translate([0,0,-(altura/2)])
cylinder(d=Diametro,$fn=resoluciOn,h=espesor);
    
    
    //cilindo helice abajo
    translate([0,0,-(altura/2)-alturasRosca/2])
    difference(){

        
            cylinder(d=Diametro-(2*espesor)-radioRosca,$fn=resoluciOn,h=alturasRosca,center=true);
        
        cylinder(d=Diametro-(4*espesor),$fn=resoluciOn,h=2*alturasRosca,center=true);
       
    }
    
    
    //Helice abajo
translate([0,0,-(altura/2)-alturasRosca])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*4, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    
    //tapa
    
    translate([0,0,0])
    mirror([0,0,1]){
     difference(){
    minkowski(){
cylinder(d=Diametro-(2*redondeadorMinkowski),$fn=resoluciOn,h=espesor);
    sphere(r=redondeadorMinkowski,$fn=resoluciOn);
    }
    cylinder(r=Diametro*2,$fn=resoluciOn,h=espesor*4);
}
}


}

if(parte==5){
    
    Diametro=90;
espesor=4;

compartimiento1=80;
compartimiento2=95;
alturasRosca=10;
resoluciOn=100;
radioRosca=0.6;
    //altura=0.1
    
      cylinder(d=Diametro-(2*espesor)-radioRosca,$fn=resoluciOn,h=alturasRosca,center=true);
        
translate([0,0,-alturasRosca/2])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*4, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    
    translate([0,0,5])
    cube([20,espesor,15],center=true);

}


