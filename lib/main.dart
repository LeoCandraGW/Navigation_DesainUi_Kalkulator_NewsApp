import 'package:flutter/material.dart';
import 'package:fundamental_flutter/detail_page.dart';
import 'package:fundamental_flutter/list_page.dart';
import 'package:fundamental_flutter/navigation_route.dart';
import 'package:fundamental_flutter/desain_ui.dart';
import 'package:fundamental_flutter/kalkulator.dart';
import 'package:fundamental_flutter/styles.dart';
import 'package:fundamental_flutter/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
       ),
       textTheme: myTextTheme,
       appBarTheme: AppBarTheme(elevation: 0),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          onPrimary: Colors.white,
          textStyle: const TextStyle(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
        ),
       ),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) =>  const FirstScreen(),
        '/secondScreen':(context) => const SecondScreen(),
        '/secondScreenWithData':(context) => SecondScreenWithData(
          ModalRoute.of(context)?.settings.arguments as String
        ),
        '/returnDataScreen':(context) => const ReturnDataScreen(),
        '/replacementScreen':(context) => const ReplacementScreen(),
        '/anotherScreen':(context) => const AnotherScreen(),
        '/designUi':(context) => UiScreen(),
        '/kalkulator':(context) => Kalkulator(),
        '/newsapp':(context) => const NewsListPage(),
        '/articledetailpage':(context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article),
        '/articlewebview':(context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}



