class Teste {
  final int userId;
  final int id;
  final String title;
  final String body;

  Teste({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Teste.fromJson(Map<String, dynamic> json) {
    return Teste(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
