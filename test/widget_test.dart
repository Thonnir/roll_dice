import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roll_dice/main.dart';

String shownFace(WidgetTester tester) {
  final image = tester.widget<Image>(find.byType(Image));
  return (image.image as AssetImage).assetName;
}

void main() {
  testWidgets('rolling shows only faces 1-6 and eventually all of them', (
    tester,
  ) async {
    await tester.pumpWidget(const RollDiceApp());

    final seen = <String>{};
    for (var roll = 0; roll < 200; roll++) {
      await tester.tap(find.text('Hoď kockou'));
      await tester.pump();
      seen.add(shownFace(tester));
    }

    expect(seen, {
      'assets/images/dice-1.png',
      'assets/images/dice-2.png',
      'assets/images/dice-3.png',
      'assets/images/dice-4.png',
      'assets/images/dice-5.png',
      'assets/images/dice-6.png',
    });
  });
}
