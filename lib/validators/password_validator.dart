String? passwordValidator(String? str) {
  if (str!.length < 6) {
    return 'Password must contain at least 6 digits.';
  }
  return null;
}
