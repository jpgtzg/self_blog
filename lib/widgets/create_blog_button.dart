// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/screen/note_screen.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';

class CreateBlogbutton extends StatelessWidget {
  final String titleText;
  final Color primaryColor;
  final Color? secondaryColor;
  final Color buttonColor;
  final Note note;
  final Function onTap;
  const CreateBlogbutton(
      {required this.titleText,
      required this.primaryColor,
      this.secondaryColor,
      required this.buttonColor,
      required this.note,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        /* Note newNote = Note(
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
          entries: [],
        );
        write(newNote);
         */
        /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NoteScreen(note: newNote)),
        ); */
      },
      child: AspectRatio(
        aspectRatio: 13 / 4,
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 25,
            left: 25,
          ),
          decoration: (secondaryColor != null)
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      primaryColor,
                      secondaryColor!,
                    ],
                  ),
                )
              : BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
          child: Stack(
            children: [
              Text(
                titleText,
                textAlign: TextAlign.center,
                style: defaultStyle,
              ),
              Positioned(
                right: 30,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: buttonColor,
                  ),
                  child: const Center(
                      child: Icon(Icons.add, color: Colors.white, size: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
