import 'package:flutter/material.dart';
import '../pages/courses.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: [

          Container(
            width: screenWidth * 0.66,
            height: 180,
            margin: const EdgeInsets.only(left: 20),

            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Stack(
              children: [

                const Positioned(
                  left: 15,
                  top: 15,

                  child: Text(
                    'What do you want to learn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  right: 15,
                  top: 40,

                  child: Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      child: Image.asset(
                        'assets/images/course_1.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  bottom: 15,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CoursesPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),

                    child: const Text('Get Started'),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: screenWidth * 0.66,
            height: 180,

            margin: const EdgeInsets.only(
              left: 15,
              right: 20,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: Image.asset(
                'assets/images/course_2.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}