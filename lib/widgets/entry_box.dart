// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';

class EntryBox extends StatefulWidget {
  final Note note;
  final int index;
  const EntryBox({super.key, required this.note, required this.index});

  @override
  State<EntryBox> createState() => _EntryBoxState();
}

class _EntryBoxState extends State<EntryBox> {
  final TextEditingController emotionController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emotionController.text = widget.note.entries[widget.index].emotion;
    textController.text = widget.note.entries[widget.index].text;

    emotionController.addListener(() {
      updateEntry(() =>
          widget.note.entries[widget.index].emotion = emotionController.text);
    });

    textController.addListener(() {
      updateEntry(
          () => widget.note.entries[widget.index].text = textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: paleteLightBlue.withAlpha(75),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.note.entries[widget.index].hour,
              style: titleTextStyle,
            ),
          ),
          TextField(
            style: noteEmotionShowTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.note.entries[widget.index].emotion,
              hintStyle: noteEmotionHideTextStyle,
            ),
            controller: emotionController,
          ),
          TextField(
            style: noteEntryShowTextStyle,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.note.entries[widget.index].text,
              hintStyle: noteEntryHideTextStyle,
            ),
            controller: textController,
          ),
        ],
      ),
    );
  }
}
