import 'package:regina_portfolio/utils/constants.dart';
import 'package:regina_portfolio/utils/enums.dart';

class Project {
  final String name;
  final String url;
  final String image;
  final List<ProjectTag> tags;

  const Project({
    required this.name,
    required this.url,
    required this.image,
    required this.tags,
  });
}

final projects = [
  Project(
    name: ProjectNames.jobsy,
    url: Links.jobsy,
    image: Images.jobsyImage,
    tags: [
      ProjectTag.flutter,
      ProjectTag.firebase,
      ProjectTag.provider,
      ProjectTag.uiux,
    ],
  ),
  Project(
    name: ProjectNames.podstream,
    url: Links.podstream,
    image: Images.podstreamImage,
    tags: [ProjectTag.flutter, ProjectTag.uiux],
  ),
  Project(
    name: ProjectNames.yammi,
    url: Links.yammi,
    image: Images.yammiImage,
    tags: [ProjectTag.flutterWeb, ProjectTag.uiux],
  ),
  Project(
    name: ProjectNames.enduro,
    url: Links.enduro,
    image: Images.enduroImage,
    tags: [ProjectTag.flutter, ProjectTag.firebase, ProjectTag.getX],
  ),
];
