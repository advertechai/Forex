import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/presentation/widgets/custom_appbar.dart';

import 'cubit/glossary_cubit.dart';

class GlossaryPage extends StatefulWidget {
  static const String path = '/glossary';
  static const String name = 'Glossary';

  const GlossaryPage({
    super.key,
  });

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlossaryCubit, GlossaryState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                leftIconPath: '',
                rightIconPath: '',
                title: 'Глоссарий',
                onLeftIconPressed: () {},
                onRightIconPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Поиск',
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.backgraundSecondColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      context.read<GlossaryCubit>().updateSearchQuery(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.filteredTerms.length,
                  itemBuilder: (context, index) {
                    final term = state.filteredTerms[index];
                    return ListTile(
                      title: Text(
                        term.term,
                        style: TextStyle(
                            color: AppColors.floatButtonColor,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        term.definition,
                        style: TextStyle(
                            color: AppColors.textCommon,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
