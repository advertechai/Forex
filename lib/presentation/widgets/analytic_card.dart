import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class AnalCard extends StatelessWidget {
  final List<Map<String, String>> dataList = [
    {
      'imageUrl':
          'https://betafinance.ru/sites/default/files/strategii_forex.jpg',
      'title': 'Торговые стратегии: что это и для чего нужны?',
      'description': 'Как выбрать лучшую трейдинг стратегию в 2023 году',
      'date': '07.11.23',
      'detailUrl':
          'https://forexmq.ru/nachinayushhim-trejderam/torgovaya-strategiya-trejdera',
    },
    {
      'imageUrl':
          'https://livingfo.com/wp-content/uploads/2022/01/kDuKoE6rTqf6dZHTGIfRrsgk9Oe5uPEzUikg9gMg.png',
      'title': 'Как изучать рынок Forex?',
      'description': 'Основные методы анализа рынка Forex.',
      'date': '07.11.23',
      'detailUrl': 'https://alfaforex.ru/faq/glossary/analiz/',
    },
  ];

  AnalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final data = dataList[index];
        return ContentAnalCard(
          imageUrl: data['imageUrl']!,
          title: data['title']!,
          description: data['description']!,
          date: data['date']!,
          detailUrl: data['detailUrl']!,
        );
      },
    );
  }
}

class ContentAnalCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String detailUrl;

  const ContentAnalCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.detailUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              imageUrl,
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  fontFamily: 'Poppins'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 18, right: 18),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              color: AppColors.cardBackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date,
                    style: const TextStyle(
                      color: AppColors.activeTextColor,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse(detailUrl));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Подробнее',
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueAccent),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
