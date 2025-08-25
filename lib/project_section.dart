import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectTab extends StatelessWidget {
  const ProjectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1200,
      child: Padding(
        padding: EdgeInsetsGeometry.all(32.0),
        child: const Text(
          'Projects Tab - Coming Soon!',
          style: TextStyle(fontSize: 18, color: Color(0xffE0E0E0)),
        ),
      ),
    );
  }
}
