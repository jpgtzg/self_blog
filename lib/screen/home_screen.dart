// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/screen/note_screen.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/note_card.dart';
import 'package:self_blog/widgets/standard_spacer.dart';
import 'package:self_blog/widgets/top_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final notes = getNotes();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      isCentered: true,
      isInSafeArea: true,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      body: Column(
        children: [
          const TopMenuBar(),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    NoteCard(
                      titleText: notes[index].date,
                      widgetScreen: NoteScreen(note: notes[index]),
                      primaryColor: paleteLightBlue.withAlpha(75),
                      buttonColor: paleteLightBlue.withAlpha(150),
                      note: notes[index],
                    ),
                    const StandardSpacer(height: standartSpacerHeight),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
