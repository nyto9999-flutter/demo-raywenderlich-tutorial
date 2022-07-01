import 'package:fetching_network_data/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:fetching_network_data/model/course.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'image_container.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(course.name)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            _buildMain(context),
            _buildDetails(),
            TextButton(
              child: const Text('View Course'),
              onPressed: () => _launchCourse(course.courseId),
            )
          ],
        ));
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'cardArtwork-${course.courseId}',
      child: ImageContainer(
        height: 200,
        url: course.artworkUrl,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            course.name,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24),
          ),
          Text(
            course.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetails() {
    const style = TextStyle(fontSize: 16.0);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              course.contributors,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void _launchCourse(String courseId) async {
    if (!await launchUrlString('https://raywenderlich.com/$courseId')) {
      throw 'Could not launch $courseId';
    }
  }
}
