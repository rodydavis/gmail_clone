class EmailItem {
  EmailItem({
    this.avatar,
    this.date,
    this.description,
    this.favorite,
    this.title,
  });

  final String title;

  final String description;

  final String avatar;

  final DateTime date;

  bool favorite = false;
}
