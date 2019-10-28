class RegExpUtils{
  static final String regexMobileExact =
      "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[1,8,9]))\\d{8}\$";

  static bool isMobileExact(String input) {
    return matches(regexMobileExact, input);
  }

  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return new RegExp(regex).hasMatch(input);
  }
}