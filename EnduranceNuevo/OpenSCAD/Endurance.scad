
//#####MODULOS###3

module caja1(lon=20,tol=0){
    
   difference(){
    cube([lon,lon,2*lon],center=true);
       
       //corte a 45grados 1
       translate([lon*(3/4)+tol,lon*(3/4)+tol,0])
       rotate([0,0,45])
    cube([lon,lon,2*lon],center=true);
       
       //corte a 45 grados 2
       translate([-lon*(3/4)-tol,lon*(3/4)+tol,0])
       rotate([0,0,45])
    cube([lon,lon,2*lon],center=true);
  }
}

module caja2(lon=20){
    
    difference(){
        caja1(lon,tol=1);
           //corte a 45grados 1
       translate([0,lon*(3/4),lon*(4/4)])
       rotate([45,0,0])
    cube([lon,lon,2*lon],center=true);
    }
}

module caja3(lon=20){
    
        caja1(lon,tol=0);
     
    translate([0,+(lon/5),-lon+(lon/10)])
    cube([lon,lon+(lon/5),lon/5],center=true);
}

module conector(separacion=80,lon=20){
difference(){
   cylinder(r=lon/4,h=separacion,$fn=10,center=true);
   translate([0,0,-separacion*(2/8)])
    for(i=[0:3]){
       translate([0,0,separacion/4*i])
    taladroAscenso();
   }
}
}

module taladroAscenso(lon=20){
 difference(){
   cylinder(r=lon/2,h=lon/8,$fn=10,center=true);
   cylinder(r=lon*(3/16),h=lon/8,$fn=10,center=true);
  }
 }
 
 module landingCraft(){

difference(){
cube([lon,lon*2,lon/2],center=true);
    //cabina1
translate([0,-lon*(6/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon,lon*2,lon/2],center=true);
    //cabina2
    translate([0,lon*(6/4),lon*(1/4)])
  rotate([-10,0,0])
    cube([lon,lon*2,lon/2],center=true);
    //attach
    translate([0,0,-lon/2])
   cylinder(r=lon/8,h=lon,center=true);
}
translate([0,lon/2,0])
landingCraftThrusters();

translate([0,-lon/2,0])
landingCraftThrusters();
}

module landingCraftThrusters(lon=20){
 difference(){
  cube([lon*2,lon/4,lon*(3/4)],center=true);
       translate([0,0,lon/2])
      cube([lon/2,lon*2,lon/2],center=true);  
    
       translate([0,0,-lon/2])
     cube([lon,lon*2,lon/2],center=true);  
  }
}

module spaceShip(){
difference(){
cube([lon,lon*2,lon/2],center=true);
    //cabina1
translate([0,-lon*(4/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
    
    
    //detalle 1    
translate([lon*(2/4),-lon*(5/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
    //detalle 2
translate([-lon*(2/4),-lon*(5/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
    
    
    //parte de abajo
    mirror([0,0,1]){
           //cabina1
translate([0,-lon*(4/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
      //detalle 1    
translate([lon*(2/4),-lon*(5/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
    //detalle 2
translate([-lon*(2/4),-lon*(5/4),lon*(1/4)])
  rotate([10,0,0])
    cube([lon*(3/4),lon*4,lon/2],center=true);
        }
    
    
    //posterior
    translate([0,lon*(3/4),lon*(3/4)])
  rotate([-60,0,0])
    cube([lon,lon*2,lon/2],center=true);
  
    //attach
    translate([0,lon*(3/4),-lon/2])
   cylinder(r=lon/8,h=lon,center=true);
}

}


module conectorNaves(){
//esfera central
sphere(r=lon/2,$fn=10);

translate([0,-lon/2,0])
cube([lon/4,lon,lon/2],center=true);

//cilindro para conectar landingCraft
 cylinder(r=lon/8,h=lon*(5/4),center=true);

//cilindro para conectar spaceship
rotate([0,90,0])
translate([0,-lon*(3/4),0])
cylinder(r=lon/8,h=lon*(2/4),center=true);
}

//#####RENDERIZADOS#####
//caja1();

//caja2();

//caja3();
separacion=80;
lon=20;
renderVar=1;
completo=1;

if(renderVar==1){
//rotate([0,360/12,0])
for(i=[0:3]){
    rotate([0,90*i,0])
translate([0,0,separacion])
    caja1();
}

rotate([0,360/12,0])
for(i=[0:3]){
    rotate([0,90*i,0])
translate([0,0,separacion])
    caja2();
}

rotate([0,(360/12)*2,0])
for(i=[0:3]){
    rotate([0,90*i,0])
translate([0,0,separacion])
    caja3();
}

//anillo que conecta los mOdulos
rotate([90,0,0])
difference(){
  cylinder(r=separacion,h=lon/2,center=true,$fn=12);
  cylinder(r=separacion-lon/2,h=lon/2,center=true,$fn=12);
}

//esferas en conexiones

rotate([0,(360/12)*(1/2),0])
for(i=[0:12]){
    rotate([0,(360/12)*i,0])
translate([0,0,separacion-lon*(3/8)])
    sphere(r=lon*(3/8),$fn=10);
}

//conector a naves centrales
translate([0,0,-lon])
conector(separacion,lon);

rotate([180,90,0])
conectorNaves();

}
//fin render

if(completo==1){
//######NAVE COMPLETA#####


rotate([180,90,0])
union(){


translate([0,0,lon/2+(lon/4)])
landingCraft();
  
rotate([0,90,0])
translate([0,-lon*(6/4),lon*(3/8)])
spaceShip();

//conectorNaves();
    
//segundas naves  
    
    
mirror([1,0,0]){
  rotate([0,90,0])
translate([0,-lon*(6/4),lon*(3/8)])
spaceShip();
}    
    
mirror([0,0,1]){
    translate([0,0,lon/2+(lon/4)])
landingCraft();
}



}
}


//######PRUEBAS######

//landingCraft();

//spaceShip();


