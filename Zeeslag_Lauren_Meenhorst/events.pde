void keyTyped() {
  keyPressedInStartScherm();
}

void mouseDragged() {
  switch( spelStatus ) {
  case 0:
    mouseDraggedInStartScherm();
    break;
  }
}

void mousePressed() {
  switch( spelStatus ) {
  case 0:
    mousePressedInStartScherm();
    break;
  case 1:
    mousePressedInSpelScherm();
    break;
  case 2:
    mousePressedInScoreScherm();
    break;
  }
}

// CONSTANTEN VOOR score
final int MIS = 10;
final int RAAK = 11;
final int RAAKAFWEER = 12;
final int RAAKMIJN = 13;

void mousePressedInSituatieRooster( int situatieRoosterActieveSpeler, int opstellingRoosterActieveSpeler, int opstellingRoosterInactieveSpeler, int situatieRoosterInctieveSpeler) {
  if (stopTijd <= millis()) { // We zitten in de WACHTTIJD periode en daarom mag er niet worden geklikt.
    for ( int rij = 1; rij < rijen; rij++) {
      for ( int kolom = 1; kolom < kolommen; kolom++) {
        if (mouseX >= roosters[situatieRoosterActieveSpeler][rij][kolom].xPos 
          && mouseX <= roosters[situatieRoosterActieveSpeler][rij][kolom].xPos + celZijde 
          && mouseY >= roosters[situatieRoosterActieveSpeler][rij][kolom].yPos 
          && mouseY <= roosters[situatieRoosterActieveSpeler][rij][kolom].yPos + celZijde ) {

          if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == LEEG 
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = MIS;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = #ff0000;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld = true;
            startTijd = millis();
            beurtWissel();
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == boten[0].waarde  
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAK;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = boten[0].kleur;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            spelers[actieveSpeler].totaalScore += boten[0].score;
            spelers[actieveSpeler].raakTeller ++;
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == boten[1].waarde  
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAK;            
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = boten[1].kleur;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            spelers[actieveSpeler].totaalScore += boten[1].score;
            spelers[actieveSpeler].raakTeller ++;
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == boten[2].waarde  
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAK;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = boten[2].kleur;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            spelers[actieveSpeler].totaalScore += boten[2].score;
            spelers[actieveSpeler].raakTeller ++;
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == boten[3].waarde  
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAK;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = boten[3].kleur;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            spelers[actieveSpeler].totaalScore += boten[3].score;
            spelers[actieveSpeler].raakTeller ++;
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == verdedigingsMechanismen[0].waarde
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) {
            roosters[situatieRoosterInctieveSpeler][rij][kolom].status = roosters[opstellingRoosterActieveSpeler][rij][kolom].status;
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAKAFWEER;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = #000000;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            // toon cel in situatie rooster tegenspeler
            roosters[situatieRoosterInctieveSpeler][rij][kolom] = roosters[situatieRoosterActieveSpeler][rij][kolom];
            spelers[actieveSpeler].totaalScore -= verdedigingsMechanismen[0].score;
            beurtWissel();
          } else if (roosters[opstellingRoosterInactieveSpeler][rij][kolom].status == verdedigingsMechanismen[1].waarde  
            && roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  == false) { 
            roosters[situatieRoosterActieveSpeler][rij][kolom].status = RAAKMIJN;
            roosters[situatieRoosterActieveSpeler][rij][kolom].kleur = #0000ff;
            roosters[situatieRoosterActieveSpeler][rij][kolom].behandeld  = true ;
            spelers[actieveSpeler].totaalScore -= verdedigingsMechanismen[1].score;
            beurtWissel();
          }
          if ((spelers[actieveSpeler].aantalBeurten >= maxAantalBeurten && spelers[inactieveSpeler].aantalBeurten >= maxAantalBeurten) || 
            (spelers[actieveSpeler].raakTeller == AANTALBOOTDELEN || spelers[inactieveSpeler].raakTeller == AANTALBOOTDELEN)) {
            eindSpel();
          }
        }
      }
    }
  }
}
