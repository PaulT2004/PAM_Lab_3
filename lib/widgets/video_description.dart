import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  final Map<String, dynamic> data;

  const VideoDescription({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final coursePage = data['courseOverviewPage'];
    final course = coursePage['course'];

    final title = course['title'];
    final duration = course['duration'];
    final lessonCount = course['lessonCount'];
    final rating = course['rating'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.grey,
                size: 18,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  '$duration · $lessonCount videos',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 16,
                    ),

                    const SizedBox(width: 3),

                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}