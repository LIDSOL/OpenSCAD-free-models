use<elementosDiseNio.scad>
use<piezaDeltaExtend.scad>





/*
linear_extrude(height=300)
perfil2();
*/

ladoPerfil=20;
radioPieza=ladoPerfil/(2*cos(30));
largoPerfilesBase=200;

for(i=[0:1]){
translate([0,0,(alturaDelta+ladoPerfil)*i])

union(){
//##### ESQUINERO CUADRANTE 3#####
color("red")
translate([-sin(30)*radioPieza,10,0])
piezaPerfil();

//##### ESQUINERO CUADRANTE 4#####
color("red")
mirror([0,1,0]){
translate([-sin(30)*radioPieza,10,0])
piezaPerfil();
}


//##### ESQUINERO CUADRANTES 1 y 2#####
color("red")
translate([12,0,0])
rotate(-120)
piezaPerfil();

color("red")
trianguloCentral();

//#####Perfiles en la base (x3)
//largoPerfilesBase=200;

 color("gray")
for(i=[0:2]){
     rotate(i*120)
    translate([-5.5,0])
   rotate([0,-90,0])
   linear_extrude(height=largoPerfilesBase)
   perfil1();
   }
 
   }//fin union 

}//fin for tapa y base



//##### Esquineros en la base#####
for(i=[0:2]){
    rotate(i*120)
  color("red")
  translate([-largoPerfilesBase+ladoPerfil+(ladoPerfil/4),0,ladoPerfil+1.3])
   rotate([90,0,0])
  esquinero();
}

alturaDelta=400;

for(i=[0:2]){
     rotate(i*120)    
     color("gray")
     translate([-largoPerfilesBase+(ladoPerfil/4),0,ladoPerfil/2])
     linear_extrude(height=alturaDelta)
      perfil1();
    }

