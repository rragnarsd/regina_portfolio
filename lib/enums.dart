enum Interest { animalWelfare, uiux, running, travel, programming }

extension InterestExtension on Interest {
  String get label => switch (this) {
    Interest.animalWelfare => 'Animal Welfare',
    Interest.programming => 'Programming',
    Interest.running => 'Running',
    Interest.uiux => 'UI/UX',
    Interest.travel => 'Travel',
  };
}

enum TabItem { profile, projects, contact }

extension TabItemExtension on TabItem {
  String get label => switch (this) {
    TabItem.profile => 'Profile',
    TabItem.projects => 'Projects',
    TabItem.contact => 'Contact',
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
