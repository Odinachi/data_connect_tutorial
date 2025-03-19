library note_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'create_user.dart';

part 'create_note.dart';

part 'get_users.dart';

part 'get_user.dart';

part 'get_notes.dart';

part 'ge_user_notes.dart';

part 'get_note.dart';







class NoteConnector {
  
  
  CreateUserVariablesBuilder createUser ({required String uid, required String email, required String name, }) {
    return CreateUserVariablesBuilder(dataConnect, uid: uid,email: email,name: name,);
  }
  
  
  CreateNoteVariablesBuilder createNote ({required String title, required String content, required String userId, }) {
    return CreateNoteVariablesBuilder(dataConnect, title: title,content: content,userId: userId,);
  }
  
  
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

