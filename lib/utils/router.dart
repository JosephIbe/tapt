import 'package:flutter/material.dart';

import 'package:flutter_app/common/route_constants.dart';
import 'package:flutter_app/data/models/service_personnel.dart';

import 'package:flutter_app/presentation/journeys/landing.dart';
import 'package:flutter_app/presentation/journeys/screens/home/category_details.dart';
import 'package:flutter_app/presentation/journeys/screens/home/personnel_profile.dart';

class TeamAptRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLiterals.landingRoute:
        return MaterialPageRoute(builder: (_) => const Landing());
      case RouteLiterals.categoryDetailsRoute:
        return MaterialPageRoute(builder: (_) => const CategoryDetailsView());
      case RouteLiterals.personnelProfileRoute:
        var arguments = settings.arguments as ServicePersonnelModel;
        return MaterialPageRoute(builder: (_) => PersonnelProfileView(serviceModel: arguments));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route specified for ${settings.name}'),
              ),
          )
        );
    }
  }
}