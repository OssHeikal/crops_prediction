extension StringExtension on String? {
  String get validate => this ?? '';

  String capitalize() {
    return '${validate[0].toUpperCase()}${validate.substring(1)}';
  }

  String get svg => 'assets/icons/$validate.svg';
}
