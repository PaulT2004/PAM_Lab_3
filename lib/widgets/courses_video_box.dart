import 'package:flutter/material.dart';

class CoursesVideoBox extends StatelessWidget {
  const CoursesVideoBox({super.key});

  @override
  Widget build(BuildContext context) {
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

            child: Image.asset(
              'assets/images/video.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            width: 60,
            height: 60,

            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.play_arrow,
              color: Colors.orange,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}