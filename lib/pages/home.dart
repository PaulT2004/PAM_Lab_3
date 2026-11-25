import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_data_cubit.dart';
import '../cubit/app_data_state.dart';

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
      body: BlocBuilder<AppDataCubit, AppDataState>(
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
                  HeaderHome(data: state.data),
                  TimeBox(data: state.data),
                  CoursesSection(data: state.data),
                  CoursesProgress(data: state.data),
                  MeetupBox(data: state.data),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}