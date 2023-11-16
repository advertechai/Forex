import 'package:equatable/equatable.dart';

class Strategy extends Equatable {
  final String artImage;
  final String article;
  final String author;
  final List<String> currencyPair;
  final String exImage;
  final String example;
  final String exampleTitle;
  final List<String> timeOfStr;
  final String time;
  final String title;
  final String userCaseText;
  final String userCaseTitle;
  final String userCaseImg1;
  final String userCaseImg2;
  final String userCaseImg3;

  const Strategy({
    required this.userCaseText,
    required this.userCaseTitle,
    required this.userCaseImg1,
    required this.userCaseImg2,
    required this.userCaseImg3,
    required this.artImage,
    required this.article,
    required this.author,
    required this.currencyPair,
    required this.exImage,
    required this.example,
    required this.exampleTitle,
    required this.timeOfStr,
    required this.time,
    required this.title,
  });

  @override
  List<Object> get props {
    return [
      userCaseText,
      userCaseTitle,
      userCaseImg1,
      userCaseImg2,
      userCaseImg3,
      artImage,
      article,
      author,
      currencyPair,
      exImage,
      example,
      exampleTitle,
      timeOfStr,
      time,
      title,
    ];
  }

  Strategy copyWith({
    String? userCaseText,
    String? userCaseTitle,
    String? userCaseImg1,
    String? userCaseImg2,
    String? userCaseImg3,
    String? artImage,
    String? article,
    String? author,
    List<String>? currencyPair,
    String? exImage,
    String? example,
    String? exampleTitle,
    List<String>? timeOfStr,
    String? time,
    String? title,
  }) {
    return Strategy(
      userCaseText: userCaseText ?? this.userCaseText,
      userCaseTitle: userCaseTitle ?? this.userCaseTitle,
      userCaseImg1: userCaseImg1 ?? this.userCaseImg1,
      userCaseImg2: userCaseImg2 ?? this.userCaseImg2,
      userCaseImg3: userCaseImg3 ?? this.userCaseImg3,
      artImage: artImage ?? this.artImage,
      article: article ?? this.article,
      author: author ?? this.author,
      currencyPair: currencyPair ?? this.currencyPair,
      exImage: exImage ?? this.exImage,
      example: example ?? this.example,
      exampleTitle: exampleTitle ?? this.exampleTitle,
      timeOfStr: timeOfStr ?? this.timeOfStr,
      time: time ?? this.time,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userCaseText': userCaseText,
      'userCaseTitle': userCaseTitle,
      'userCaseImg1': userCaseImg1,
      'userCaseImg2': userCaseImg2,
      'userCaseImg3': userCaseImg3,
      'art_image': artImage,
      'article': article,
      'author': author,
      'currency_pair': currencyPair,
      'ex_image': exImage,
      'example': example,
      'example_title': exampleTitle,
      'time_of_str': timeOfStr,
      'time': time,
      'title': title,
    };
  }

  factory Strategy.fromMap(Map<String, dynamic> map) {
    return Strategy(
      userCaseText: map['userCaseText'] as String? ?? 'default_userCaseText',
      userCaseTitle: map['userCaseTitle'] as String? ?? 'default_userCaseTitle',
      userCaseImg1: map['userCaseImg1'] as String? ?? 'default_userCaseImg1',
      userCaseImg2: map['userCaseImg2'] as String? ?? 'default_userCaseImg2',
      userCaseImg3: map['userCaseImg3'] as String? ?? 'default_userCaseImg3',
      artImage: map['art_image'] as String? ?? 'default_image.png',
      article: map['article'] as String? ?? 'default_article',
      author: map['author'] as String? ?? 'default_author',
      currencyPair:
          (map['currency_pair'] as List<dynamic>?)?.cast<String>() ?? [],
      exImage: map['ex_image'] as String? ?? 'default_ex_image.png',
      example: map['example'] as String? ?? 'default_example',
      exampleTitle: map['example_title'] as String? ?? 'default_example_title',
      timeOfStr: (map['time_of_str'] as List<dynamic>?)?.cast<String>() ?? [],
      time: map['time'] as String? ?? 'default_time',
      title: map['title'] as String? ?? 'default_title',
    );
  }
}
