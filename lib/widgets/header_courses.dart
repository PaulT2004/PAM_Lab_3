import 'package:flutter/material.dart';

class HeaderCourses extends StatelessWidget {
  const HeaderCourses({super.key});

  @override
  Widget build(BuildContext context) {
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

            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 10),

          const Text(
            'Course Overview',
            style: TextStyle(
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