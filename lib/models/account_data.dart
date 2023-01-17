class AccountData {
  final String id;
  final String title;

  AccountData({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
  };

  AccountData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];
}
