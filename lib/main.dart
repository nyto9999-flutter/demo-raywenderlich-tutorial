import 'package:flutter/material.dart';
import 'package:fetching_network_data/rwcourses_app.dart';
import 'package:fetching_network_data/strings.dart';

void main() => runApp(MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: const RWCoursesApp(),
    ));
