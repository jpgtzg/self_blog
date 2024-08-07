// Written by Juan Pablo Gutiérrez
// 12 07 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';
import 'package:self_blog/screen/home_screen.dart';
import 'package:self_blog/screen/theme_screen.dart';
import 'package:self_blog/system/user_settings.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatefulWidget {
  final Function reloadFunction;

  const SideBar({required this.reloadFunction, super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPrimaryGradient(),
      builder: (context, snapshot) {
        return SidebarX(
          controller: SidebarXController(selectedIndex: 0, extended: true),
          theme: SidebarXTheme(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              gradient: snapshot.data,
              borderRadius: BorderRadius.circular(25),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedTextStyle: substitleStyle,
            selectedItemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withOpacity(0.37),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 30,
                )
              ],
            ),
          ),
          items: [
            SidebarXItem(
              icon: Icons.home,
              label: "Home",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),
            SidebarXItem(
              icon: Icons.color_lens,
              label: "Themes",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemeScreen()),
              ).then(
                (value) => setState(() {
                  widget.reloadFunction();
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
