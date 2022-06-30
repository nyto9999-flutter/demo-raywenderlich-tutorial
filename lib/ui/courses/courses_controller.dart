import 'package:fetching_network_data/repository/repository.dart';
import 'package:fetching_network_data/repository/course_repository.dart';
import 'package:fetching_network_data/model/course.dart';

class CoursesController {
  final Repository _repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
