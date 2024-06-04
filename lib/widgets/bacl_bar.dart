// Written by Juan Pablo Gutiérrez
//
// 12 05 2024

import 'package:flutter/material.dart';
import 'package:self_blog/widgets/back_icon.dart';

class BackBar extends StatelessWidget {
  const BackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackIcon(),
      ],
    );
  }
}
