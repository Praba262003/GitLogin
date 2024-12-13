Future<void> deleteFlashcard(String id) async {
  await FirebaseFirestore.instance.collection('flashcards').doc(id).delete();
}