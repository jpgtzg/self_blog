// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/screen/note_screen.dart';
import 'package:self_blog/system/realm_manager.dart';
import 'package:self_blog/system/realm_models.dart';
import 'package:self_blog/system/user_settings.dart';
import 'package:self_blog/widgets/calendar.dart';
import 'package:self_blog/widgets/create_blog_button.dart';
import 'package:self_blog/widgets/gradient_scaffold.dart';
import 'package:self_blog/widgets/note_card.dart';
import 'package:self_blog/widgets/sidebar.dart';
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
  bool isCalendarVisible = false;

  @override
  void initState() {
    super.initState();
    notes = getNotes();
    filteredNotes = notes;

    addNewNote();
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

  void toggleCalendarVisibility() {
    setState(() {
      isCalendarVisible = !isCalendarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradientCall: getPrimaryGradient(),
      isCentered: true,
      isInSafeArea: true,
      drawer: const SideBar(),
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      body: Builder(builder: (context) {
        return Column(
          children: [
            TopMenuBar(
              onMenuPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
            const StandardSpacer(
              value: standardSpacerHeight,
              direction: Direction.vertical,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: substitleStyle,
                            onChanged: onSearchTextChanged,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              hintText: "Search",
                              hintStyle: defaultStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        const StandardSpacer(
                          value: smallerSpacerHeight,
                          direction: Direction.horizontal,
                        ),
                        ElevatedButton(
                          onPressed: toggleCalendarVisibility,
                          child: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                    const StandardSpacer(
                      value: standardSpacerHeight,
                      direction: Direction.vertical,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: isCalendarVisible
                          ? Column(
                              children: [
                                Calendar(
                                  onDateChanged: onSearchTextChanged,
                                  key: ValueKey<bool>(isCalendarVisible),
                                ),
                                const StandardSpacer(
                                  value: standardSpacerHeight,
                                  direction: Direction.vertical,
                                ),
                              ],
                            )
                          : SizedBox.shrink(
                              key: ValueKey<bool>(isCalendarVisible)),
                    ),
                    CreateBlogButton(
                      titleText: "Write today's blog",
                      primaryColor: paleteLightBlue.withAlpha(75),
                      buttonColor: paleteLightBlue.withAlpha(150),
                      note: Note("asd"),
                      onTap: addNewNote,
                    ),
                    const StandardSpacer(
                      value: standardSpacerHeight,
                      direction: Direction.vertical,
                    ),
                    ListView.builder(
                      itemCount: filteredNotes.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            NoteCard(
                              titleText: filteredNotes[index].date,
                              widgetScreen:
                                  NoteScreen(note: filteredNotes[index]),
                              primaryColor: paleteLightBlue.withAlpha(75),
                              buttonColor: paleteLightBlue.withAlpha(150),
                              note: filteredNotes[index],
                            ),
                            const StandardSpacer(
                              value: standardSpacerHeight,
                              direction: Direction.vertical,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
