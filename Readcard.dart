Stream<List<Flashcard>> getFlashcards() {
  return FirebaseFirestore.instance.collection('flashcards').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => Flashcard.fromFirestore(doc.data(), doc.id)).toList();
  });
}