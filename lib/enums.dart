enum Interest { animalWelfare, uiux, foodBeverage, travel, programming }

extension InterestExtension on Interest {
  String get label => switch (this) {
    Interest.animalWelfare => 'Animal Welfare',
    Interest.foodBeverage => 'Food & Beverage',
    Interest.programming => 'Programming',
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
