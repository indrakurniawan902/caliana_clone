class SelfieArgument {
  String cardName;
  String filePathCard;
  String name;
  String email;
  String? identityCardNumber;
  String? accessCardNumber;

  SelfieArgument(
      {required this.cardName,
      required this.filePathCard,
      required this.name,
      required this.email,
      this.identityCardNumber,
      this.accessCardNumber});
}
