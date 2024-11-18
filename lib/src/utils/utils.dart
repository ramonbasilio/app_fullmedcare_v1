class Utils {
  static String convertDate(String formattedString) {
    DateTime datetime = DateTime.parse(formattedString);
    return "${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}";
  }
}
