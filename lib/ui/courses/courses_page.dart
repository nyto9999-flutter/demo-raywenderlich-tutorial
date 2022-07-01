import 'package:fetching_network_data/repository/course_repository.dart';
import 'package:fetching_network_data/state/filter_state_container.dart';
import 'package:fetching_network_data/ui/course_details/course_details_page.dart';
import 'package:flutter/material.dart';
import '../../model/course.dart';
import 'courses_controller.dart';
import '../../ui/course_details/image_container.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepository());
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(state.filterValue),
        builder: (context, snapshot) {
          final courses = snapshot.data;
          if (courses == null ||
              (snapshot.connectionState != ConnectionState.done)) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int position) {
              return _buildRow(courses[position]);
            },
          );
        });
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(course.name, style: const TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(
          course.domainString,
        ),
        onTap: () {
          Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(
            builder: (context) => CourseDetailPage(course: course),
          ));
        },
        trailing: Hero(
          tag: 'cardArtwork-${course.courseId}',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ImageContainer(
              url: course.artworkUrl,
              width: 70.0,
              height: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
