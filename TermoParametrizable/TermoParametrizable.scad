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

//#####IMPLEMENTACION HELICES######
// Threading.scad - library for threadings
// Autor: Rudolf Huttary, Berlin 2016 

use<Naca_sweep.scad> // http://www.thingiverse.com/thing:900137

// examples 
//EXAMPLE 3, y 1 
//3 externo, 1 para interno
//showexample = 3;   


/*example(showexample)
{
// #1 ACME thread
  threading(pitch = 2, d=20, windings = 5, angle = 29); 

// #2 threaded rod 20°
  threading(pitch = 2, d=20, windings = 30, angle = 20, full = true); 

// #3 nut for threaded rod 20°
  Threading(pitch = 2, d=20, windings = 10, angle = 20, full = true); 

// #4 nut for threaded rod 20°, own diameter 25 mm, hires 
  Threading(D = 25, pitch = 2, d=20, windings = 10, angle = 20, full = true, step = 50, $fn=100); 

// #5 triple helix threaded rod
  threading(pitch = 2, d=20, windings = 30, helices = 3, angle = 20, full = true); 

// #6 toothed rod (no pitch) 
   threading(helices = 0, angle = 20, full = true); 

// #7 toothed cube (no pitch) 
   threading(helices = 0, angle = 60, full = true, steps=4); 

// #8 M8 hex bolt
   union(){
     threading(pitch = 1.25, d=8, windings=20, full=true); cylinder(d=14.6, h=4, $fn=6);} 
// #9 M8 hex nut
   Threading(D=14.6, pitch = 1.25, d=8, windings=5, full=true, $fn=6);  
// #10 M8 four socket nut
   Threading(D=16, pitch = 1.25, d=8, windings=5, full=true, $fn=4);  
}*/

module example(number=0) if(number) children(number-1);

//help(); 
module help()
{
  helpstr = 
  "Thread library - Rudolf Huttary \n
    D = {0=auto};  // Cyl diameter Threading() \n
    d = 6;         // outer diameter thread() \n
    windings = 10; // number of windings \n
    helices = 1;   // number of threads \n
    angle = 60;    // open angle <76, bolts: 60°, ACME: 29°, toothed Racks: 20° \n
    steps = 40;    // resolution \n
    help();        // show help in console
    threading(pitch = 1, d = 6, windings = 10, helices = 1, angle = 60, steps=40, full = false) \n
    Threading(D = 0, pitch = 1, r = 6, windings = 10, helices = 1, angle = 60, steps=40) \n
  ";
  echo (helpstr);
}

//Threading(R=12, pitch = pitch, r=radius, windings= windings, angle = angle); 

module Threading(D = 0, pitch = 1, d = 12, windings = 10, helices = 1, angle = 60, steps=40)
{
  R = D==0?d/2+2*pitch/PI:D/2; 
  translate([0,0,-pitch])
  difference()
  { 
    translate([0,0,pitch]) 
    cylinder (r=R, h =pitch*(windings-helices)); 
    threading(pitch, d, windings, helices, angle, steps, true); 
  }
}

module threading(pitch = 1, d = 12, windings = 10, helices = 1, angle = 60, steps=40, full = false)
{  // tricky: glue two 180° pieces together to get a proper manifold  
  r = d/2;
  Steps = steps/2; 
  Pitch = pitch*helices; 
  if(full) cylinder(r = r-.5-pitch/PI, h=pitch*(windings+helices), $fn=steps); 
  sweep(gen_dat());   // half screw
  rotate([0, 0, 180]) translate([0, 0, Pitch/2])
  sweep(gen_dat());   // half screw
echo(steps); 
  function gen_dat() = let(ang = 180, bar = R_(180, -90, 0, Ty_(-r+.5, vec3D(pitch/PI*Rack(windings, angle)))))
        [for (i=[0:Steps]) Tz_(i/2/Steps*Pitch, Rz_(i*ang/Steps, bar))]; 

  function Rack(w, angle) = 
     concat([[0, 2]], [for (i=[0:windings-1], j=[0:3])
     let(t = [ [0, 1], [2*tan(angle/2), -1], [PI/2, -1], [2*tan(angle/2)+PI/2, 1]])
        [t[j][0]+i*PI, t[j][1]]], [[w*PI, 1], [w*PI, 2]]);
}



//#####FIN IPLEMENTACION HELICES#####


/*
parte ->0 base
parte ->1 compartimiento 1
parte ->2 comparmiento 2
parte ->3 compartimiento tapa
parte -> 4 Tapa
parte -> 5 tapa pila
*/

//PARTE 0BIEN
//PARTE 1BIEN
//PARTE 2BIEN
//PARTE 3BIEN
//PARTE 4BIEN
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
  
  translate([0,0,-altura/2-10])

    threading(pitch = 2, d=Diametro-(2*espesor), windings = 5, angle = 20); 

//Helice arriba
translate([0,0,altura/2-10])

    Threading(pitch = 2, d=Diametro-(2*espesor), windings = 5, angle = 20, full = true);  

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
        cylinder(d=Diametro,$fn=resoluciOn,h=altura,center=true);
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
translate([0,0,altura/2-20])

    Threading(pitch = 2, d=Diametro-(2*espesor), windings = 10, angle = 20, full = true);  




}//fin de la union

//cubo parametrizable

//Medidas conectores
/*
micro
7.8mm por 2.7mm
USB 2.0
5.5mm por 3.4mm
*/
ajusteExtra=0.1;
alturas=18;
separaciones=5;
translate([separaciones,Diametro/2,-alturas])
       cube([7.8+ajusteExtra,40,2.7+ajusteExtra],center=true);

translate([-separaciones,Diametro/2,-alturas])
       cube([5.5+ajusteExtra,40,3.4+ajusteExtra],center=true);

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
  translate([0,0,-altura/2-10])

    threading(pitch = 2, d=Diametro-(2*espesor), windings = 5, angle = 20); 

    
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
      
  
   //Helice abajo
  
  translate([0,0,-5])

    threading(pitch = 2, d=Diametro-(2*espesor), windings = 4, angle = 20); 
  
    /*
translate([0,0,-alturasRosca/2])
linear_extrude(height = alturasRosca, center = false, convexity = 10, twist = 360*4, $fn = resoluciOn)
translate([Diametro/2-espesor-radioRosca, 0, 0])
circle(r = radioRosca);
    */
    translate([0,0,5])
    cube([20,espesor,15],center=true);

}


