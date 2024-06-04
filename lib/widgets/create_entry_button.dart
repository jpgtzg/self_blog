// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'package:flutter/material.dart';
import 'package:self_blog/constants.dart';

class CreateEntryButton extends StatelessWidget {
  final Function onTap;
  const CreateEntryButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: paleteLightBlue.withAlpha(100),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () => onTap(),
      ),
    );
  }
}
