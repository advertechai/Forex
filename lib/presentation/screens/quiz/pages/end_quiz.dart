import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../data/datasources/remoute/api_service.dart';
import '../../home/home_screen.dart';
import '../cubit/cubit/quiz_cubit.dart';

class EndQuiz extends StatefulWidget {
  const EndQuiz({super.key});

  @override
  State<EndQuiz> createState() => _EndQuizState();
}

class _EndQuizState extends State<EndQuiz> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final Uri _url =
      Uri.parse('https://telegra.ph/Politika-konfidencialnosti-11-02-3');

  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28)),
              ),
              width: AppSize.myWidth(context),
              height: AppSize.myHeight(context) * 0.2,
              child: Container(
                margin: const EdgeInsets.all(30),
                child: const Text(
                  'Поздравляем! Наше Приложение дарит вам бесплатное обучение по трейдингу!',
                  style: TextStyle(
                      color: AppColors.floatButtonColor,
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Оставьте свои контактные данные, чтобы получить обучение. После регистрации обязательно возьмите трубку, эксперт по трейдингу с вами свяжется. ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.floatButtonColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      validator: validateName,
                      decoration: InputDecoration(
                        labelText: 'Введите имя',
                        hintText: 'Имя',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.floatButtonColor,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        labelStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: surnameController,
                      validator: validateName,
                      decoration: InputDecoration(
                        labelText: 'Введите фамилию',
                        hintText: 'Фамилия',
                        hintStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        labelStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.floatButtonColor,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        labelText: 'Введите почту',
                        hintText: 'Почта',
                        hintStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        labelStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: AppColors.floatButtonColor,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: validatePhone,
                      decoration: InputDecoration(
                        labelText: 'Введите телефон',
                        hintText: '+7XXXXXXXXXX',
                        hintStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        labelStyle:
                            const TextStyle(color: AppColors.floatButtonColor),
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: AppColors.floatButtonColor,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: AppColors.floatButtonColor,
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontSize: 14.0),
                        children: <TextSpan>[
                          const TextSpan(text: 'С '),
                          TextSpan(
                            text: 'политикой конфиденциальности',
                            style: const TextStyle(
                              color: AppColors.floatButtonColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchUrl;
                              },
                          ),
                          const TextSpan(text: ' ознакомлен(а).'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isChecked ? AppColors.floatButtonColor : Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: _isChecked
                  ? () async {
                      if (_formKey.currentState!.validate()) {
                        await markAsCompleted();
                        context.goNamed(HomeScreen.name);
                        context.read<QuizCubit>().saveQuizResults();
                        await saveName(nameController.text);
                        await saveSurname(surnameController.text);
                        await saveEmail(emailController.text);
                        await savePhone(phoneController.text);
                        sendRequest();
                      }
                    }
                  : null,
              child: const Text(
                'Получить бесплатное обучение',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле обязательно для заполнения';
    }
    if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
      return 'Только буквы допустимы';
    }
    return null;
  }

// Функция для проверки почты
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле обязательно для заполнения';
    }
    if (!RegExp(r'^[^@]+@[^@]{2,}\.[^@]{2,}$').hasMatch(value)) {
      return 'Неверный формат почты';
    }
    return null;
  }

// Функция для проверки телефона
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле обязательно для заполнения';
    }
    if (!RegExp(r'^\+[78]\d{10}$').hasMatch(value)) {
      return 'Формат номера: +7XXXXXXXXXX или +8XXXXXXXXXX';
    }
    return null;
  }

  Future<void> saveName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  Future<void> saveSurname(String surname) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('surname', surname);
  }

  Future<void> saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<void> savePhone(String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
  }

  Future<void> markAsCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedQuiz', true);
  }
}
