// Written by Juan Pablo Gutiérrez
// 3 06 2024 

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/screen/note_screen.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';
import 'package:self_blog/widgets/create_blog_button.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/note_card.dart';
import 'package:self_blog/widgets/standard_spacer.dart';
import 'package:self_blog/widgets/top_menu_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];
  List<Note> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    notes = getNotes();
    filteredNotes = notes;

    if (notes.isEmpty) {
      addNewNote();
    }
  }

  void addNewNote() {
    if (notes.isNotEmpty) {
      if (notes.last.date == DateTime.now().toString().substring(0, 10)) {
        return;
      }
    }

    // Check if widget is building
    if (mounted) {
      setState(() {
        final newNote = Note(DateTime.now().toString().substring(0, 10));
        write(newNote);
        notes = getNotes();
        filteredNotes = notes;
      });
    }
  }

  void onSearchTextChanged(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        filteredNotes = notes;
      });
      return;
    }
    setState(() {
      filteredNotes = notes
          .where((element) =>
              element.date.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
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
          const TopMenuBar(),
          const StandardSpacer(height: standartSpacerHeight),
          TextField(
            style: substitleStyle,
            onChanged: onSearchTextChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              hintText: "Search",
              hintStyle: defaultStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const StandardSpacer(height: standartSpacerHeight),
          CreateBlogbutton(
              titleText: "Write today's blog",
              primaryColor: paleteLightBlue.withAlpha(75),
              buttonColor: paleteLightBlue.withAlpha(150),
              note: Note("asd"),
              onTap: addNewNote),
          const StandardSpacer(height: standartSpacerHeight),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    NoteCard(
                      titleText: filteredNotes[index].date,
                      widgetScreen: NoteScreen(note: filteredNotes[index]),
                      primaryColor: paleteLightBlue.withAlpha(75),
                      buttonColor: paleteLightBlue.withAlpha(150),
                      note: filteredNotes[index],
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
