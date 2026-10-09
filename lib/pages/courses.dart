import 'package:flutter/material.dart';
import '../widgets/courses_video_box.dart';
import '../widgets/video_description.dart';
import '../widgets/video_section.dart';
import '../widgets/header_courses.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            const HeaderCourses(),
            const CoursesVideoBox(),
            const VideoDescription(),
            const VideoSection(),
          ],
        ),
      ),
    );
  }
}