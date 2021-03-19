// spelers //<>// //<>// //<>// //<>// //<>//
final float SPELER1 = 0;
final float SPELER2 = 1;
int actieveSpeler = 0;
int inactieveSpeler = 0;

// schermwaarden
final int STARTSCHERM = 0; 
final int SPELSCHERM = 1;
final int EINDSCHERM = 2;
int spelStatus = STARTSCHERM;

int startTijd;
float stopTijd;
final float WACHTTIJD = 10000; //milliseconden
boolean beurtWissel = false;

// ROOSTER
final int AANTALROOSTERS = 13; // alle roosters
int roosterGroote, rijen, kolommen, aantalVerdedigingsMechanismen;
float roosterRuimte, celZijde;
int marge = 40;

int maxAantalBeurten = 0;

void beurtWissel() {
  int hulpVariabeleSpeler = actieveSpeler;
  beurtWissel =true;
  spelers[actieveSpeler].aantalBeurten ++;
  actieveSpeler = inactieveSpeler;
  inactieveSpeler = hulpVariabeleSpeler;
  stopTijd = millis() + WACHTTIJD;
}

void setup() { 
  size(800, 600);
  roosterGroote = 16;
  aantalVerdedigingsMechanismen = 10;
  initSpelers();

  switch( spelStatus ) {

  case 0:
    initialiseerStartSchermVariabelen();
    break;

  }
}

void draw() {
  background(#ADD5FF);

  switch( spelStatus ) {
  case 0:
    tekenStartScherm();
    break;
  case 1:
      tekenSpelScherm();
    break;
  case 2:
    tekenScoreScherm();
    break;
  }
}
