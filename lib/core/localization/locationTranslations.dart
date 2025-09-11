String getLocalizedLocation(String englishName) {
  return locationTranslations[englishName] ?? englishName;
}
String getMonth(String month) {
  return monthTranslations[month]!;
}
Map<String, String> monthTranslations = {
  "1": "يناير",
  "2": "فبراير",
  "3": "مارس",
  "4": "أبريل",
  "5": "مايو",
  "6": "يونيو",
  "7": "يوليو",
  "8": "أغسطس",
  "9": "سبتمبر",
  "10": "أكتوبر",
  "11": "نوفمبر",
  "12": "ديسمبر",
};

Map<String, String> locationTranslations = {
  // Egypt Governorates
  'Cairo': 'القاهرة',
  'Giza': 'الجيزة',
  'Alexandria': 'الإسكندرية',
  'Qalyubia': 'القليوبية',
  'Sharqia': 'الشرقية',
  'Dakahlia': 'الدقهلية',
  'Beheira': 'البحيرة',
  'Kafr El Sheikh': 'كفر الشيخ',
  'Gharbia': 'الغربية',
  'Monufia': 'المنوفية',
  'Fayoum': 'الفيوم',
  'Bani Sweif': 'بني سويف',
  'Minya': 'المنيا',
  'Assiut': 'أسيوط',
  'Sohag': 'سوهاج',
  'Qena': 'قنا',
  'Luxor': 'الأقصر',
  'Aswan': 'أسوان',
  'Red Sea': 'البحر الأحمر',
  'New Valley': 'الوادي الجديد',
  'Matrouh': 'مطروح',
  'North Sinai': 'شمال سيناء',
  'South Sinai': 'جنوب سيناء',
  'Port Said': 'بورسعيد',
  'Ismailia': 'الإسماعيلية',
  'Suez': 'السويس',
  'Damietta': 'دمياط',

  // Middle East
  'Riyadh': 'الرياض',
  'Jeddah': 'جدة',
  'Mecca': 'مكة المكرمة',
  'Medina': 'المدينة المنورة',
  'Dammam': 'الدمام',
  'Amman': 'عمان',
  'Beirut': 'بيروت',
  'Baghdad': 'بغداد',
  'Dubai': 'دبي',
  'Abu Dhabi': 'أبو ظبي',
  'Doha': 'الدوحة',
  'Kuwait City': 'الكويت',
  'Manama': 'المنامة',
  'Muscat': 'مسقط',
  'Damascus': 'دمشق',
  'Khartoum': 'الخرطوم',

  // Europe
  'London': 'لندن',
  'Paris': 'باريس',
  'Berlin': 'برلين',
  'Madrid': 'مدريد',
  'Rome': 'روما',
  'Vienna': 'فيينا',
  'Amsterdam': 'أمستردام',
  'Prague': 'براغ',
  'Istanbul': 'إسطنبول',
  'Moscow': 'موسكو',
  'Lisbon': 'لشبونة',
  'Athens': 'أثينا',

  // Asia
  'Tokyo': 'طوكيو',
  'Beijing': 'بكين',
  'Seoul': 'سيول',
  'Shanghai': 'شنغهاي',
  'Bangkok': 'بانكوك',
  'Jakarta': 'جاكرتا',
  'Manila': 'مانيلا',
  'New Delhi': 'نيودلهي',
  'Mumbai': 'مومباي',
  'Kuala Lumpur': 'كوالالمبور',
  'Singapore': 'سنغافورة',
  'Hong Kong': 'هونغ كونغ',

  // Africa
  'Nairobi': 'نيروبي',
  'Cape Town': 'كيب تاون',
  'Johannesburg': 'جوهانسبرغ',
  'Lagos': 'لاغوس',
  'Casablanca': 'الدار البيضاء',
  'Tunis': 'تونس',
  'Algiers': 'الجزائر',
  'Addis Ababa': 'أديس أبابا',
  'Kigali': 'كيغالي',
  'Accra': 'أكرا',

  // North America
  'New York': 'نيويورك',
  'Los Angeles': 'لوس أنجلوس',
  'Chicago': 'شيكاغو',
  'Toronto': 'تورونتو',
  'Vancouver': 'فانكوفر',
  'Mexico City': 'مكسيكو سيتي',
  'Miami': 'ميامي',
  'San Francisco': 'سان فرانسيسكو',

  // South America
  'São Paulo': 'ساو باولو',
  'Buenos Aires': 'بوينس آيرس',
  'Lima': 'ليما',
  'Bogotá': 'بوغوتا',
  'Santiago': 'سانتياغو',

  // Australia & Oceania
  'Sydney': 'سيدني',
  'Melbourne': 'ملبورن',
  'Auckland': 'أوكلاند',
  'Wellington': 'ويلينغتون',

  // Others
  'Jerusalem': 'القدس',
  'Tehran': 'طهران',
  'Kabul': 'كابول',
};

