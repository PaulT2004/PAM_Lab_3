import 'package:flutter/material.dart';

class CoursesProgress extends StatelessWidget {
  final Map<String, dynamic> data;

  const CoursesProgress({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final homeData = data['homePage'];
    final planData = homeData['learningPlan'];
    final items = planData['items'] as List;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            planData['title'],
            style: const TextStyle(
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
              for (int i = 0; i < items.length; i++) ...[
                Row(
                  children: [
                    Image.network(
                      items[i]['progressIconUrl'],
                      width: 35,
                      height: 35,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.show_chart,
                          size: 35,
                          color: Colors.grey,
                        );
                      },
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        items[i]['title'],
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Text(
                      '${items[i]['completed']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      '/${items[i]['total']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                if (i < items.length - 1)
                  const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ],
    );
  }
}