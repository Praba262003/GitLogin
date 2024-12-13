class Flashcard {
  String id;
  String question;
  String answer;

  Flashcard({required this.id, required this.question, required this.answer});

  factory Flashcard.fromFirestore(Map<String, dynamic> data, String id) {
    return Flashcard(
      id: id,
      question: data['question'],
      answer: data['answer'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}