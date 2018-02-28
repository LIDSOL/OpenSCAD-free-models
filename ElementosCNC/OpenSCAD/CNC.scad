use<elementosDiseNio.scad>
use<piezasCorte.scad>

//medida del perfil estructural, esta medida es fija pero es importante para las transformaciones
medidaPerfil=20;

//diseño principal la medida X es 210 [mm]
medidaX=210;
//diseño principal la medida Y es 275 [mm], esta medida fue cambiada por 305 [mm] ya que tenía un error de medicion
medidaY=300;
//diseño principal la medida Y es 275 [mm]
medidaZ=210;

//horizontal sencillo
color("gray")
rotate([0,90,0])
translate([0,0,-medidaX/2])
linear_extrude(height=medidaX)
perfil1();

//vertical sencillo
color("gray")
translate([0,0,-medidaZ-(medidaPerfil/2)])
linear_extrude(height=medidaZ)
perfil1();


//esquineros vertical
color("red")
translate([medidaPerfil,0,-medidaPerfil])
rotate([90,90,0])
esquinero();

color("red")
mirror([1,0,0]){
    translate([medidaPerfil,0,-medidaPerfil])
rotate([90,90,0])
esquinero();
}
//fin esquineros vertical


//PERFIL DOBLE TRANSVERSAL
color("gray")
translate([-medidaX/2-(medidaPerfil),-(medidaY/2)-(medidaPerfil/2),+(3*medidaPerfil)+10])
rotate([0,90,0])
linear_extrude(height=medidaX+(medidaPerfil*2))
perfil2();


//CORREDERA VERTICAL

color("red")
translate([0,0,-(medidaZ/2)])
rotate([90,0,90])
correderaSimpleCompleta();


//PERFIL DOBLE LATERAL


//correderaDoble
color("red")
translate([medidaX/2+(medidaPerfil/2),-(medidaY/2)-(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,90])
correderaDobleCompleta();

//esquinero lateral
color("red")
translate([medidaX/2-(medidaPerfil/2),-medidaPerfil,0])
rotate([0,180,90])
esquinero();

//perfil
color("gray")
translate([medidaX/2+(medidaPerfil/2),(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,0])
linear_extrude(height=medidaY)
perfil2();



 //PERFIL DOBLE LATERAL ESPEJO X
mirror([1,0,0]){
    
//correderaDoble
color("red")
translate([medidaX/2+(medidaPerfil/2),-(medidaY/2)-(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,90])
correderaDobleCompleta();

//esquinero lateral
color("red")
translate([medidaX/2-(medidaPerfil/2),-medidaPerfil,0])
rotate([0,180,90])
esquinero();


//perfil
color("gray")
translate([medidaX/2+(medidaPerfil/2),(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,0])
linear_extrude(height=medidaY)
perfil2();
}

//estructura de acrilico
color("black")
translate([0,+6,0])
case();

//corredera transversal
color("red")
translate([0,-(medidaY/2)-(medidaPerfil/2),+(3*medidaPerfil)+10])
rotate([0,270,270])
correderaDobleCompleta(modo=2);

