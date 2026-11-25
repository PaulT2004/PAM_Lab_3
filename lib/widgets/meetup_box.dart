import 'package:flutter/material.dart';

class MeetupBox extends StatelessWidget {
  final Map<String, dynamic> data;

  const MeetupBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final homeData = data['homePage'];
    final meetupData = homeData['meetup'];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  meetupData['title'],
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  meetupData['subtitle'],
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                meetupData['imageUrl'],
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
        ],
      ),
    );
  }
}