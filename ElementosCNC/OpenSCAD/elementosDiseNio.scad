
//resoluciOn
$fn=100;

//ancho del perfil 20 [mm]

module perfil1 (){
    //control del espesor del alumnio en las orillas
    medida=2;
difference(){
  square([20,20],center=true);
  circle(r=2);
  for(i=[1:4]){
  rotate(i*90)
  translate([0,-20/2])
  polygon(points=[[0,-medida],[3,-medida],[3,medida],[5,medida],[5,3],[3,5],[-3,5],[-5,3],[-5,medida],[-3,medida],[-3,-medida]]);
   
   //cuadrado detalle para rodamiento balero*
    rotate(i*90)
   translate([0,-20/2])
   square([7,0.7*2],center=true);   
   }
   
   //square([7,0.7*2],center=true)
   
}

}//fin module


module perfil2(){
translate([-10,0,0])
union(){
translate([20,0,0])
perfil1();
perfil1();
}
}

module esquinero(){
difference(){
cube([22.5,22.5,20],center=true);    

translate([6,6,0])
cube([22.5,22.5,10],center=true); 

translate([11,11,0])
cylinder(r=(22.5/2)+5,h=60,$fn=100,center=true);

!tornilloMaquina();
}
    
}

module baleroPatineta(){
difference(){
cylinder(r=22/2,h=7,center=true);
cylinder(r=8/2,h=7+2,center=true);
}    
}


module tornillo(altura=40){
    union(){
    cylinder($fn=6,h=6,r=15/2);
    cylinder($fn=100,h=altura,r=8/2);
    }
}


module tornilloMaquina(altura=5){
    union(){
    cylinder($fn=6,h=3,r=8/2);
    cylinder($fn=100,h=altura,r=5/2);
    }
}

module NEMA(){
union(){
  translate([0,0,20])
  cube([42,42,40],center=true);
  cylinder(r=16/2,h=62);
}

}


//####RENDERIZADOS####

esquinero();

/*
linear_extrude(height=400)
perfil1();
*/

/*
linear_extrude(height=300)
perfil2();
*/

//baleroPatineta();

//tornillo();

//NEMA();

