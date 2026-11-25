import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final Map<String, dynamic> data;

  const HeaderHome({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final homeData = data['homePage'];
    final headerData = homeData['header'];

    final greeting = headerData['greeting'];
    final subtitle = headerData['subtitle'];
    final avatarUrl = headerData['avatarUrl'];

    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.blue,

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  greeting,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            Container(
              width: 60,
              height: 60,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),

                child: Image.network(
                  avatarUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.blue,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}