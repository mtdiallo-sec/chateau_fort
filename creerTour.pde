/* Fichier de création d'une tour:
  Ce fichier crée une tour qui est composée de 4 murs, 
  des crenaux en haut des murs, des meurtrières et 
  d'une porte située sur l'un des murs de la tour.
  La tour a aussi un toit.
*/


//CREATION DE LA TOUR
void creerTour(float largeurTour, float hauteurTour) {
  
  // Calcule combien de briques tiennent dans la largeur et la hauteur
  int nbBriquesParCote = round(largeurTour / (2 * BRIQUE_LARGEUR));
  int nbEtages = round(hauteurTour / BRIQUE_HAUTEUR);

  dessinerTour(nbBriquesParCote, nbEtages, BRIQUE_LARGEUR, BRIQUE_HAUTEUR, BRIQUE_PROFONDEUR, 
               true, HAUTEUR_PORTE_BRIQUES, LARGEUR_PORTE_BRIQUES,
               HAUTEUR_CRENEAUX, DEBUT_CRENEAUX, ESPACE_CRENEAUX, NB_CRENEAUX);
}

//DESSIN DE LA TOUR (4 FACES)
void dessinerTour(int nbBriquesParCote, int nbEtages, float unite, float hauteurBrique, float profondeurBrique,
                  boolean avecPorte, int hPorte, int lPorte, 
                  int hCre, int debutCre, int espaceCre, int nbCre) {
  
  float largeurTotaleTour = nbBriquesParCote * 2 * unite;

  for (int cote = 0; cote < 4; cote++) {
    pushMatrix();
    rotateY(HALF_PI * cote); // Tourne de 90° pour chaque face
    
    // Recule la face pour former le cube de la tour
    translate(0, 0, largeurTotaleTour/2.0 - profondeurBrique/2.0);
    
    boolean faceAvecPorte = (avecPorte && cote == 0); // Porte seulement sur la 1ère face
    
    dessinerFaceTour(nbBriquesParCote, nbEtages, unite, hauteurBrique, profondeurBrique,
                     faceAvecPorte, hPorte, lPorte, hCre, debutCre, espaceCre, nbCre);

    if (faceAvecPorte) {
      dessinerPorte(lPorte * unite, hPorte * hauteurBrique, profondeurBrique + 1);
    }
    popMatrix();
  }
  dessinerToit(largeurTotaleTour, nbEtages, hauteurBrique);
}

//DESSIN D'UNE FACE
void dessinerFaceTour(int nbBriquesParCote, int nbEtages, float unite, float hauteurBrique, float profondeurBrique,
                        boolean avecPorte, int hPorte, int lPorte, int hCre, int debutCre, int espaceCre, int nbCre) {
  
  int nbEmplacement = nbBriquesParCote * 2;
  
  for (int h = 0; h < nbEtages; h++) {
    
    // Décale les briques un étage sur deux (effet maçonnerie)
    int decalage = (h % 2 != 0 && h < nbEtages - 1) ? 1 : 0;

    for (int c = 0; c < nbEmplacement; c++) {
      
      // Si l'emplacement est vide (porte/meurtrière), on passe au suivant
      if (estEspaceVide(c, h, nbEmplacement, avecPorte, nbEtages, hPorte, lPorte, hCre, debutCre, espaceCre, nbCre))
        continue;

      float x = (c - nbEmplacement/2.0 + 0.5) * unite;
      
      // Dessine soit une brique double (si possible), soit une brique simple
      if ((c + decalage) % 2 == 0 && c < nbEmplacement - 1 && 
                !estEspaceVide(c + 1, h, nbEmplacement, avecPorte, nbEtages, hPorte, lPorte, hCre, debutCre, espaceCre, nbCre)) {
        
        dessinerBrique(x + unite/2, -h * hauteurBrique - hauteurBrique/2, 0, unite*2, hauteurBrique, profondeurBrique);
        
        c++; 
        
      } 
      else {
        
        dessinerBrique(x, -h * hauteurBrique - hauteurBrique/2, 0, unite, hauteurBrique, profondeurBrique);
        
      }
    }
  }
}

//FONCTION QUI DESSINE UNE BRIQUE
void dessinerBrique(float x, float y, float z, float largeur, float hauteur, float profondeur) {
  fill(140, 135, 125);
  stroke(90);      
  pushMatrix();
  translate(x, y, z);
  box(largeur, hauteur, profondeur);
  popMatrix();
}

//Fonction qui gère la gestion des espaces pour la porte, les meurtrières est les creneaux
boolean estEspaceVide(int c, int h, int nbEmplacement, boolean avecPorte, int nbEtages, 
                      int hPorte, int lPorte, int hCre, int debutCre, int espaceCre, int nbCre) {
  int milieu = nbEmplacement / 2;

  // Zone vide pour la porte
  if (avecPorte && h < hPorte && abs(c - milieu) < lPorte/2.0) 
    return true;

  // Zone vide pour les meurtrières (au milieu du mur)
  if (c == milieu) {
    int start = (avecPorte) ? max(debutCre, hPorte + 1) : debutCre;
    
    for (int i = 0; i < nbCre; i++) {
      
      int base = start + i * (hCre + espaceCre);
      
      if (h >= base && h < base + hCre && h < nbEtages - 2) 
        return true;
        
    }
  }

  // Crée les créneaux sur le dernier étage
  if (h >= nbEtages - 2) return (c % 2 == 1);

  return false;
}

//Fonction qui dessine une porte sur l'un des murs de la tour
void dessinerPorte(float largeur, float hauteur, float profondeurMur) {
  fill(60, 40, 20); 
  pushMatrix();
  translate(0, -hauteur/2, profondeurMur/2 + 1); 
  box(largeur, hauteur, 5); 
  popMatrix();
}
