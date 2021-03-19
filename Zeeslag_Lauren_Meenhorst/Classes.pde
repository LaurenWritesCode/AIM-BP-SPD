// class definities

class Speler {
  String naam;
  int totaalScore;
  int opstellingRooster;
  int situatieRooster;
  int aantalBeurten;
  int raakTeller;

  Speler (String n, int t, int o, int s, int a, int r) {
    naam = n;
    totaalScore = t;
    opstellingRooster = o;
    situatieRooster = s;
    aantalBeurten = a;
    raakTeller = r;
  }
}

class Cel { // Deze klasse wordt gebruikt voor de cellen in de roosters
  int status; // Cel status bijvoorbeeld leeg
  int kleur;
  float xPos;
  float yPos;
  boolean behandeld;

  Cel (int s, int k, float x, float y, boolean b) {
    status = s;
    kleur = k;
    xPos = x;
    yPos = y;
    behandeld = b;
  }
}

class Boot { // Deze klasse bevat de armada
  String type;
  int lengte;
  int score;
  int kleur;
  int waarde;
  int aantal;

  Boot (String t, int l, int s, int k, int w, int a) {
    type = t;
    lengte = l;
    score = s;
    kleur = k;
    waarde = w;
    aantal = a;
  }
}

class Verdediging { // Deze klasse bevat de verdedigings objecten
  String type;
  int lengte;
  int score;
  int waarde;
  int aantal;

  Verdediging (String t, int l, int s, int w, int a) {
    type = t;
    lengte = l;
    score = s;
    waarde = w;
    aantal = a;
  }
}
 
Speler [] spelers;
Cel [][][] roosters;
Boot [] boten;
Verdediging [] verdedigingsMechanismen;

void initSpelers() {
  spelers = new Speler[2]; // Aantal spelers
  spelers[0] = new Speler("Speler 1", 0, 0, 0, 0, 0);
  spelers[1] = new Speler("Speler 2", 0, 0, 1, 0, 0);
} 

void initRoosters() {
  roosters = new Cel [AANTALROOSTERS][rijen][kolommen];
  for ( int rooster = 0; rooster < AANTALROOSTERS; rooster ++ ) {
    for ( int rij = 0; rij < rijen; rij++) {
      for ( int kolom = 0; kolom < kolommen; kolom++) {
        roosters[rooster][rij][kolom]=new Cel( 0, 0, 0, 0, false);
      }
    }
  }
}

void initBoten() {
  boten = new Boot[4]; // Aantal typen boten
  boten[0] = new Boot("Slagschip", 4, 25, #9CACC6, 1, 1);
  boten[1] = new Boot("Kruiser", 3, 15, #8894AA, 2, 2);
  boten[2] = new Boot("Torpedojager", 2, 10, #7B879B, 3, 3);
  boten[3] = new Boot("Onderzeeer", 1, 5, #677081, 4, 4);
}

void initVerdediging() {
  verdedigingsMechanismen = new Verdediging [2]; // Aantal typen verdedigingsMechanismen
  verdedigingsMechanismen[0] = new Verdediging("Afweer systeem", 1, 10, 5, aantalVerdedigingsMechanismen);
  verdedigingsMechanismen[1] = new Verdediging("Mijn", 1, 5, 6, aantalVerdedigingsMechanismen);
}
