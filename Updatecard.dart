Future<void> updateFlashcard(Flashcard flashcard) async {
  await FirebaseFirestore.instance.collection('flashcards').doc(flashcard.id).update(flashcard.toFirestore());
}