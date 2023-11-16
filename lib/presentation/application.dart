import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forex/presentation/screens/glossary/cubit/glossary_cubit.dart';
import 'package:forex/presentation/screens/strategy/cubit/stratagy_cubit.dart';

import 'navigation/navigation.dart';
import 'screens/quiz/cubit/cubit/quiz_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlossaryCubit>(
          create: (BuildContext context) => GlossaryCubit(),
        ),
        BlocProvider<QuizCubit>(
          create: (BuildContext context) => QuizCubit(),
        ),
        BlocProvider<StratagyCubit>(
          create: (BuildContext context) => StratagyCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ru', 'RU'),
        routerConfig: Navigation.router,
      ),
    );
  }
}
