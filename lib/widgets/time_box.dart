import 'package:flutter/material.dart';
import '../pages/courses.dart';

class TimeBox extends StatelessWidget {
  final Map<String, dynamic> data;

  const TimeBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final homeData = data['homePage'];
    final learnedToday = homeData['learnedToday'];
    final myCourses = homeData['myCourses'];

    final learnedMinutes = learnedToday['learnedMinutes'];
    final goalMinutes = learnedToday['goalMinutes'];
    final progress = (learnedToday['progress'] as num).toDouble();

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                learnedToday['title'],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoursesPage(),
                    ),
                  );
                },
                child: Text(
                  myCourses['title'],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$learnedMinutes min',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '/ $goalMinutes min',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}