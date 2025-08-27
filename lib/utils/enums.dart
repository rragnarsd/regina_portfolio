enum Interest {
  animalWelfare('Animal Welfare'),
  programming('Programming'),
  running('Running'),
  uiux('UI/UX'),
  travel('Travel');

  final String label;
  const Interest(this.label);
}

enum TabItem {
  profile('Profile'),
  projects('Projects'),
  contact('Contact');

  final String label;
  const TabItem(this.label);
}

enum ProjectTag { flutter, flutterWeb, firebase, provider, getX, sembast, uiux }

extension ProjectTagExtension on ProjectTag {
  String get label => switch (this) {
    ProjectTag.flutter => 'Flutter',
    ProjectTag.flutterWeb => 'Flutter Web',
    ProjectTag.firebase => 'Firebase',
    ProjectTag.provider => 'Provider',
    ProjectTag.getX => 'GetX',
    ProjectTag.sembast => 'Sembast',
    ProjectTag.uiux => 'UI/UX',
  };
}

enum CountryFlag {
  usa('🇺🇸', 'United States'),
  canada('🇨🇦', 'Canada'),
  albania('🇦🇱', 'Albania'),
  germany('🇩🇪', 'Germany'),
  france('🇫🇷', 'France'),
  uk('🇬🇧', 'United Kingdom'),
  india('🇮🇳', 'India'),
  italy('🇮🇹', 'Italy'),
  lithuania('🇱🇹', 'Lithuania'),
  estonia('🇪🇪', 'Estonia'),
  peru('🇵🇪', 'Peru'),
  iceland('🇮🇸', 'Iceland'),
  slovakia('🇸🇰', 'Slovakia'),
  slovenia('🇸🇮', 'Slovenia'),
  spain('🇪🇸', 'Spain'),
  sweden('🇸🇪', 'Sweden'),
  switzerland('🇨🇭', 'Switzerland'),
  denmark('🇩🇰', 'Denmark'),
  finland('🇫🇮', 'Finland'),
  portugal('🇵🇹', 'Portugal'),
  bolivia('🇧🇴', 'Bolivia'),
  cuba('🇨🇺', 'Cuba'),
  russia('🇷🇺', 'Russia'),
  montenegro('🇲🇪', 'Montenegro'),
  vietnam('🇻🇳', 'Vietnam'),
  unitedArabEmirates('🇦🇪', 'United Arab Emirates'),
  malaysia('🇲🇾', 'Malaysia'),
  indonesia('🇮🇩', 'Indonesia'),
  turkey('🇹🇷', 'Turkey'),
  macedonia('🇲🇰', 'Macedonia'),
  serbia('🇷🇸', 'Serbia'),
  bulgaria('🇧🇬', 'Bulgaria'),
  kosovo('🇽🇰', 'Kosovo'),
  croatia('🇭🇷', 'Croatia'),
  belgium('🇧🇪', 'Belgium'),
  netherlands('🇳🇱', 'Netherlands'),
  belarus('🇧🇾', 'Belarus'),
  moldova('🇲🇩', 'Moldova'),
  georgia('🇬🇪', 'Georgia'),
  dominica('🇩🇲', 'Dominica'),
  stkitts('🇰🇳', 'St. Kitts and Nevis'),
  stlucia('🇱🇨', 'St. Lucia'),
  stvincent('🇻🇨', 'St. Vincent and the Grenadines'),
  jamaica('🇯🇲', 'Jamaica'),
  barbados('🇧🇧', 'Barbados'),
  grenada('🇬🇩', 'Grenada'),
  ukraine('🇺🇦', 'Ukraine'),
  belize('🇧🇿', 'Belize'),
  guatemala('🇬🇹', 'Guatemala'),
  honduras('🇭🇳', 'Honduras'),
  morocco('🇲🇦', 'Morocco'),
  usVirginIslands('🇻🇮', 'U.S. Virgin Islands'),
  saintVincent('🇻🇨', 'St. Vincent and the Grenadines'),
  saintLucia('🇱🇨', 'St. Lucia'),
  martinique('🇲🇶', 'Martinique'),
  guadeloupe('🇬🇵', 'Guadeloupe'),
  britishVirginIslands('🇻🇬', 'British Virgin Islands'),
  caymanIslands('🇰🇾', 'Cayman Islands'),
  antigua('🇦🇬', 'Antigua and Barbuda'),
  cyprus('🇨🇾', 'Cyprus'),
  vatican('🇻🇦', 'Vatican City'),
  malta('🇲🇹', 'Malta'),
  mexico('🇲🇽', 'Mexico'),
  bosniaHerzegovina('🇧🇦', 'Bosnia and Herzegovina'),
  czechia('🇨🇿', 'Czechia'),
  austria('🇦🇹', 'Austria'),
  hungary('🇭🇺', 'Hungary'),
  poland('🇵🇱', 'Poland'),
  latvia('🇱🇻', 'Latvia'),
  greece('🇬🇷', 'Greece'),
  ireland('🇮🇪', 'Ireland'),
  scotland('🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'Scotland');

  final String emoji;
  final String title;

  const CountryFlag(this.emoji, this.title);
}
