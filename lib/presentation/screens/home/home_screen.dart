import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forex/presentation/screens/glossary/glossary_page.dart';
import 'package:forex/presentation/screens/profile/profile_screen.dart';
import 'package:forex/presentation/screens/strategy/strategy_screen.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_size.dart';
import '../../widgets/advice_card.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/slider_button.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/';
  static const String name = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  int currentIndex = 0;

  final List<Map<String, String>> dataList = [
    {
      'imageUrl': 'assets/images/chart1.avif',
      'title': 'Торговые стратегии: что это и для чего нужны?',
      'description': 'Как выбрать лучшую трейдинг стратегию в 2023 году',
      'date': '06.08.23',
      'detailUrl': 'https://example.com/detail1',
    },
    {
      'imageUrl': 'assets/images/chart2.avif',
      'title': 'Как изучать рынок Forex?',
      'description': 'Основные методы анализа рынка Forex.',
      'date': '07.08.23',
      'detailUrl': 'https://example.com/detail2',
    },
  ];

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraundColor,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  leftIconPath: '',
                  rightIconPath: '',
                  title: 'Советы и Аналитика',
                  onLeftIconPressed: () {},
                  onRightIconPressed: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                const SliderButton(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: AppSize.myHeight(context) * 0.70,
                  child: AdviceCard(),
                ),
              ],
            ),
          ),
          const StrategyScreen(),
          const GlossaryPage(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<String> loadGlossaryJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/glossary.json');
    return jsonString;
  }
}
