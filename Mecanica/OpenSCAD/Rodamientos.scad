

/*

Sección corte de Rodamiento

A la figura característica se le llamara perfilTrapecio

                     LonG          LonG
             _________     _      _________
            |              |    |  |   |              | LonD
            |             /    /   \    \             | LonE
 LonA   |            |    |     |   |             | LonF
            |             \    \   /    /             | LonE
            |________|     |_|   |_________| LonD
                LonB      LonC     LonB
            


*/

module perfilTrapecio(lonA=12,lonB=4,lonD=1,lonE=1,lonF=4,lonG=2){
             polygon([[lonB,lonA/2],[0,lonA/2],[0,-lonA/2],[lonB,-lonA/2],[lonB,-lonA/2+lonD],[lonB-lonG,-lonA/2+lonD+lonE],[lonB-lonG,lonA/2-lonD-lonE],[lonB,lonA/2-lonD]]);
}

module balinTrapecio(lonA=12,lonB=3,lonD=1,lonE=1,lonF=4,lonE=1,lonG=1,radioInterno=4,radioExterno=11,tol=0.1){ 
   lonC=radioExterno-radioInterno-(2*lonB)-(2*tol); 
        difference(){
            cylinder(r=lonB,h=lonA,center=true);
    
              rotate_extrude(convexity = 10)
          translate([-lonB-lonC,0,0])
          perfilTrapecio(lonA=lonA,lonB=lonB,lonD=lonD,lonE=lonE,lonF=lonF,lonG=lonG);
    
          }
      }

module rodamiento(radioExterno=11,radioInterno=4,tol=0.65,balines=8,lonA=12,lonB=2.5,lonD=1,lonE=1,lonF=4,lonE=1,lonG=1){
    
    lonC=radioExterno-radioInterno-(2*lonB)-(2*tol);

//Pieza interna
rotate_extrude(convexity = 10)
translate([radioInterno, 0, 0])
perfilTrapecio(lonA=lonA,lonB=lonB,lonD=lonD,lonE=lonE,lonF=lonF,lonG=lonG);

//Pieza externa
rotate_extrude(convexity = 10)
translate([-radioInterno-(radioExterno-radioInterno),0,0])
perfilTrapecio(lonA=lonA,lonB=lonB,lonD=lonD,lonE=lonE,lonF=lonF,lonG=lonG);

//Banlines
for(i=[0:balines-1]){
    angulo=360/balines;
    rotate(i*angulo)
translate([radioExterno-((radioExterno-radioInterno)/2),0,0])
balinTrapecio(lonA=lonA,lonB=lonB,lonD=lonD,lonE=lonE,lonF=lonF,lonE=lonE,lonG=lonG,radioInterno=radioInterno,radioExterno=radioExterno,tol=tol);
}

}

//###RENDERIZADOS###
$fn=200;
/*
radioExterno        ->          radio Externo del rodamiento
radioInterno        ->          radio Interno del rodamiento
tol                         ->          tolerancia entre "baline y piezas externas e internas
lonA                       ->         ancho del rodamiento
lonB                        ->        medida de cierre entre las piezas interna y externa
*/

//rodamiento(radioExterno=11,radioInterno=4,tol=0.525,balines=10,lonA=12,lonB=2.5);
