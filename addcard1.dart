import 'package:flutter/material.dart';
import 'flashcard.dart';

class AddFlashcardScreen extends StatefulWidget {
  final Flashcard? flashcard;

  AddFlashcardScreen({this.flashcard});

  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _question;
  late String _answer;

  @override
  void initState() {
    super.initState();
    if (widget.flashcard != null) {
      _question = widget.flashcard!.question;
      _answer = widget.flashcard!.answer;
    } else {
      _question = '';
      _answer = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.flashcard == null ? 'Add Flashcard' : 'Edit Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _question,
                decoration: InputDecoration(labelText: 'Question'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a question';
                  }
                  return null;
                },
                onSaved: (value) {
                  _question = value!;
                },
              ),
              TextFormField(
                initialValue: _answer,
                decoration: InputDecoration(labelText: 'Answer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an answer';
                  }
                  return null;
                },
                onSaved: (value) {
                  _answer = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final flashcard = Flashcard(question: _question, answer: _answer);
                    Navigator.pop(context, flashcard);
                  }
                },
                child: Text(widget.flashcard == null ? 'Add Flashcard' : 'Update Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}