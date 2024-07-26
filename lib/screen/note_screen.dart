// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';
import 'package:self_blog/system/user_settings.dart';
import 'package:self_blog/widgets/back_bar.dart';
import 'package:self_blog/widgets/create_entry_button.dart';
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
  void deleteEntry(int index) {
    setState(() {
      updateEntry(() {
        widget.note.entries.removeAt(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradientCall: getPrimaryGradient(),
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
          const StandardSpacer(value: standardSpacerHeight, direction: Direction.vertical,),
          Expanded(
            child: ListView.builder(
              itemCount: widget.note.entries.length,
              itemBuilder: (context, index) {
                return Column(
                  key: ValueKey(widget
                      .note.entries[widget.note.entries.length - index - 1]),
                  children: [
                    EntryBox(
                      note: widget.note,
                      index: widget.note.entries.length - index - 1,
                      parentUpdate: deleteEntry,
                    ),
                    const StandardSpacer(value: standardSpacerHeight, direction: Direction.vertical,),
                  ],
                );
              },
            ),
          ),
          const StandardSpacer(value: standardSpacerHeight, direction: Direction.vertical,),
          CreateEntryButton(
            onTap: () {
              setState(() {
                updateEntry(() {
                  widget.note.entries.add(
                    Entry(DateTime.now().toString().substring(10, 16), "", ""),
                  );
                });
              });
            },
          ),
          const StandardSpacer(value: standardSpacerHeight, direction: Direction.vertical,),
        ],
      ),
    );
  }
}
