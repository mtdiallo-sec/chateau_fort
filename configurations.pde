/*
  Dans ce fichier il y'a toutes les configurations qui ont servi à construire le Chateau Fort,
  à la visualisation du chateau sur tous les angles.
*/


// Dimensions générales du Chateau
float DISTANCE_ENTRE_TOURS = 450;  // Distance entre les tours principales
float LARGEUR_TOUR = 180;          // Largeur d'une tour
float HAUTEUR_TOUR = 350;          // Hauteur d'une tour
float MARGE_MUR_EXTERIEUR = 200;   // Marge entre tours et mur d'enceinte

// Dimensions mur d'enceinte
float EPAISSEUR_MUR = 25;       
float RAPPORT_HAUTEUR_MUR = 0.5;  // Hauteur du mur par rapport à la hauteur de la tour

// Dimensions du sol
float SOL_LARGEUR = 5000;
float SOL_PROFONDEUR = 5000;


// Paramètres des briques
float BRIQUE_LARGEUR = 8;
float BRIQUE_HAUTEUR = 10;
float BRIQUE_PROFONDEUR = 15;

// Paramètres porte et créneaux
int HAUTEUR_PORTE_BRIQUES = 8;
int LARGEUR_PORTE_BRIQUES = 4;
int NB_CRENEAUX = 3;
int HAUTEUR_CRENEAUX = 3;
int DEBUT_CRENEAUX = 12;
int ESPACE_CRENEAUX = 2;

// Toit
float HAUTEUR_TOIT = 70;


// -- Camera
float zoomer = 1200;
float rotY = 0;
float rotX = -PI/6;      // Angle de départ
float minRotX = -PI/2.1; // Limite haut
float maxRotX = -0.05;   // Limite bas 
float minZoom = 100;
float maxZoom = 1500;
