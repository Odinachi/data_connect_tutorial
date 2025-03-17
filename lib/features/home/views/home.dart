import 'package:connect_note/features/auth/cubit/auth_cubit.dart';
import 'package:connect_note/features/auth/views/login.dart';
import 'package:connect_note/features/note/cubit/note_cubit.dart';
import 'package:connect_note/features/note/view/note.dart';
import 'package:connect_note/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<NoteCubit>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthUnauthenticated) {
               AppRouter.pushReplacement(
                 AppRouteString.login
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NoteFailure) {
            return Center(child: Text(state.message));
          } else if (state is NoteSuccess) {
            if (state.notes.isEmpty) {
              return Center(
                  child: Text('No notes yet. Create your first note!'));
            }
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return Dismissible(
                  key: Key(note.id??""),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Note'),
                          content:
                              Text('Are you sure you want to delete this note?'),
                          actions: [
                            TextButton(
                              onPressed: () => AppRouter.pop(),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => AppRouter.pop(),
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) {
                    context.read<NoteCubit>().deleteNote(noteId: note.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Note deleted')),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        note.title??"",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        note.content??"",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                      AppRouter.push(
                         AppRouteString.noteScreen, arg: note
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text('Something went wrong'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.push(
            AppRouteString.noteScreen
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}