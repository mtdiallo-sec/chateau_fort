/* Ce fichier crée le sol avec la fonction dessinerSol() 
    qui dessine le sol où le Chateau doit être construit
*/

void dessinerSol() {
  pushMatrix();
  fill(20, 80, 20); 
  noStroke();
  rotateX(HALF_PI); 
  rectMode(CENTER);
  rect(0, 0, SOL_LARGEUR, SOL_PROFONDEUR);
  popMatrix();
}
