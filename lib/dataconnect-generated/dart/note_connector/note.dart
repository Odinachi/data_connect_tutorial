library note_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'get_users.dart';

part 'get_user.dart';

part 'get_notes.dart';

part 'ge_user_notes.dart';

part 'get_note.dart';

part 'create_user.dart';

part 'create_note.dart';

part 'delete_note.dart';

part 'update_note.dart';







class NoteConnector {
  
  
  GetUsersVariablesBuilder getUsers () {
    return GetUsersVariablesBuilder(dataConnect, );
  }
  
  
  GetUserVariablesBuilder getUser ({required String uid, }) {
    return GetUserVariablesBuilder(dataConnect, uid: uid,);
  }
  
  
  GetNotesVariablesBuilder getNotes () {
    return GetNotesVariablesBuilder(dataConnect, );
  }
  
  
  GeUserNotesVariablesBuilder geUserNotes ({required String id, }) {
    return GeUserNotesVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetNoteVariablesBuilder getNote ({required String id, }) {
    return GetNoteVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreateUserVariablesBuilder createUser ({required String uid, required String email, required String name, }) {
    return CreateUserVariablesBuilder(dataConnect, uid: uid,email: email,name: name,);
  }
  
  
  CreateNoteVariablesBuilder createNote ({required String title, required String content, required String userId, }) {
    return CreateNoteVariablesBuilder(dataConnect, title: title,content: content,userId: userId,);
  }
  
  
  DeleteNoteVariablesBuilder deleteNote ({required String id, }) {
    return DeleteNoteVariablesBuilder(dataConnect, id: id,);
  }
  
  
  UpdateNoteVariablesBuilder updateNote ({required String id, required String title, required String content, }) {
    return UpdateNoteVariablesBuilder(dataConnect, id: id,title: title,content: content,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'note',
    'connectnote',
  );

  NoteConnector({required this.dataConnect});
  static NoteConnector get instance {
    return NoteConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}

