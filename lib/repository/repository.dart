import 'package:fetching_network_data/model/course.dart';

abstract class Repository {
  Future<List<Course>> getCourses(int domainFilter);
}
