import 'package:flutter/material.dart';
import 'add_flashcard.dart';
import 'flashcard.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [];

  void _addFlashcard(Flashcard flashcard) {
    setState(() {
      flashcards.add(flashcard);
    });
  }

  void _editFlashcard(int index, Flashcard flashcard) {
    setState(() {
      flashcards[index] = flashcard;
    });
  }

  void _deleteFlashcard(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this flashcard?"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                flashcards.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text("Delete"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard App'),
      ),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(flashcards[index].question),
              onTap: () => _showAnswer(flashcards[index].answer),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final editedFlashcard = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddFlashcardScreen(
                            flashcard: flashcards[index],
                          ),
                        ),
                      );
                      if (editedFlashcard != null) {
                        _editFlashcard(index, editedFlashcard);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteFlashcard(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final flashcard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlashcardScreen()),
          );
          if (flashcard != null) {
            _addFlashcard(flashcard);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAnswer(String answer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(answer),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}