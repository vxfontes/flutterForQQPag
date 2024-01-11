import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;


void main(){
  // garantir que o aplicativo rode no emulador antes
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();

    // espera o carregamento do aplicativo
    await tester.pumpAndSettle();

    // buscando itens na tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // clicando no botão de menu
    await tester.tap(find.byIcon(Icons.menu));

    // espera o carregamento do menu
    await tester.pumpAndSettle();

    // buscando itens no menu
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    // testar navegação e tela de tipos
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();

    // buscando itens na tela de tipos
    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);


    // testar criação de tipo de cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    // inserindo texto
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    // verificando se o tipo foi adicionado
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    // retornando na navegação para testar novo cliente
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gerenciar clientes'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();


    // adicionando novo cliente
    await tester.enterText(find.byKey(const Key('NameKey')), 'DandaraBot');
    await tester.enterText(find.byKey(const Key('EmailKey')), 'dandara@bot.com.br');

    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ferro').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

  });

}
