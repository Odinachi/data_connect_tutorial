library note_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'get_users.dart';

part 'get_user.dart';

part 'get_notes.dart';

part 'ge_user_notes.dart';

part 'create_user.dart';

part 'create_note.dart';







class NoteConnector {
  
  
  GetUsersVariablesBuilder getUsers () {
    return GetUsersVariablesBuilder(dataConnect, );
  }
  
  
  GetUserVariablesBuilder getUser ({required String id, }) {
    return GetUserVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetNotesVariablesBuilder getNotes () {
    return GetNotesVariablesBuilder(dataConnect, );
  }
  
  
  GeUserNotesVariablesBuilder geUserNotes ({required String id, }) {
    return GeUserNotesVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreateUserVariablesBuilder createUser ({required String uid, required String email, required String name, }) {
    return CreateUserVariablesBuilder(dataConnect, uid: uid,email: email,name: name,);
  }
  
  
  CreateNoteVariablesBuilder createNote ({required String title, required String content, required String userId, }) {
    return CreateNoteVariablesBuilder(dataConnect, title: title,content: content,userId: userId,);
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

