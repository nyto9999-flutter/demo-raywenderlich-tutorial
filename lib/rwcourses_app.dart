import 'package:fetching_network_data/strings.dart';
import 'package:fetching_network_data/ui/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/courses/courses_page.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Navigator.of(context).push<MaterialPageRoute>(
              MaterialPageRoute(builder: (context) => const FilterPage()),
            ),
          )
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
