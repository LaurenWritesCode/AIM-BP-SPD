void mousePressedInSpelScherm() {
  mousePressedInSituatieRooster( spelers[actieveSpeler].situatieRooster, spelers[actieveSpeler].opstellingRooster, 
    spelers[inactieveSpeler].opstellingRooster, spelers[inactieveSpeler].opstellingRooster);
}

void tekenSpelScherm() {
  int statusBalkX = marge;
  float statusBalkY = round(2 * marge + roosterRuimte); 
  float statusBalkBreedte = 2 * roosterRuimte + marge ;
  float statusBalkHoogte = marge;

  int aantalBlokjes = 5;
  int zijde = round( height - 4.5 * marge - roosterRuimte - statusBalkHoogte);
  int legendaX = (width - 6 * marge) / 5 ;
  float legendaY = round(4 * marge + roosterRuimte); 
  if (beurtWissel) {
    if (stopTijd > millis()) {
      tekenRooster(spelers[inactieveSpeler].opstellingRooster);
      tekenRooster(spelers[inactieveSpeler].situatieRooster);
      tekenLegenda(legendaX, legendaY, zijde, aantalBlokjes);
      tekenStatusBalk (statusBalkX, statusBalkY, statusBalkBreedte, statusBalkHoogte);
      tekenNotificatieBeurtwissel();
    } else {
      tekenRooster(spelers[actieveSpeler].opstellingRooster);
      tekenRooster(spelers[actieveSpeler].situatieRooster);
      tekenLegenda(legendaX, legendaY, zijde, aantalBlokjes);
      tekenStatusBalk (statusBalkX, statusBalkY, statusBalkBreedte, statusBalkHoogte);
    }
  } else {
    tekenRooster(spelers[actieveSpeler].opstellingRooster);
    tekenRooster(spelers[actieveSpeler].situatieRooster);
    tekenLegenda(legendaX, legendaY, zijde, aantalBlokjes);
    tekenStatusBalk (statusBalkX, statusBalkY, statusBalkBreedte, statusBalkHoogte);
  }
}

void tekenLegenda(int legendaX, float legendaY, int zijde, int aantalBlokjes) {
  String legendaTekst = "leeg";
  for (int blokje = 0; blokje < aantalBlokjes; blokje ++) {
    switch (blokje) {
    case 0:
      fill(#ADD5FF);
      legendaTekst = "Leeg";
      break;
    case 1:
      fill(boten[2].kleur);
      legendaTekst = "Boot";
      break;
    case 2:
      fill(#000000);
      legendaTekst = "Afweer";
      break;
    case 3:
      fill(#0000ff);
      legendaTekst = "Mijn";
      break;
    case 4:
      fill(#ff0000);
      legendaTekst = "Mis";
      break;
    }
    int blokjeX = legendaX + (2 * marge) * blokje + zijde * blokje;
    rect( blokjeX, legendaY, zijde, zijde );
    fill(#0000ff);
    textAlign(CENTER, TOP);
    text(legendaTekst, round(blokjeX + 0.5 * zijde), legendaY + zijde);
  }
}

void tekenStatusBalk (int statusBalkX, float statusBalkY, float statusBalkBreedte, float statusBalkHoogte) {
  fill(#ffffff);
  rect(statusBalkX, statusBalkY, statusBalkBreedte, statusBalkHoogte);
  fill(#000000); 
  textAlign(CENTER, CENTER);
  text("Speeltijd is " + round(millis()/1000.0) + " seconden | " + spelers[actieveSpeler].naam 
    + " | Aantal beurten" + " : " +  (maxAantalBeurten - spelers[actieveSpeler].aantalBeurten )
    + " | Score : " + spelers[actieveSpeler].totaalScore 
    + " | Aantal raak : " + spelers[actieveSpeler].raakTeller, statusBalkX + 0.5 * statusBalkBreedte, statusBalkY + 0.5 * statusBalkHoogte);
}

void tekenNotificatieBeurtwissel() {
  text("MIS!!! De beurt gaat naar " + spelers[actieveSpeler].naam + ". Draai het schem om binnen " + round(WACHTTIJD/1000) + " seconden", width / 2, 475);
}

// CONSTANTEN VOOR OPSTELLING
final int AANTALBOTEN = 10;
final int LEEG = 0;
final int SLAGSCHIP = 1;
final int KRUISER = 2;
final int TORPEDOJAGER = 3;
final int ONDERZEEER = 4;
final int AFWEER = 5;
final int MIJN = 6;
final int AANTALBOOTDELEN = 20;

void positionerenRoosters() { // betere naam bedenken!
  for ( int rooster = 0; rooster < AANTALROOSTERS; rooster ++ ) {
    for ( int rij = 0; rij < rijen; rij++) {
      for ( int kolom = 0; kolom < kolommen; kolom++) {
        if (rooster < 2) {
          roosters[rooster][rij][kolom].xPos = (2 * marge + roosterRuimte) + (celZijde * rij);
          roosters[rooster][rij][kolom].yPos = marge + celZijde * kolom;
        } else {
          roosters[rooster][rij][kolom].xPos = marge + (celZijde * rij);
          roosters[rooster][rij][kolom].yPos = marge + celZijde * kolom;
        }
      }
    }
  }
}

void plaatsAfweerSystemen(int opstellingsRooster) {
  int teller = 0;
  while (teller != verdedigingsMechanismen[0].aantal) {
    int rij = round(random(1, roosterGroote - 1));
    int kolom = round(random(1, roosterGroote - 1));
    if (roosters[opstellingsRooster][rij][kolom].status == LEEG) {
      roosters[opstellingsRooster][rij][kolom].status = AFWEER;
      teller ++;
    }
  }
}

void plaatsMijnen(int opstellingsRooster) {
  int teller = 0;
  while (teller != verdedigingsMechanismen[0].aantal) {
    int rij = round(random(1, roosterGroote - 1));
    int kolom = round(random(1, roosterGroote - 1));
    if (roosters[opstellingsRooster][rij][kolom].status == LEEG) {
      roosters[opstellingsRooster][rij][kolom].status = MIJN;
      teller ++;
    }
  }
}

void plaatsVerdediging() {
  for (int speler = 0; speler < spelers.length; speler++) {
    plaatsAfweerSystemen(spelers[speler].opstellingRooster);
    plaatsMijnen(spelers[speler].opstellingRooster);
  }
}

void bepaalHintNummers() {
  for ( int rooster = 0; rooster < AANTALROOSTERS; rooster ++ ) {
    for ( int rij = 1; rij < rijen; rij++) {
      for ( int kolom = 1; kolom < kolommen; kolom++) {
        if ( roosters[rooster][rij][kolom].status > LEEG && roosters[rooster][rij][kolom].status < AFWEER ) {
          roosters[rooster][0][kolom].status ++;
        }
      }
    }
  }
  for ( int rooster = 0; rooster < AANTALROOSTERS; rooster ++ ) {
    for ( int rij = 1; rij < rijen; rij++) {
      for ( int kolom = 1; kolom < kolommen; kolom++) {
        if ( roosters[rooster][rij][kolom].status > LEEG && roosters[rooster][rij][kolom].status < AFWEER ) {
          roosters[rooster][rij][0].status ++;
        }
      }
    }
  }
}

void kleurCellen(int rooster, int rij, int kolom) {
  int kleurRoosters = #ADD5FF;

  if ( rij == 0 || kolom == 0 ) {
    roosters[rooster][rij][kolom].kleur = kleurRoosters;
  } else {
    if (roosters[rooster][rij][kolom].status == LEEG) {
      roosters[rooster][rij][kolom].kleur = kleurRoosters ;
    } else if (roosters[rooster][rij][kolom].status == boten[0].waarde) {
      roosters[rooster][rij][kolom].kleur = boten[0].kleur;
    } else if (roosters[rooster][rij][kolom].status == boten[1].waarde) {
      roosters[rooster][rij][kolom].kleur = boten[1].kleur;
    } else if (roosters[rooster][rij][kolom].status == boten[2].waarde) {
      roosters[rooster][rij][kolom].kleur = boten[2].kleur;
    } else if (roosters[rooster][rij][kolom].status == boten[3].waarde) {
      roosters[rooster][rij][kolom].kleur = boten[3].kleur;
    } else if (roosters[rooster][rij][kolom].status == verdedigingsMechanismen[0].waarde) {
      roosters[rooster][rij][kolom].kleur = #000000;
    } else if (roosters[rooster][rij][kolom].status == verdedigingsMechanismen[1].waarde) {
      roosters[rooster][rij][kolom].kleur = #0000ff;
    }
  }
}

void tekenRooster( int rooster) {
  int kleurRoosterLijnen = #399AFF;

  for ( int rij = 0; rij < rijen; rij++ ) {
    for ( int kolom = 0; kolom < kolommen; kolom++ ) {   

      float tekstX = roosters[rooster][rij][kolom].xPos + ( celZijde * 0.5 );
      float tekstY = roosters[rooster][rij][kolom].yPos + ( celZijde * 0.5 );

      kleurCellen( rooster, rij, kolom );

      stroke( kleurRoosterLijnen );
      fill ( roosters[rooster][rij][kolom].kleur );
      rect( roosters[rooster][rij][kolom].xPos, roosters[rooster][rij][kolom].yPos, celZijde, celZijde);

      if ( rij == 0 || kolom == 0 ) {
        if ( rooster == spelers[0].situatieRooster ) {
          fill(kleurRoosterLijnen);
          text( round( roosters[spelers[1].opstellingRooster][rij][kolom].status), tekstX, tekstY);
        } else if (rooster == spelers[1].situatieRooster ) {
          fill(kleurRoosterLijnen);
          text( round( roosters[spelers[0].opstellingRooster][rij][kolom].status), tekstX, tekstY);
        } else {
          fill(kleurRoosterLijnen);
          text( round(roosters[rooster][rij][kolom].status), tekstX, tekstY);
        }
      }
    }
  }
}

void eindSpel() {
  spelStatus = 2;
}
