import 'package:flutter/material.dart';

class VideoSection extends StatefulWidget {
  final Map<String, dynamic> data;

  const VideoSection({
    super.key,
    required this.data,
  });

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  String selectedTab = 'lessons';
  bool isEnrolled = false;
  int selectedLessonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final coursePage = widget.data['courseOverviewPage'];
    final course = coursePage['course'];

    final tabs = course['tabs']['items'] as List;

    final lessonsTab = tabs.firstWhere(
          (tab) => tab['id'] == 'lessons',
    )['label'] as String;

    final descriptionTab = tabs.firstWhere(
          (tab) => tab['id'] == 'description',
    )['label'] as String;

    final lessons = course['lessons'] as List;
    final description = course['description']['text'];

    final actions = coursePage['actions'];
    final price = actions['price'];
    final enroll = actions['enroll'];

    return Column(
      children: [
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 'lessons';
                });
              },
              child: Text(
                lessonsTab,
                style: TextStyle(
                  color: selectedTab == 'lessons'
                      ? Colors.orange
                      : Colors.grey,
                  fontSize: 20,
                  fontWeight: selectedTab == 'lessons'
                      ? FontWeight.bold
                      : FontWeight.normal,
                  decoration: selectedTab == 'lessons'
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),

            const SizedBox(width: 80),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 'description';
                });
              },
              child: Text(
                descriptionTab,
                style: TextStyle(
                  color: selectedTab == 'description'
                      ? Colors.orange
                      : Colors.grey,
                  fontSize: 20,
                  fontWeight: selectedTab == 'description'
                      ? FontWeight.bold
                      : FontWeight.normal,
                  decoration: selectedTab == 'description'
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        if (selectedTab == 'lessons')
          SizedBox(
            height: 275,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: lessons.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                final lesson = lessons[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLessonIndex = index;
                    });
                  },
                  child: _videoItem(
                    lesson['title'],
                    lesson['duration'],
                    selectedLessonIndex == index,
                    lesson['playIconUrl'],
                    lesson['arrowIconUrl'],
                  ),
                );
              },
            ),
          )
        else
          SizedBox(
            height: 275,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
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
                child: Text(
                  price['label'],
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: GestureDetector(
                  onTap: enroll['enabled'] && !isEnrolled
                      ? () {
                    setState(() {
                      isEnrolled = true;
                    });
                  }
                      : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: isEnrolled
                          ? Colors.green
                          : enroll['enabled']
                          ? Colors.orange
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        isEnrolled ? 'Enrolled' : enroll['label'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
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
      String title,
      String duration,
      bool selected,
      String playIconUrl,
      String arrowIconUrl,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: selected ? Colors.orange : Colors.white,
              shape: BoxShape.circle,
              border: selected
                  ? null
                  : Border.all(
                color: Colors.red,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Image.network(
                playIconUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.play_arrow,
                    color: selected ? Colors.white : Colors.red,
                    size: 30,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  '$duration min',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Image.network(
            arrowIconUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.chevron_right,
                color: Colors.orange,
                size: 32,
              );
            },
          ),
        ],
      ),
    );
  }
}