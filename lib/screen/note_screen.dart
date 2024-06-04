// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_models.dart';
import 'package:self_blog/widgets/bacl_bar.dart';
import 'package:self_blog/widgets/entry_box.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/standard_spacer.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({super.key, required this.note});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: backGroundGradient,
      isCentered: true,
      isInSafeArea: true,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      body: Column(
        children: [
          const BackBar(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  widget.note.date,
                  style: titleTextStyle,
                ),
              ],
            ),
          ),
          const StandardSpacer(height: standartSpacerHeight),
          Expanded(
            child: ListView.builder(
              itemCount: widget.note.entries.length,
              itemBuilder: (context, index) {
                return EntryBox(note: widget.note, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
