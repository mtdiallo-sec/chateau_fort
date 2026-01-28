/* Ce fichier definit la construction du chateau, 
    pour le chateau, on crée quatres tours et un mur d'enceinte 
*/

//CONSTRUCTION DU CHATEAU
void construireChateau(float distTours, float largeurTour, float hauteurTour) {

  //Placement des tours aux quatre coins
  int[] positions = {-1, 1};
  for (int x : positions) {
    for (int z : positions) {
      pushMatrix();
      translate(x * distTours/2, 0, z * distTours/2);
      creerTour(largeurTour, hauteurTour);
      popMatrix();
    }
  }

  //Construction des murs d'enceinte
  float distanceMurCentre = (distTours / 2) + (largeurTour / 2) + MARGE_MUR_EXTERIEUR;
  float longueurMur = distanceMurCentre * 2;
  float hauteurMur = hauteurTour * RAPPORT_HAUTEUR_MUR;

  for (int i = 0; i < 4; i++) {
    pushMatrix();
    rotateY(i * HALF_PI); // Chaque mur tourné à 90°
    translate(0, -hauteurMur/2, distanceMurCentre); 

    //Appel de la fonction de dessin du mur d'enceinte
    dessinerMurEnceinte(longueurMur, hauteurMur, EPAISSEUR_MUR, (i == 0));
    
    popMatrix();
  }
}
