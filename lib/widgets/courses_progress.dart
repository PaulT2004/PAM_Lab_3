import 'package:flutter/material.dart';

class CoursesProgress extends StatelessWidget {
  const CoursesProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Learning Plan',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),



        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
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
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: CircularProgressIndicator(
                      value: 40 / 48,
                      strokeWidth: 5,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Packaging Design',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '40',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '/48',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: CircularProgressIndicator(
                      value: 6 / 24,
                      strokeWidth: 5,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Product Design',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '6',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '/24',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}