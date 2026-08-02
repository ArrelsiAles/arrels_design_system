import 'package:arrels_design_system_flutter/arrels_design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      theme: ArrelsTheme.light(),
      darkTheme: ArrelsTheme.dark(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('ArrelsButton renders its label and reacts to taps', (
    tester,
  ) async {
    var tapped = false;
    await tester.pumpWidget(
      wrap(ArrelsButton(label: 'Desa', onPressed: () => tapped = true)),
    );

    expect(find.text('Desa'), findsOneWidget);
    await tester.tap(find.text('Desa'));
    expect(tapped, isTrue);
  });

  testWidgets('ArrelsAlert shows title and message', (tester) async {
    await tester.pumpWidget(
      wrap(
        const ArrelsAlert(
          tone: ArrelsTone.danger,
          title: 'Error',
          message: 'Alguna cosa ha fallat',
        ),
      ),
    );

    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Alguna cosa ha fallat'), findsOneWidget);
  });

  testWidgets('ArrelsBadge renders its label', (tester) async {
    await tester.pumpWidget(
      wrap(const ArrelsBadge(label: 'Actiu', tone: ArrelsBadgeTone.success)),
    );

    expect(find.text('Actiu'), findsOneWidget);
  });

  testWidgets('ArrelsIcon renders the given IconData', (tester) async {
    await tester.pumpWidget(wrap(const ArrelsIcon(LucideIcons.house)));

    expect(find.byIcon(LucideIcons.house), findsOneWidget);
  });
}
