import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';

class EntryBox extends StatefulWidget {
  final Note note;
  final int index;
  final Function(int) parentUpdate;
  const EntryBox(
      {super.key,
      required this.note,
      required this.index,
      required this.parentUpdate});

  @override
  State<EntryBox> createState() => _EntryBoxState();
}

class _EntryBoxState extends State<EntryBox> {
  late TextEditingController emotionController;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with the appropriate text
    emotionController = TextEditingController(text: widget.note.entries[widget.index].emotion);
    textController = TextEditingController(text: widget.note.entries[widget.index].text);

    // Add listeners to the controllers
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
  void dispose() {
    // Dispose controllers to free up resources
    emotionController.dispose();
    textController.dispose();
    super.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.note.entries[widget.index].hour,
                style: titleTextStyle,
              ),
              IconButton(
                onPressed: () => widget.parentUpdate(widget.index),
                icon: const Icon(Icons.delete, color: Colors.white, size: 30),
              )
            ],
          ),
          TextField(
            style: noteEmotionShowTextStyle,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your emotion here...",
              hintStyle: noteEmotionHideTextStyle,
            ),
            controller: emotionController,
          ),
          TextField(
            style: noteEntryShowTextStyle,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your entry here...",
              hintStyle: noteEntryHideTextStyle,
            ),
            controller: textController,
          ),
        ],
      ),
    );
  }
}
