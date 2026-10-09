import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Videos',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),

            const SizedBox(width: 80),

            const Text(
              'Description',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 275,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [

              _videoItem(
                'Introduction to React',
                '04:28 min',
                true,
              ),

              const SizedBox(height: 20),

              _videoItem(
                'Understanding React',
                '06:12 min',
                false,
              ),

              const SizedBox(height: 20),

              _videoItem(
                'Create first React project',
                '43:58 min',
                false,
              ),

              const SizedBox(height: 20),

              _videoItem(
                'Build React',
                '12:06 min',
                false,
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.orange,
                  ),
                ),

                child: const Text(
                  'Free',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 11,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: const Center(
                    child: Text(
                      'Enroll Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _videoItem(
      String location,
      String duration,
      bool selected,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [

          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: selected
                  ? Colors.orange
                  : Colors.white,
              shape: BoxShape.circle,
              border: selected
                  ? null
                  : Border.all(
                color: Colors.red,
              ),
            ),

            child: Icon(
              Icons.play_arrow,
              color: selected
                  ? Colors.white
                  : Colors.red,
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: Colors.orange,
            size: 32,
          ),
        ],
      ),
    );
  }
}