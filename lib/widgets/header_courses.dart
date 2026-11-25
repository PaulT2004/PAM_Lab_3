import 'package:flutter/material.dart';

class HeaderCourses extends StatelessWidget {
  final Map<String, dynamic> data;

  const HeaderCourses({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final coursePage = data['courseOverviewPage'];
    final navigation = coursePage['navigation'];

    final title = navigation['title'];
    final backIconUrl = navigation['backIconUrl'];

    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.network(
              backIconUrl,
              width: 24,
              height: 24,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}