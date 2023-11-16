import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

// Future<String> getAnswersString() async {
//   final prefs = await SharedPreferences.getInstance();
//   final results = <String, String>{};

//   for (String key in prefs.getKeys()) {
//     final String? value = prefs.getString(key);
//     if (value != null) {
//       if (key.startsWith("question_")) {
//         results[key] = value;
//       }
//     }
//   }

//   return results.entries
//       .map((e) => "${e.key.substring(9)} : ${e.value}")
//       .join("\n");
// }

Future<void> sendRequest() async {
  const String apiUrl = "https://api.byteplex.info/api/leads/";
  final Dio dio = Dio();
  final Uuid uuid = Uuid();

  final prefs = await SharedPreferences.getInstance();

  final String res = prefs.getString('quiz_result') ?? '';

  String? domainName = "telegram.me";
  String? email = prefs.getString('email');
  String? firstName = prefs.getString('name');
  String? lastName = prefs.getString('surname');
  String? ip = '192.168.1.1';
  String? phone = prefs.getString('phone');
  int? offer = 913167311906504705;

  final Map<String, dynamic> leadData = {
    "domain_name": domainName,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "ip": ip,
    "phone": phone,
    "offer": offer,
    "click_id": uuid.v1(),
    "answers": res,
  };

  try {
    final Response response = await dio.post(
      apiUrl,
      data: leadData,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    // Проверяем статус ответа
    if (response.statusCode == 201) {
      log("Data sent successfully: ${response.data}");
    } else {
      // Если статус ответа отличается от 201, выводим детальную информацию
      log("HTTP Status Code: ${response.statusCode}");
      log("Failed to send data with status code: ${response.statusCode}");
      if (response.data != null) {
        log("Response data: ${response.data}");
      }
    }
  } on DioError catch (dioError) {
    // DioError может содержать информацию о проблеме
    log("DioError occurred: ${dioError.message}");
    if (dioError.response != null) {
      // Если есть ответ от сервера, выводим его статус и данные
      log("HTTP Status Code: ${dioError.response?.statusCode}");
      log("Failed data: ${dioError.response?.data}");
    }
  } catch (e) {
    // Любые другие ошибки
    log("An unexpected error occurred: $e");
  }
}

class QuizResults {
  final User user;
  final Map<String, String> quiz;

  const QuizResults({
    required this.user,
    required this.quiz,
  });
}

class User {
  final String name;
  final String surname;
  final String email;
  final String phone;

  const User({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
  });
}
