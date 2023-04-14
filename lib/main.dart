import 'package:app_foodtrunck/models/pedido.dart';
import 'package:app_foodtrunck/models/fechar_pedidos_itens.dart';
import 'package:app_foodtrunck/models/lista_produtos.dart';
import 'package:app_foodtrunck/utils/app_routes.dart';
import 'package:app_foodtrunck/views/pedido_view.dart';
import 'package:app_foodtrunck/views/fechar_pedido_view.dart';
import 'package:app_foodtrunck/views/produto_detale_view.dart';
import 'package:app_foodtrunck/views/produtos_view.dart';
import 'package:flutter/material.dart';
import 'package:app_foodtrunck/views/produtos_geral_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListaProdutos()),
        ChangeNotifierProvider(create: (_) => Pedido()),
        ChangeNotifierProvider(create: (_) => FecharPedidoItens()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // ignore: prefer_const_constructors
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: const Color.fromARGB(255, 223, 86, 5),
            onPrimary: const Color.fromARGB(255, 255, 255, 255),
            secondary: const Color.fromARGB(255, 143, 24, 0),
            onSecondary: const Color.fromARGB(255, 70, 186, 105),
            error: Colors.white,
            onError: const Color.fromARGB(255, 143, 24, 0),
            background: const Color.fromARGB(255, 60, 46, 33),
            onBackground: const Color.fromARGB(255, 60, 46, 33),
            surface: Color.fromARGB(255, 94, 72, 60),
            onSurface: Colors.white,
          ),

          // Define the default font family.
          fontFamily: 'Lato',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 24, fontFamily: 'Lato-Bold'),
            bodyMedium: TextStyle(
                fontSize: 20, fontFamily: 'Lato', color: Colors.white),
            bodySmall: TextStyle(
                fontSize: 20, fontFamily: 'Lato', color: Colors.black),
          ),
        ),
        //home: ProdutosGeralView(),
        routes: {
          AppRoutes.PRODUTO_DETALHES: (context) => const ProdutoDetalheView(),
          AppRoutes.PEDIDO: (context) => const PedidoView(),
          AppRoutes.HOME: (context) => ProdutosGeralView(),
          AppRoutes.FECHAR_PEDIDO: (context) => const FecharPedidoView(),
          AppRoutes.PRODUTOS: (context) => const ProdutosView(),
        },
      ),
    );
  }
}
