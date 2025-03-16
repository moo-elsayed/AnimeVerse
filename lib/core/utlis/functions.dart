String extractNumber(String text) {
  RegExp regex = RegExp(r'\d+'); // يبحث عن أي أرقام في النص
  Match? match = regex.firstMatch(text);
  return match?.group(0) ?? ''; // يرجع الرقم إذا وجد، وإلا يرجع نص فارغ
}