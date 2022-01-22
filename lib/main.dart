import 'package:flutter/material.dart';
import 'package:flutter_app/utils/router.dart';

import 'presentation/journeys/landing.dart';

void main() {
  runApp(const TeamApt());
}

class TeamApt extends StatelessWidget {
  const TeamApt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamApt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF28C0BD),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF292B4C))
      ),
      onGenerateRoute: TeamAptRouter.generateRoute,
      // initialRoute: '/',
      home: const Scaffold(
        backgroundColor: Colors.white70,
        body: Landing(),
      )
    );
  }

}