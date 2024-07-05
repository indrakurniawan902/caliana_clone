class ReviewDataArgument {
  String cardName;
  String filePathCard;
  String name;
  String email;
  String? identityCardNumber;
  String? accessCardNumber;
  String selfiePath;

  ReviewDataArgument(
      {required this.cardName,
      required this.filePathCard,
      required this.name,
      required this.email,
      this.identityCardNumber,
      this.accessCardNumber,
      required this.selfiePath});
}
