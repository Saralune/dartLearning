import 'dart:math';

class Joueur {
  var score = 0;

  partieGagnee() {
    score += 30;
  }

  partiePerdue() {
    score = score - min(score, 30);
  }
}
