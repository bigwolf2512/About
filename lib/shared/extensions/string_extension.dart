extension StringExtension on String {
  bool isNullOrEmpty() => this == null || this.trim().isEmpty;
  bool isNotNullOrEmpty() => this != null && this.trim().isNotEmpty;

  bool isEmail() {
    if(this == null || this.trim().isEmpty)
      return false;
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

}