import 'package:flutter/material.dart';
import '../pages/courses.dart';

class CoursesSection extends StatelessWidget {
  final Map<String, dynamic> data;

  const CoursesSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final homeData = data['homePage'];
    final promptData = homeData['learningPrompt'];

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
                Positioned(
                  left: 15,
                  top: 15,
                  child: SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(
                      promptData['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                      child: Image.network(
                        promptData['imageUrl'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.image,
                            color: Colors.grey,
                          );
                        },
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
                    child: Text(promptData['actionLabel']),
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