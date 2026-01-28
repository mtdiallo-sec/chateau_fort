/* 
  C'est le fichier principal du projet, dans lequel on appele la fonction de création du sol, 
  la création du Chateau, la gestion de la caméra avec la souris pour la visualisation du Chateau.
*/

void setup() {
  size(1200, 800, P3D);
}

void draw() {
  background(135, 206, 235); // Couleur du ciel
  
  // Éclairage global
  ambientLight(160, 160, 160); 
  directionalLight(255, 255, 240, 0.5, 1, -0.5); 
  directionalLight(100, 100, 130, -0.5, 0.5, 0.5);

  cameraSetup(); // Applique la position de vue
  
  dessinerSol(); // Affiche la pelouse
  
  //Construction du Chateau
  construireChateau(DISTANCE_ENTRE_TOURS, LARGEUR_TOUR, HAUTEUR_TOUR);
}

//GESTION DE LA VUE
void cameraSetup() {
  // Calcule la position X,Y,Z de la caméra
  float camX = zoomer * cos(rotX) * sin(rotY);
  float camY = zoomer * sin(rotX); 
  float camZ = zoomer * cos(rotX) * cos(rotY);

  // Définit la position de l'oeil et le point visé
  camera(camX, camY, camZ, 0, -HAUTEUR_TOUR/2 + 100, 0, 0, 1, 0);
}


//CONTRÔLES SOURIS

void mouseDragged() {
  if (mouseButton == LEFT) { 
    rotY += (mouseX - pmouseX) * 0.02; // Tourne autour du château
    rotX -= (mouseY - pmouseY) * 0.02; // Monte/descend la vue
    rotX = constrain(rotX, minRotX, maxRotX); // Bloque la vue au sol
  }
}

void mouseWheel(MouseEvent event) {
  zoomer += event.getCount() * 30; // Rapproche ou éloigne
  zoomer = constrain(zoomer, minZoom, maxZoom); 
}
