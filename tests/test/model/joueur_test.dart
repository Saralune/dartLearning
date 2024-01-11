import 'package:flutter_test/flutter_test.dart';
import 'package:tests/model/joueur.dart';

void main() {
  test('Test Partie Jouée', () {
    final j1 = Joueur();

    expect(j1.score, 0);
    j1.partieGagnee();
    expect(j1.score, 30);
    j1.partiePerdue();
    expect(j1.score, 0);
    j1.partiePerdue();
    expect(j1.score, 0);
    j1.partieGagnee();
    expect(j1.score, 30);
    j1.partieGagnee();
    expect(j1.score, 60);
    j1.partiePerdue();
    expect(j1.score, 30);
  });
}
