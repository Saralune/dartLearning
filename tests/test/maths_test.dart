import 'package:flutter_test/flutter_test.dart';
import 'package:tests/maths.dart';

main() {
  test('Test CalculPuissance', () {
    final result = calculPuissance(4, 2);
    expect(result, 16);
    expect(calculPuissance(3, 4), 81);
    expect(calculPuissance(3, 0), 1);
    expect(calculPuissance(3, -1), closeTo(0.333, 0.001));
  });
}
