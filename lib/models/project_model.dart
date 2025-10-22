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
  const Project(
    name: ProjectNames.siply,
    url: Links.siply,
    image: Images.siplyImage,
    tags: [
      ProjectTag.flutter,
      ProjectTag.uiux,
      ProjectTag.firebase,
      ProjectTag.riverpod,
    ],
  ),
  const Project(
    name: ProjectNames.resido,
    url: Links.resido,
    image: Images.residoImage,
    tags: [
      ProjectTag.flutter,
      ProjectTag.uiux,
      ProjectTag.supabase,
      ProjectTag.bloc,
    ],
  ),
  const Project(
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
  const Project(
    name: ProjectNames.podstream,
    url: Links.podstream,
    image: Images.podstreamImage,
    tags: [ProjectTag.flutter, ProjectTag.uiux],
  ),
  const Project(
    name: ProjectNames.yammi,
    url: Links.yammi,
    image: Images.yammiImage,
    tags: [ProjectTag.flutterWeb, ProjectTag.uiux],
  ),
  const Project(
    name: ProjectNames.enduro,
    url: Links.enduro,
    image: Images.enduroImage,
    tags: [ProjectTag.flutter, ProjectTag.firebase, ProjectTag.getX],
  ),
];
