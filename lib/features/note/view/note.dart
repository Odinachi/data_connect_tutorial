import 'package:connect_note/features/note/cubit/note_cubit.dart';
import 'package:connect_note/features/note/model/note_model.dart';
import 'package:connect_note/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteScreen extends StatefulWidget {
  final Note? note;

  NoteScreen({this.note});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final  _titleController = TextEditingController();
  final  _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      // _titleController.text = widget.note!.title;
      // _contentController.text = widget.note!.content;
      _isEditing = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Note' : 'New Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Expanded(
                child: TextFormField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: null,
                  expands: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter content';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   void _saveNote() {
    if (_formKey.currentState!.validate()) {
      if (_isEditing) {
        final updatedNote = Note(
          id: widget.note!.id,
          title: _titleController.text.trim(),
          content: _contentController.text.trim(),
          createdAt: widget.note!.createdAt,
        );
        context.read<NoteCubit>().updateNote(noteId: updatedNote.id);
      } else {
        context.read<NoteCubit>().addNote();
      }
      AppRouter.pop();
    }
  }
}
