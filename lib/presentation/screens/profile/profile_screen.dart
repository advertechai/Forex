import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_size.dart';
import '../../widgets/custom_appbar.dart';
import 'widgets/custom_svgicon_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String path = '/profilescreen';
  static const String name = 'profilescreen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String support = 'http://forexstrategy.info/';
  final String instr = 'https://telegra.ph/Instrukciya-11-08-16';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraundColor,
      body: Column(
        children: [
          CustomAppBar(
              leftIconPath: '',
              rightIconPath: '',
              title: 'Профиль',
              onLeftIconPressed: () {},
              onRightIconPressed: () {}),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Имя Пользователя',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.floatButtonColor,
                      ),
                    ),
                    Text(
                      'Email пользователя',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[850],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse(instr));
                  },
                  child: Container(
                    width: AppSize.myWidth(context) * 0.45,
                    height: AppSize.myHeight(context) * 0.15,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(6),
                          width: AppSize.myWidth(context) * 0.1,
                          height: AppSize.myHeight(context) * 0.04,
                          child: SvgPicture.asset('assets/icons/file.svg'),
                        ),
                        const Text(
                          'Инструкции',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.floatButtonColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Подробная инструкция для пользователя',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse(support));
                  },
                  child: Container(
                    width: AppSize.myWidth(context) * 0.45,
                    height: AppSize.myHeight(context) * 0.15,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(6),
                          width: AppSize.myWidth(context) * 0.1,
                          height: AppSize.myHeight(context) * 0.04,
                          child: SvgPicture.asset('assets/icons/file.svg'),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Тех Поддержка',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.floatButtonColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Обратиться в клиент-сервис на нашем сайте',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppSize.myWidth(context),
            height: AppSize.myWidth(context) * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconButton(
                  iconData: 'assets/icons/settings.svg',
                  text: 'Изменить профиль',
                  onTap: (() {}),
                ),
                CustomIconButton(
                    iconData: 'assets/icons/add_chart.svg',
                    text: 'Мои стратегии',
                    onTap: () {}),
                CustomIconButton(
                  iconData: 'assets/icons/logout.svg',
                  text: 'Вход',
                  onTap: () => _showAuthModal(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showAuthModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 20),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.floatButtonColor,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.login), text: 'Вход'),
                      Tab(
                          icon: Icon(Icons.app_registration),
                          text: 'Регистрация'),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                _buildLoginView(),
                _buildRegistrationView(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginView() {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Введите ваш email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textCommon),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon:
                    const Icon(Icons.email, color: AppColors.floatButtonColor),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
                hintText: 'Введите ваш пароль',
                filled: true,
                fillColor: AppColors.backgraundColor,
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.floatButtonColor),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textCommon),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TO DO
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.floatButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
              ),
              child: const Text(
                'Войти',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationView() {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Введите ваш email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textCommon),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon:
                    const Icon(Icons.email, color: AppColors.floatButtonColor),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
                hintText: 'Введите ваш пароль',
                filled: true,
                fillColor: AppColors.backgraundColor,
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.floatButtonColor),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textCommon),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите пароль';
                }
                if (value.length < 6) {
                  return 'Пароль должен быть длиннее 6 символов';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Подтвердите пароль',
                hintText: 'Подтвердите ваш пароль',
                filled: true,
                fillColor: AppColors.backgraundColor,
                prefixIcon: const Icon(Icons.lock_outline,
                    color: AppColors.floatButtonColor),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textCommon),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.textCommon, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, подтвердите пароль';
                }
                if (value != passwordController.text) {
                  return 'Пароли не совпадают';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.floatButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
