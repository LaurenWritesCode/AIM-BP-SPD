void mousePressedInScoreScherm() {
  boolean klikOpKnop = bepaalOfKlikOpKnop(width/3, height -100, width/3, 100);
  if ( klikOpKnop == true ) {
    herstartSpel();
  }
}
void tekenScoreScherm() {
  int winnaar = bepaalWinnaar();
  fill(204, 102, 0); 
  textAlign(CENTER, CENTER);
  text("De winnaar is " + spelers[winnaar].naam + " met een score van " + spelers[winnaar].totaalScore, 200, 200);
  tekenKnop( #ff0000, width/3, height -100, width/3, 100, "Restart");
}

int bepaalWinnaar() {
  int hoogsteScore = 0;
  int winnaar = 0;
  for ( int speler = 0; speler < spelers.length; speler++ ) {
    if (spelers[speler].totaalScore > hoogsteScore) {
      hoogsteScore = spelers[speler].totaalScore;
      winnaar = speler;
    }
  }
  return winnaar;
}

void herstartSpel() {
  spelStatus = STARTSCHERM;
  setup();
  // plaats sliders op default positie
  positieRoosterSlider = 1;
  positieAfweerSlider = 10;
  // geef sliders de default waarde
  roosterGroote = 16;
  aantalVerdedigingsMechanismen = 10;
}
