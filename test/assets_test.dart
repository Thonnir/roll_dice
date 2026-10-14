import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (var face = 1; face <= 6; face++) {
    test('dice-$face.png is a registered asset', () async {
      final data = await rootBundle.load('assets/images/dice-$face.png');

      expect(data.lengthInBytes, greaterThan(0));
    });
  }
}
