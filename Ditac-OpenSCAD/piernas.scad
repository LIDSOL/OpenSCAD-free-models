use<DienteCorr.scad>

module piernas(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100){


medidaPiernas=3*espesor;

difference(){

union(){
  translate([0,medidaPiernas/2])
  square([medidaPiernas,medidaPiernas],center=true);

  translate([0,medidaPiernas])
  square([espesor+alfa,2*(espesor+alfa)],center=true);

  rotate(180)
  translate([-(espesor+2*(alfa+beta))/2,0])
  DienteCorr(espesor,alfa,beta,resoluciOn);
}

translate([0,espesor*(5/4)])
square([espesor,2*espesor],center=true);

}

}

piernas();