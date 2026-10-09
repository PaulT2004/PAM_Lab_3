import 'package:flutter/material.dart';
import '../widgets/header_home.dart';
import '../widgets/time_box.dart';
import '../widgets/courses_section.dart';
import '../widgets/courses_progress.dart';
import '../widgets/meetup_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const HeaderHome(),
          const TimeBox(),
          const CoursesSection(),
          const CoursesProgress(),
          const MeetupBox(),
        ],
      ),
    );
  }
}