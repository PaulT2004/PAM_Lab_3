import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_data_cubit.dart';
import '../cubit/app_data_state.dart';

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
        child: BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            if (state is AppDataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is AppDataEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            }

            if (state is AppDataError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            }

            if (state is AppDataSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderCourses(data: state.data),
                    CoursesVideoBox(data: state.data),
                    VideoDescription(data: state.data),
                    VideoSection(data: state.data),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}