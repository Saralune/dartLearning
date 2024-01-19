import 'package:flutter_test/flutter_test.dart';
import 'package:tests/model/joueur.dart';

void main() {
  //fonction exécutée avant chacun des tests -> setUpAll exécutée qu'une fois
  setUp(() {});

  //fonction exécutée après chacun des tests -> tearDownAll exécutée qu'une fois
  tearDown(() {});

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

  group('Partie', () {
    setUpAll(() {}); //uniquement appelé dans le group

    tearDownAll(() {}); //uniquement appelé dans le group

    test('Test Partie Gagnée', () {
      final j1 = Joueur();

      expect(j1.score, 0);
      j1.partieGagnee();
      expect(j1.score, 30);
    });

    test('Test Partie Perdue', () {});
  });
}
