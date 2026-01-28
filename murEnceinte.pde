/*
Ce fichier permet de dessiner un mur de l'enceinte dans lequel les tours s'y trouvent
*/


//DESSIN DUN MUR DENCEINTE
void dessinerMurEnceinte(float longueurMur, float hauteurMur, float epaisseurMur, boolean avecPorte) {
  fill(140, 135, 125);
  stroke(60);
  box(longueurMur + epaisseurMur, hauteurMur, epaisseurMur);

  // Ajout d'une porte sur l'un des murs
  if (avecPorte) { 
    pushMatrix(); 
    fill(50, 30, 15); 
    float hauteurPorte = hauteurMur / 2; 
    translate(0, hauteurPorte/2, epaisseurMur/2 + 1); 
    box(longueurMur/6, hauteurPorte, 5); 
    popMatrix(); 
  }
}
