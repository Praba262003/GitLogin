Future<void> addFlashcard(Flashcard flashcard) async {
  await FirebaseFirestore.instance.collection('flashcards').add(flashcard.toFirestore());
}