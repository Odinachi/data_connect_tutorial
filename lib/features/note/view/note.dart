import 'package:connect_note/features/auth/cubit/auth_cubit.dart';
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
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note?.title ?? "";
      _contentController.text = widget.note?.content ?? "";
      _isEditing = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("note id ${widget.note?.id}");
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
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (_, state) {
          if (state is NoteCreated) {
            AppRouter.pop();
            showMsg(msg: "Note created", context: context);
          }
          if (state is NoteUpdated) {
            AppRouter.pop();
            showMsg(msg: "Note updated", context: context);
          }
          if (state is NoteFailure) {
            showMsg(msg: state.message, context: context);
          }
        },
        builder: (_, state) => state is NoteLoading
            ? CircularProgressIndicator()
            : Padding(
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
                      SizedBox(
                        height: 300,
                        child: TextFormField(
                          maxLines: 20,
                          controller: _contentController,
                          decoration: InputDecoration(
                            labelText: 'Content',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
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
      ),
    );
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      if (_isEditing) {
        final note = Note(
          id: _isEditing ? widget.note!.id : null,
          title: _titleController.text.trim(),
          content: _contentController.text.trim(),
          createdAt: widget.note!.createdAt,
        );
        context.read<NoteCubit>().updateNote(
            note: note, id: context.read<AuthCubit>().user?.id ?? "");
      } else {
        context.read<NoteCubit>().addNote(
            title: _titleController.text.trim(),
            content: _contentController.text.trim(),
            userId: context.read<AuthCubit>().user?.uid ?? "");
      }
    }
  }
}

void showMsg({required String msg, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));
}
