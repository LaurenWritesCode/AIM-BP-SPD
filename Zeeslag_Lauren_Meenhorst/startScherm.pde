// variabelen voor starscherm
int xSliders, breedteSliders, hoogteSliders; 
int yRoosterSlider, breedteRoosterSliderBlok; 
int yAfweerSlider, breedteAfweerSliderBlok; 

int startSchermMarge = 65;

int positieRoosterSlider = 1;
int positieAfweerSlider = 10;

int kleurKnop, startKnopX, startKnopY, startKnopBreedte, startKnopHoogte;
int inputSpelerX, inputSpeler1Y, inputSpeler2Y, inputSpelerBreedte, inputSpelerHoogte;

boolean klikOpInputSpeler1, klikOpInputSpeler2;

void initialiseerStartSchermVariabelen() {
  //scherm opdeling

  //sliders
  xSliders = width / 4;
  breedteSliders = width / 2;
  hoogteSliders = (height - 6 * startSchermMarge) / 5;
  //rooster Slider
  yRoosterSlider = round(1.5 * startSchermMarge);
  breedteRoosterSliderBlok = floor(breedteSliders / 3);
  //afweer Slider
  yAfweerSlider = round(2.5 * startSchermMarge) + hoogteSliders ;
  breedteAfweerSliderBlok = floor(breedteSliders / 21);

  //inputveld 1
  inputSpelerBreedte = width / 3;
  inputSpelerHoogte = hoogteSliders;
  inputSpelerX = inputSpelerBreedte;  
  inputSpeler1Y = yAfweerSlider + round(1.5 * marge) + hoogteSliders ;
  inputSpeler2Y = inputSpeler1Y + inputSpelerHoogte + round(0.5 * startSchermMarge);

  //knop
  kleurKnop = #ff0000;
  startKnopBreedte = inputSpelerBreedte;
  startKnopX = startKnopBreedte;
  startKnopY = inputSpeler2Y + inputSpelerHoogte + startSchermMarge;
  startKnopHoogte = hoogteSliders;
}

// Bepaalt of er op een knop geklikt is 
boolean bepaalOfKlikOpKnop(int knopX, int knopY, int knopBreedte, int knopHoogte) {
  boolean klikOpKnop = false;

  if (mouseX > knopX && mouseX < (knopX + knopBreedte) && mouseY > knopY && mouseY < (knopY + knopHoogte)) {
    klikOpKnop = true;
  }

  return klikOpKnop;
}

// Bepaalt wat de waarde is van de positie van het beweegbaare blokje in de slider.
int bepaalPositieSlider (int ySlider, int breedteSliderBlok, int initPositieSlider, int maxPositieSlider) { 
  int positieSlider = initPositieSlider;

  if (mouseX > xSliders && mouseY > ySlider && mouseX < xSliders + breedteSliders && mouseY < ySlider + hoogteSliders) {
    positieSlider = floor( constrain ((( mouseX - xSliders ) / breedteSliderBlok), 0, maxPositieSlider));
  } 

  println(positieSlider);
  return positieSlider;
} 

// tekent een slider
void tekenSlider( int ySlider, int breedteSliderBlok, int positieSlider, String sliderOpdrachtVoorSpeler, 
  int tekstVoorPositieAanduiding, String tekstMin, String tekstMax) {

  fill(#000000);
  textAlign(CENTER, CENTER);
  text(sliderOpdrachtVoorSpeler, xSliders + breedteSliders * 0.5, ySlider - 15);

  fill(#ffffff);
  rect( xSliders, ySlider, breedteSliders, hoogteSliders );

  fill(#DB0909);
  rect( xSliders + breedteSliderBlok * positieSlider, ySlider, breedteSliderBlok, hoogteSliders );
  textAlign(CENTER, TOP);
  text(tekstMin, xSliders, ySlider + hoogteSliders);
  text(tekstMax, xSliders + breedteSliders, ySlider + hoogteSliders);

  fill(#ffffff);
  textAlign(CENTER, CENTER);
  text(tekstVoorPositieAanduiding, xSliders + (breedteSliderBlok * positieSlider) + (0.5 * breedteSliderBlok), ySlider + (0.5 * hoogteSliders));
}

// tekent een knop
void tekenKnop( int kleurKnop, int x, int y, int breedte, int hoogte, String tekst) {
  fill( kleurKnop );
  rect( x, y, breedte, hoogte );

  float tekstX = x + breedte * 0.5;
  float tekstY = y + hoogte * 0.5;

  textAlign( CENTER, CENTER );
  fill( #ffffff );
  text(tekst, tekstX, tekstY);
}

// tekent de inputvelden
void tekenInvoerVelden() {

  fill(#ffffff);
  rect(inputSpelerX, inputSpeler1Y, inputSpelerBreedte, inputSpelerHoogte);
  rect(inputSpelerX, inputSpeler2Y, inputSpelerBreedte, inputSpelerHoogte);
  fill(#000000);
  text("Voer naam in", inputSpelerX * 1.5, inputSpeler1Y - 10);
  text("Voer naam in", inputSpelerX * 1.5, inputSpeler2Y - 10);
  textAlign(CENTER, CENTER);
  text(spelers[0].naam, inputSpelerX * 1.5, inputSpeler1Y + 0.5 * inputSpelerHoogte);
  text(spelers[1].naam, inputSpelerX * 1.5, inputSpeler2Y + 0.5 * inputSpelerHoogte);
}

int bepaalRoosterGroote(int positieRoosterSlider) {
  int roosterGroote = 16;
  if ( positieRoosterSlider == 0 ) {
    roosterGroote = 11;
  } else if ( positieRoosterSlider == 1 ) {
    roosterGroote = 16;
  } else  if ( positieRoosterSlider == 2 ) { 
    roosterGroote = 21;
  }
  println(positieRoosterSlider, roosterGroote);
  return roosterGroote;
}

void keyPressedInStartScherm() {
  if (klikOpInputSpeler1 == true) {
    maakNickNameSpeler(0);
  } else if (klikOpInputSpeler2 == true) {
    maakNickNameSpeler(1);
  }
}

void maakNickNameSpeler( int speler ) {
  if ( key == BACKSPACE ) {
    if ( spelers[speler].naam.length() > 0 ) {
      spelers[speler].naam = spelers[speler].naam.substring( 0, spelers[speler].naam.length()-1);
    }
  } else if (key == SHIFT) {
    println("Shift");
  } else if ( key == '\n' ) {
  } else {
    spelers[speler].naam = spelers[speler].naam  + key;
  }
}

void mouseDraggedInStartScherm() {
  positieRoosterSlider = bepaalPositieSlider (yRoosterSlider, breedteRoosterSliderBlok, positieRoosterSlider, 2);
  roosterGroote = bepaalRoosterGroote(positieRoosterSlider);
  println(roosterGroote);
  positieAfweerSlider = bepaalPositieSlider (yAfweerSlider, breedteAfweerSliderBlok, positieAfweerSlider, 20);
  aantalVerdedigingsMechanismen = positieAfweerSlider;
}

void mousePressedInStartScherm() {
  klikOpInputSpeler1 = bepaalOfKlikOpKnop(inputSpelerX, inputSpeler1Y, inputSpelerBreedte, inputSpelerHoogte);
  klikOpInputSpeler2 = bepaalOfKlikOpKnop(inputSpelerX, inputSpeler2Y, inputSpelerBreedte, inputSpelerHoogte);
  boolean klikOpStartKnop = bepaalOfKlikOpKnop(startKnopX, startKnopY, startKnopBreedte, startKnopHoogte);

  if ( klikOpStartKnop == true ) {
    startSpel();
  }
}

void tekenStartScherm() {
  tekenSlider( yRoosterSlider, breedteRoosterSliderBlok, positieRoosterSlider, "Kies grid groote", roosterGroote - 1, "10", "20");
  tekenSlider( yAfweerSlider, breedteAfweerSliderBlok, positieAfweerSlider, "Kies het aantal afweersystemen", aantalVerdedigingsMechanismen, "0", "20" );
  tekenKnop( kleurKnop, startKnopX, startKnopY, startKnopBreedte, startKnopHoogte, "START");
  tekenInvoerVelden();
}

void startSpel() {
  //  roosterGroote = 11;
  rijen = roosterGroote;//roosterGroote;
  kolommen = roosterGroote; //roosterGroote;
  roosterRuimte = (width - (3 * marge)) / 2;
  celZijde = roosterRuimte / rijen;
  maxAantalBeurten = round(((roosterGroote -1) * (roosterGroote -1))/2);

  //init classes
  initBoten();
  initVerdediging();
  initRoosters();

  actieveSpeler = floor(random(spelers.length));
  if (actieveSpeler == 0) {
    inactieveSpeler = 1;
  } else {
    inactieveSpeler = 0;
  }

  //init rooster aspecten
  positionerenRoosters();
  vulSpelopstellingRoosters();

  while ( spelers[0].opstellingRooster == spelers[1].opstellingRooster ) {
    switch(roosterGroote) {
    case 11:
      spelers[0].opstellingRooster = round(random(2, 4));
      spelers[1].opstellingRooster = round(random(2, 4));
      break;
    case 16:
      spelers[0].opstellingRooster = round(random(5, 7));
      spelers[1].opstellingRooster = round(random(5, 7));
      break;
    case 21:
      spelers[0].opstellingRooster = round(random(8, 10));
      spelers[1].opstellingRooster = round(random(8, 10));
      break;
    }
  }

  plaatsVerdediging();
  bepaalHintNummers();

  spelStatus = 1;
}
