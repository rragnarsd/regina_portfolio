import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:regina_portfolio/models/project_model.dart';
import 'package:regina_portfolio/utils/colors.dart';
import 'package:regina_portfolio/utils/constants.dart';
import 'package:regina_portfolio/utils/enums.dart';
import 'package:regina_portfolio/utils/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTab extends StatelessWidget {
  const ProjectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1200,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobileOrTablet ? 16.0 : 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobileOrTablet ? 1 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.4,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) =>
                _ProjectCard(project: projects[index]),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 1.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final Uri url = Uri.parse(project.url);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: () async => await _launchUrl(url: url),
        child: ClipRRect(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      project.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Text(
                      project.name,
                      style: TextStyle(
                        color: AppColors.primaryA10,
                        fontSize: context.isMobileOrTablet ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SlideTransition(
                position: _animation,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceA0.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Transform.rotate(
                    angle: -0.5,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryA10,
                      size: 36,
                    ),
                  ),
                ),
              ),
              if (_isHovered)
                ProjectHover(
                  projectName: project.name,
                  projectTags: project.tags,
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.tonalSurfaceA30,
                    width: _isHovered ? 4 : 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      if (mounted) {
        context.showErrorSnackBar('${ContactText.launchUrlError} $url');
      }
    }
  }
}

class ProjectHover extends StatelessWidget {
  const ProjectHover({
    super.key,
    required this.projectName,
    required this.projectTags,
  });

  final String projectName;
  final List<ProjectTag> projectTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            projectName,
            style: TextStyle(
              color: AppColors.primaryA10,
              fontSize: context.isMobileOrTablet ? 14 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: projectTags
                .map(
                  (tag) => Chip(
                    padding: EdgeInsets.all(2),
                    backgroundColor: AppColors.primaryA10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: BorderSide(color: AppColors.transparent),
                    elevation: 2,
                    label: Text(
                      tag.label,
                      style: TextStyle(
                        fontSize: context.isMobileOrTablet ? 14 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
