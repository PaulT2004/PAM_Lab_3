import 'package:flutter/material.dart';

class CoursesVideoBox extends StatelessWidget {
  final Map<String, dynamic> data;

  const CoursesVideoBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final coursePage = data['courseOverviewPage'];
    final course = coursePage['course'];
    final hero = course['hero'];

    final imageUrl = hero['imageUrl'];
    final playIconUrl = hero['playIconUrl'];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),
          ),

          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.network(
                playIconUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.play_arrow,
                    color: Colors.orange,
                    size: 35,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}