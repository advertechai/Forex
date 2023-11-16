part of 'quiz_cubit.dart';

class QuizState extends Equatable {
  final int currentPage;
  final Map<String, String> result;
  final List<Quiz> questions = const [
    Quiz(
      image: 'assets/images/1.png',
      question: 'Какой ваш возраст?',
      answers: [
        '18-25',
        '25-35',
        '35-45',
        '45+',
      ],
    ),
    Quiz(
      image: 'assets/images/2.png',
      question: 'Ваша финансовая цель?',
      answers: [
        'Обеспечить себя и семью',
        'Создать финансвую подушку на “черный день” ',
        'Благоустросить/купить личное жилье',
        'Быть материально незавсимым',
      ],
    ),
    Quiz(
      image: 'assets/images/3.png',
      question: 'Куда вы планируете потратить первые заработанные деньги?',
      answers: [
        'Погашу кредиты/ипотеку/долги',
        'Куплю то, о чем давно мечтал(а)',
        'На путешествия',
        'Я вложу их снова, чтобы приумножить капитал',
      ],
    ),
    Quiz(
      image: 'assets/images/4.png',
      question: 'Сколько времени вы готовы уделять заработку?',
      answers: [
        'Весь день',
        'Несколько часов в день',
        'Один день в неделю',
        'Один день в месяц',
      ],
    ),
    Quiz(
      image: 'assets/images/5.png',
      question: 'Готовы ли вы вкладывать в свое обучение новой профессии?',
      answers: [
        'Да',
        'Скорее да, чем нет',
        'Скорее нет, чем да',
        'Нет',
      ],
    ),
    Quiz(
      image: 'assets/images/6.png',
      question:
          'Готовы ли вы вкладывать в трейдинг? Ведь, как известно, чтобы что-то получить, необходимо что-то вложить',
      answers: [
        'Да, готов(а)',
        'Я бы хотел(а), но нет уверенности, что у меня получится',
        'Я уже вкладываю и получаю дивиденды',
        'Нет, я не хочу вкладывать',
      ],
    ),
  ];

  const QuizState({
    this.currentPage = 0,
    this.result = const {
      'Какой ваш возраст?': '18-25',
      'Ваша финансовая цель?': 'Обеспечить себя и семью',
      'Куда вы планируете потратить первые заработанные деньги?':
          'Погашу кредиты/ипотеку/долги',
      'Сколько времени вы готовы уделять заработку?': 'Весь день',
      'Готовы ли вы вкладывать в свое обучение новой профессии?': 'Да',
      'Готовы ли вы вкладывать в трейдинг? Ведь, как известно, чтобы что-то получить, необходимо что-то вложить':
          'Да, готов(а)',
    },
  });

  @override
  List<Object> get props => [
        currentPage,
        result,
      ];

  QuizState copyWith({
    int? currentPage,
    Map<String, String>? result,
  }) {
    return QuizState(
      currentPage: currentPage ?? this.currentPage,
      result: result ?? this.result,
    );
  }
}

class Quiz {
  final String image;
  final String question;
  final List<String> answers;

  const Quiz({
    required this.image,
    required this.question,
    required this.answers,
  });
}
