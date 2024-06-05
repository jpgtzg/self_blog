import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';
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
                return Column(
                  key: ValueKey(widget
                      .note.entries[widget.note.entries.length - index - 1]),
                  children: [
                    EntryBox(
                      note: widget.note,
                      index: widget.note.entries.length - index - 1,
                      parentUpdate: deleteEntry,
                    ),
                    const StandardSpacer(height: standartSpacerHeight),
                  ],
                );
              },
            ),
          ),
          const StandardSpacer(height: standartSpacerHeight),
          CreateEntryButton(
            onTap: () {
              setState(() {
                updateEntry(() {
                  widget.note.entries.add(
                    Entry("${DateTime.now().hour} : ${DateTime.now().minute}",
                        "", ""),
                  );
                });
              });
            },
          ),
          const StandardSpacer(height: standartSpacerHeight),
        ],
      ),
    );
  }
}
