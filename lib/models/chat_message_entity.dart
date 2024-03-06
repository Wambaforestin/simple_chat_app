class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      required this.id,
      required this.createdAt,
      this.imageUrl,
      required this.author});
// the factory method is used to create an instance of the ChatMessageEntity class from the json data
  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      imageUrl: json['image'],
      text: json['text'],
      id: json['id'],
      createdAt: json['createdAt'],
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  String? userName; // the username of the author

  Author({required this.userName});
// the factory method is used to create an instance of the Author class from the json data
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['author']);
  }
}
