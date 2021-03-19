void vulSpelopstellingRoosters() {
  // Roosters [0] en [1] zijn gereserveerd als situatie roosters voor speler 1 en 2.

  //opstelling 1/3 voor gridgroote 11*11
  if (roosterGroote == 11) {
    roosters[2][2][1].status = SLAGSCHIP; 
    roosters[2][2][2].status = SLAGSCHIP; 
    roosters[2][2][3].status = SLAGSCHIP;
    roosters[2][2][4].status = SLAGSCHIP;

    roosters[2][4][5].status = KRUISER; 
    roosters[2][5][5].status = KRUISER; 
    roosters[2][6][5].status = KRUISER;
    roosters[2][1][8].status = KRUISER; 
    roosters[2][2][8].status = KRUISER; 
    roosters[2][3][8].status = KRUISER;

    roosters[2][0][5].status = TORPEDOJAGER; 
    roosters[2][1][5].status = TORPEDOJAGER;
    roosters[2][5][2].status = TORPEDOJAGER; 
    roosters[2][5][3].status = TORPEDOJAGER;
    roosters[2][8][8].status = TORPEDOJAGER; 
    roosters[2][8][9].status = TORPEDOJAGER;

    roosters[2][5][7].status = ONDERZEEER;
    roosters[2][7][1].status = ONDERZEEER;
    roosters[2][8][3].status = ONDERZEEER;
    roosters[2][9][5].status = ONDERZEEER;

    //opstelling 2/3 voor gridgroote 11*11
    roosters[3][5][2].status = SLAGSCHIP; 
    roosters[3][6][2].status = SLAGSCHIP; 
    roosters[3][7][2].status = SLAGSCHIP;
    roosters[3][8][2].status = SLAGSCHIP;

    roosters[3][1][5].status = KRUISER; 
    roosters[3][2][5].status = KRUISER; 
    roosters[3][3][5].status = KRUISER;
    roosters[3][2][7].status = KRUISER; 
    roosters[3][2][8].status = KRUISER; 
    roosters[3][2][9].status = KRUISER;

    roosters[3][1][1].status = TORPEDOJAGER; 
    roosters[3][2][1].status = TORPEDOJAGER;
    roosters[3][6][6].status = TORPEDOJAGER; 
    roosters[3][7][6].status = TORPEDOJAGER;
    roosters[3][8][8].status = TORPEDOJAGER; 
    roosters[3][8][9].status = TORPEDOJAGER;

    roosters[3][2][3].status = ONDERZEEER; 
    roosters[3][4][8].status = ONDERZEEER;
    roosters[3][6][4].status = ONDERZEEER;
    roosters[3][10][5].status = ONDERZEEER;

    //opstelling 3/3 voor gridgroote 11*11
    roosters[4][7][2].status = SLAGSCHIP; 
    roosters[4][8][2].status = SLAGSCHIP; 
    roosters[4][9][2].status = SLAGSCHIP;
    roosters[4][10][2].status = SLAGSCHIP;

    roosters[4][1][9].status = KRUISER; 
    roosters[4][2][9].status = KRUISER; 
    roosters[4][3][9].status = KRUISER;
    roosters[4][4][2].status = KRUISER; 
    roosters[4][4][3].status = KRUISER; 
    roosters[4][4][4].status = KRUISER;

    roosters[4][3][6].status = TORPEDOJAGER; 
    roosters[4][4][6].status = TORPEDOJAGER;
    roosters[4][6][4].status = TORPEDOJAGER; 
    roosters[4][7][4].status = TORPEDOJAGER;
    roosters[4][9][8].status = TORPEDOJAGER; 
    roosters[4][9][9].status = TORPEDOJAGER;

    roosters[4][1][2].status = ONDERZEEER; 
    roosters[4][5][7].status = ONDERZEEER;
    roosters[4][6][9].status = ONDERZEEER;
    roosters[4][10][4].status = ONDERZEEER;
  }
  //opstelling 1/3 voor gridgroote 16*16
  if (roosterGroote == 16) {
    roosters[5][7][11].status = SLAGSCHIP; 
    roosters[5][7][10].status = SLAGSCHIP; 
    roosters[5][7][9].status = SLAGSCHIP;
    roosters[5][7][8].status = SLAGSCHIP;

    roosters[5][3][3].status = KRUISER; 
    roosters[5][4][3].status = KRUISER; 
    roosters[5][5][3].status = KRUISER;
    roosters[5][13][12].status = KRUISER; 
    roosters[5][13][13].status = KRUISER; 
    roosters[5][13][14].status = KRUISER;

    roosters[5][2][6].status = TORPEDOJAGER; 
    roosters[5][2][7].status = TORPEDOJAGER;
    roosters[5][2][13].status = TORPEDOJAGER; 
    roosters[5][3][13].status = TORPEDOJAGER;
    roosters[5][9][5].status = TORPEDOJAGER; 
    roosters[5][10][5].status = TORPEDOJAGER;

    roosters[5][6][15].status = ONDERZEEER; 
    roosters[5][7][1].status = ONDERZEEER;
    roosters[5][8][13].status = ONDERZEEER;
    roosters[5][13][6].status = ONDERZEEER;

    //opstelling 2/3 voor gridgroote 16*16
    roosters[6][13][7].status = SLAGSCHIP; 
    roosters[6][13][8].status = SLAGSCHIP; 
    roosters[6][13][9].status = SLAGSCHIP;
    roosters[6][13][10].status = SLAGSCHIP;

    roosters[6][4][14].status = KRUISER; 
    roosters[6][5][14].status = KRUISER; 
    roosters[6][6][14].status = KRUISER;
    roosters[6][10][3].status = KRUISER; 
    roosters[6][11][3].status = KRUISER; 
    roosters[6][12][3].status = KRUISER;

    roosters[6][2][11].status = TORPEDOJAGER; 
    roosters[6][2][12].status = TORPEDOJAGER;
    roosters[6][6][4].status = TORPEDOJAGER; 
    roosters[6][7][4].status = TORPEDOJAGER;
    roosters[6][10][11].status = TORPEDOJAGER; 
    roosters[6][10][12].status = TORPEDOJAGER;

    roosters[6][4][6].status = ONDERZEEER; 
    roosters[6][6][12].status = ONDERZEEER;
    roosters[6][7][8].status = ONDERZEEER;
    roosters[6][10][7].status = ONDERZEEER;

    //opstelling 3/3 voor gridgroote 16*16
    roosters[7][2][3].status = SLAGSCHIP; 
    roosters[7][2][4].status = SLAGSCHIP; 
    roosters[7][2][5].status = SLAGSCHIP;
    roosters[7][2][6].status = SLAGSCHIP;

    roosters[7][7][9].status = KRUISER; 
    roosters[7][8][9].status = KRUISER; 
    roosters[7][9][9].status = KRUISER;
    roosters[7][12][2].status = KRUISER; 
    roosters[7][12][3].status = KRUISER; 
    roosters[7][12][4].status = KRUISER;

    roosters[7][3][11].status = TORPEDOJAGER; 
    roosters[7][3][12].status = TORPEDOJAGER;
    roosters[7][6][4].status = TORPEDOJAGER; 
    roosters[7][7][4].status = TORPEDOJAGER;
    roosters[7][11][13].status = TORPEDOJAGER; 
    roosters[7][11][14].status = TORPEDOJAGER;

    roosters[7][4][8].status = ONDERZEEER; 
    roosters[7][6][12].status = ONDERZEEER;
    roosters[7][15][8].status = ONDERZEEER;
    roosters[7][9][6].status = ONDERZEEER;
  }

  //opstelling 1/3 voor gridgroote 21*21
  if (roosterGroote == 21) {
    roosters[8][17][4].status = SLAGSCHIP; 
    roosters[8][17][5].status = SLAGSCHIP; 
    roosters[8][17][6].status = SLAGSCHIP;
    roosters[8][17][7].status = SLAGSCHIP;

    roosters[8][10][4].status = KRUISER; 
    roosters[8][11][4].status = KRUISER; 
    roosters[8][12][4].status = KRUISER;
    roosters[8][12][7].status = KRUISER; 
    roosters[8][13][7].status = KRUISER; 
    roosters[8][14][7].status = KRUISER;

    roosters[8][2][16].status = TORPEDOJAGER; 
    roosters[8][2][17].status = TORPEDOJAGER;
    roosters[8][4][11].status = TORPEDOJAGER; 
    roosters[8][4][12].status = TORPEDOJAGER;
    roosters[8][10][10].status = TORPEDOJAGER; 
    roosters[8][11][10].status = TORPEDOJAGER;

    roosters[8][3][2].status = ONDERZEEER; 
    roosters[8][5][7].status = ONDERZEEER;
    roosters[8][9][18].status = ONDERZEEER;
    roosters[8][13][2].status = ONDERZEEER;

    //opstelling 2/3 voor gridgroote 21*21
    roosters[9][17][4].status = SLAGSCHIP; 
    roosters[9][17][5].status = SLAGSCHIP; 
    roosters[9][17][6].status = SLAGSCHIP;
    roosters[9][17][7].status = SLAGSCHIP;

    roosters[9][5][1].status = KRUISER; 
    roosters[9][6][1].status = KRUISER; 
    roosters[9][7][1].status = KRUISER;
    roosters[9][5][13].status = KRUISER; 
    roosters[9][5][14].status = KRUISER; 
    roosters[9][5][15].status = KRUISER;

    roosters[9][2][8].status = TORPEDOJAGER; 
    roosters[9][2][9].status = TORPEDOJAGER;
    roosters[9][9][10].status = TORPEDOJAGER; 
    roosters[9][10][10].status = TORPEDOJAGER;
    roosters[9][17][12].status = TORPEDOJAGER; 
    roosters[9][17][13].status = TORPEDOJAGER;

    roosters[9][3][2].status = ONDERZEEER; 
    roosters[9][5][5].status = ONDERZEEER;
    roosters[9][9][18].status = ONDERZEEER;
    roosters[9][13][14].status = ONDERZEEER;

    //opstelling 3/3 voor gridgroote 21*21
    roosters[10][2][2].status = SLAGSCHIP; 
    roosters[10][3][2].status = SLAGSCHIP; 
    roosters[10][4][2].status = SLAGSCHIP;
    roosters[10][5][2].status = SLAGSCHIP;

    roosters[10][4][13].status = KRUISER; 
    roosters[10][4][14].status = KRUISER; 
    roosters[10][4][15].status = KRUISER;
    roosters[10][11][5].status = KRUISER; 
    roosters[10][12][5].status = KRUISER; 
    roosters[10][13][5].status = KRUISER;

    roosters[10][7][8].status = TORPEDOJAGER; 
    roosters[10][8][8].status = TORPEDOJAGER;
    roosters[10][14][16].status = TORPEDOJAGER; 
    roosters[10][15][16].status = TORPEDOJAGER;
    roosters[10][17][12].status = TORPEDOJAGER; 
    roosters[10][17][13].status = TORPEDOJAGER;

    roosters[10][2][15].status = ONDERZEEER; 
    roosters[10][7][19].status = ONDERZEEER;
    roosters[10][10][14].status = ONDERZEEER;
    roosters[10][17][19].status = ONDERZEEER;
  }
}
