
class Flashcard {
  final String type;
  final int id;
  final String playlist;
  final String flashcardFront;
  final String flashcardBack;
  final String description;
  final Map<String, dynamic> user;

  Flashcard({
    required this.type,
    required this.id,
    required this.playlist,
    required this.flashcardFront,
    required this.flashcardBack,
    required this.description,
    required this.user,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      type: json['type'],
      id: json['id'],
      playlist: json['playlist'],
      flashcardFront: json['flashcard_front'],
      flashcardBack: json['flashcard_back'],
      description: json['description'],
      user: json['user'],
    );
  }
}
