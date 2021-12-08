import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/bmi/bmi_screen.dart';
import 'providers/providers.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
        ChangeNotifierProvider<providerChange>(create: (context) => providerChange(),)
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );

  }
}