
//include<./../../Componentes/motores.scad>;
//include<Encoder.scad>;
//include<Rodamientos.scad>;
//include<RodamientoEsfera.scad>;
//include<./../../Utilidades/Utilities.scad>;


//Programa track hace llantas y orugas


/*

        Seccion L
         ______
        (______)       Seccion circular


*/





module track(radio=40,tol=0.1,espesor=1,ancho=20,lonL=80,modo=0,dientes=36,alturaDentado=6,alturaDentadoInterno=2){

Pi=3.14159;
    //Cálculo para 
Radio=(Pi*2*radio+2*lonL)/(2*Pi);
    echo(Radio);


if(modo==0){
    
    //primer segmento circular
translate([0,-lonL/2,0])
    
union(){
    
        difference(){
            cylinder(r=radio+tol+espesor,h=ancho,center=true);
            cylinder(r=radio+tol,h=ancho*2,center=true);
            translate([-radio-(tol+espesor),0,-radio])
            cube([(radio+tol+espesor)*2,(radio+tol+espesor)*2,(radio+tol+espesor)*2]);
        }
    
        
        //dientes
        rotate(180)
       for(i=[0:(dientes-1)/2]){
        angulo=360/dientes;
        rotate(angulo*i)
        union(){
            //internos
            translate([radio-(alturaDentadoInterno/2),0,0])
            cube([alturaDentadoInterno,1,ancho/3],center=true);

            //externos
            translate([radio+espesor+tol,0,0])
            rotate([0,90,0])
            linear_extrude(alturaDentado,scale=0.75)
            square([ancho,1.5],center=true);
        }
       }
       
    }

 
    //segundo segmento circular
mirror([0,1,0]){
    
translate([0,-lonL/2,0])
 union(){
  difference(){
      cylinder(r=radio+tol+espesor,h=ancho,center=true);
      cylinder(r=radio+tol,h=ancho*2,center=true);
      translate([-radio-(tol+espesor),0,-radio])
      cube([(radio+tol+espesor)*2,(radio+tol+espesor)*2,(radio+tol+espesor)*2]);
   }
   
      //dientes
        rotate(180)
       for(i=[0:(dientes-1)/2]){
        angulo=360/dientes;
        rotate(angulo*i)
        union(){
            //internos
            translate([radio-(alturaDentadoInterno/2),0,0])
            cube([alturaDentadoInterno,1,ancho/3],center=true);

            //externos
            translate([radio+espesor+tol,0,0])
            rotate([0,90,0])
            linear_extrude(alturaDentado,scale=0.75)
            square([ancho,1.5],center=true);
        }
       }
   }//fin union

}

//primer segmento recto
translate([radio+(espesor/2)+tol,0,0])
cube([espesor,lonL,ancho],center=true);

//segundo segmento recto
mirror([1,0,0]){
translate([radio+(espesor/2)+tol,0,0])
cube([espesor,lonL,ancho],center=true);    
}

}

//Modo de impresion, en círcunferencia
if(modo==1){
    difference(){
        cylinder(r=Radio+tol+espesor,h=ancho,center=true);
        cylinder(r=Radio+tol,h=ancho*2,center=true);
    }



    for(i=[0:dientes-1]){
        angulo=360/dientes;
        rotate(angulo*i)
        union(){
            //internos
            translate([Radio-(alturaDentadoInterno/2),0,0])
            cube([alturaDentadoInterno,1,ancho/3],center=true);

            //externos
            translate([Radio+espesor+tol,0,0])
            rotate([0,90,0])
            linear_extrude(alturaDentado,scale=0.75)
            square([ancho,1.5],center=true);
        }
       }

}

}//fin module track

//#####RENDERIZADOS####
//Se recomienda no tener renderizados (debugging)
$fn=40;
/*
radio       -> radio para las ruedas
 Si se requiere hacer llantas la seccion L debe ser 0
tol             -> tolerancia adicional
espesor     -> espesor de la cadena
ancho       -> ancho de la rueda o cadena
lonL           -> dimension plana de cadena
modo        -> modo de vista para cadena extendida o reducida (imresion)
                0 para verla extendida
                1 para verla en circunferencia
*/

radio=30;
espesor=4;
ancho=6.1;
alturaDentadoInterno=2;

track(radio=radio,tol=0.1,espesor=2,ancho=ancho,lonL=60,modo=0,dientes=26,alturaDentado=1,alturaDentadoInterno=3);




//rodamiento(radioExterno=11,radioInterno=4,tol=0.525,balines=10,lonA=20,lonB=2.5);
//rodamiento(radioBalero=12,paredExterna=0.5,radioInterno=5,tol=0.2,ajusteEnteroBalines=1,resoluciOn=250);




//ejemplo llanta
//track(radio=10,tol=0.1,espesor=10,ancho=30,lonL=0,modo=1,dientes=20,alturaDentado=4);

