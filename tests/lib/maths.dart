double calculPuissance(double nombre, double exposant) {
  if (exposant == 0) {
    return 1;
  } else if (exposant < 0) {
    return 1 / calculPuissance(nombre, -exposant);
  } else {
    return nombre * calculPuissance(nombre, exposant - 1);
  }
}
