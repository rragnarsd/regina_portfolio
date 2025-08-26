class LocalData {
  final String projectName;
  final List<String> projectTags;
  final String projectUrl;
  final String projectImage;

  LocalData({
    required this.projectName,
    required this.projectTags,
    required this.projectUrl,
    required this.projectImage,
  });
}

List<LocalData> localData = [
  LocalData(
    projectName: 'Jobsy',
    projectTags: ['Flutter', 'Dart', 'Firebase', 'Provider'],
    projectUrl: 'https://github.com/rragnarsd/Jobsy',
    projectImage: 'assets/jobsy.png',
  ),
  LocalData(
    projectName: 'PodStream',
    projectTags: ['Flutter', 'Dart', 'UI/UX'],
    projectUrl: 'https://github.com/rragnarsd/podstream',
    projectImage: 'assets/podstream.jpg',
  ),
  LocalData(
    projectName: 'Enduro',
    projectTags: ['Flutter', 'Dart', 'GetX', 'Sembast'],
    projectUrl: 'https://github.com/rragnarsd/Enduro_app',
    projectImage: 'assets/enduro.png',
  ),
  LocalData(
    projectName: 'Weather Cubit',
    projectTags: ['Flutter', 'Dart', 'Bloc', 'REST API'],
    projectUrl: 'https://github.com/rragnarsd/weather_cubits',
    projectImage: 'assets/weather_cubits.png',
  ),
];
