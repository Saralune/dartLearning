import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests/ui/send_email_screen.dart';

main() {
  //le testWidget est un robot qui execute ce qu'on lui passe dedans
  testWidgets("Test email valide", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SendEmailScreen()));
    // find = chercher un widget de type texte
    expect(find.text("Message envoyé"),
        findsNothing); //au lancement de l'app, je ne doit pas retrouver ce texte
    //expect(find.byKey(const Key("email-field")), findsOneWidget);
    //find.byType("IconButton")

    await tester.enterText(find.byKey(const Key("email-field")), "ian@mq.com");
    await tester.tap(find.byType(ElevatedButton));

    //permet un rafraichissement de l'écran après avoir fait les actions
    await tester
        .pump(); //obligatoire pendant les test car pas fait automatiquement
    //await tester
    //    .pumpAndSettle(); //rafaichit l'écran et attend que les animations soient terminées
    expect(find.text("Message envoyé"), findsOneWidget);
  });

  testWidgets("Test email invalide", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SendEmailScreen()));
    expect(find.text("Message envoyé"), findsNothing);

    await tester.enterText(find.byKey(const Key("email-field")), "ian-mq.com");
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text("Email invalide"), findsOneWidget);
  });
}
