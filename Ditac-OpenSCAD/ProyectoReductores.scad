use<piezaDCorr.scad>
use<barrasCorr.scad>
use<cadena.scad>
use<ejesCorr.scad>
use<unificadorFrontalCorr.scad>
use<unificadorLateralCorr.scad>
use<codo.scad>
use<engranes.scad>
use<sensorHerradura.scad>
use<piezaUltrasonico.scad>
use<piezaBaseServo.scad>
use<piezaMovilServo.scad>

use<piezaMotoReductorPololu.scad>
use<piezaRedDobleEje.scad>
use<piernas.scad>
use<Torzo.scad>
use<estetica.scad>
use<esteticaR.scad>
use<LogoDitac.scad>
use<ruedasProyectos.scad>
use<piezaBaseServoContra.scad>
//###libreria 3D####
use<PiezaBase3D.scad>


//####RENDERIZADOS####

espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
resoluciOn=100;
espesor=3;
//para corte laser
alfa=0.1;
//para CNC
//alfa=0.5;

beta=(3*0.1)/32;
resoluciOn=100;

//####COMPONENTES####

//translate([0,0,6])
//sensorH21A1();

//sensorHC04();

//translate([0,0,-2])
//servo3D();

//piNon();

//translate([0,-1,9])
//motorPololu();

//####EXTRUSIoN PIEZAS####
//linear_extrude(height=espesor)

//####PIEZAS COMPONENTES####

//Herradura(espesor,alfa,beta,resoluciOn);

//Ultrasonico(espesor,alfa,beta,resoluciOn);

//BaseServo(espesor,alfa,beta,resoluciOn);

//BaseServoContra(espesor,alfa,beta,resoluciOn);

//Servo(espesor,alfa,beta,resoluciOn,modelo=2,modo=1);

//PIEZA MOVIL ServoB obsoleta :S
//ServoB(espesor,alfa,beta,resoluciOn);

//Pololu(espesor,alfa,beta,resoluciOn);

//modo 0 --> Para recortar agujero para salida de motor
//modo 2- -> Agujero Redondo (misma medida baseDitacCorr)

translate([espesor*8,espesor*5])
piezaRedDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,resoluciOn=100,modo=2,espesor=3,modo=0);

translate([espesor*8,espesor*18])
piezaRedDobleEje(largo=64.2,ancho=18.8,alto=22.5,eje=36.8,resoluciOn=100,modo=2,espesor=3,modo=2);

//####RUEDAS PROYECTOS####
//La funcion de ruedas proyectos se construye de esta forma para hacer mAs versAtil y compatible los agujeros para motores a las ruedas especializadas
//rueda 0 --> agujeros cuadrados
//rueda 1 --> agujeros redondos
//rueda 2 --> encoder
//ruedas mayores a 2 no definidas
//dim -> dimension (cuadrada en mallas de la rueda), dim=1 para rueda màs pequeña
//resoluciOn --> lados en poligonos (agujeros redondos, cuadrados, y ruedas mismas)
//tipo 0 --> agujero cuadrado
//tipo 1 --> agujero motor reductor
//tipo 2 --> agujero motor pololu
//tipo 3 --> agujero redondo
//cuentas --> cuentas en el encoder (rueda 2)
//Radio --> Radio en rueda tipo encoder

translate([0,17*espesor])
for(i=[0:1])
    translate([0,i*espesor*3.1])
ruedasProyectos(rueda=1,dim=1,resoluciOn=100,tipo=1,cuentas=12,Radio=20);


//NO HAY MODULO DE ENGRANES
//engrane(dimX=5,tamaNIo=4,redondo=1,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32);

//####PIEZAS BASE####
//modo 0 --> agujero cuadrado
//modo 1 --> agujero redondo
//modo 3- -> sin agujero

//piezaDCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=2,numY=5,modo=3);

//#####PIEZAS BASE 3D#####
//para la impresion 3D el parAmetro alfa debe ser cero ya que no se agrega medida adicional para la destruccion del material

//linear_extrude(height=espesor)
//piezaDCorr(espesor=3,alfa=-0.15,beta=0,resoluciOn=100,numX=1,numY=1,modo=0);
//Una mejora para las piezas impresas en 3D es la incusión de la nueva librería PiezaBase3D.scad que incluye mejoras en el modelo

/*PiezaBase3D(espesor=3,beta=0.009,
resoluciOn=100,
numX=1,
numY=1,tamaNio=0.3,ajuste=-0.25);
*/


//####BARRAS####
//primer argumento --> dimesnion en X
//segundo argumento --> dimension en Y
//tercer argumento --> espesor del material
//quinto argumento --> medida por destruccion de corte lAser
//sexto argumento --> medida por fricciOn de piezas
//resoluciOn --> nUmero de lados en poligonos (aguejro cuadrado, redondo, etc)
//redondo 0--> agujeros cuadrados
//redondo 1 --> agujeros redondos
//barrasCorr(1,4,espesor,alfa,beta,resoluciOn,redondo=1);



//#####CADENA#####
//espesor--> espesor del material
//alfa --> medida por destruccion de corte lAser
//tercer argumento --> dimension en X (minimo 1)
//cuarto argumento --> dimension en Y (minimo 3)
//resoluciOn --> nUmero de lados en poligonos (aguejro cuadrado, redondo, etc)
//NO MODIFICAR ULTIMOS CUATRO ARGUMENTOS #debugging
//cadena(espesor,alfa,2,5,resoluciOn,0,0,1,1);

//ejesCorr(8,espesor,alfa,beta,resoluciOn);

//unificadorFrontalCorr(3,espesor,alfa,beta,resoluciOn);

//DIMENSIUON CORRECTA 4**
/*
translate([0,espesor*2.5])
unificadorLateralCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,dimension=3);
*/

for(i=[0:7])
    translate([0,i*espesor*2.2])
unificadorLateralCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,dimension=4);



//#####CADENA#####
//espesor--> espesor del material
//alfa --> medida por destruccion de corte lAser
//beta --> medida por firccion del material
//resoluciOn --> nUmero de lados en poligonos (aguejro cuadrado, redondo, etc)
//ultimo argumento --> Importante tamaño 4 estandar para la pieza base unificador lateral
//unificadorLateralCorr(espesor,alfa,beta,resoluciOn,4);

//######CODO######
//resoluciOn --> numero de lados en poligonos
//lados --> lados del polIgono a realizar con el Angulo, si se colocan 4 lados el Angulo entre los brazos serA de 90 grados, y asI sucesivamente, el mInimo nUmero de lados es 4

//codo(dimX=2,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32,lados=10);

//#####PIEZAS ESTETICAS####

//piernas();

//torzo();

//estetica(dim=5,alto=6,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100);

//esteticaR(dim=5 ,alto=1,espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100);

//####LOGO####

//logo();

//#####PIEZAS 3D (IMPRESION)#####

//A(espesor=3,beta=0.009,resoluciOn=100,numX=2,numY=2);


