import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solusi_digital_flutter_test/view/home_view.dart';
import 'package:solusi_digital_flutter_test/view_model/news_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsViewModel>(
      create: (_) => NewsViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeView(),
      ),
    );
  }
}