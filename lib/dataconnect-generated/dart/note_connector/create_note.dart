part of 'note.dart';

class CreateNoteVariablesBuilder {
  String title;
  String content;
  String userId;

  final FirebaseDataConnect _dataConnect;
  CreateNoteVariablesBuilder(this._dataConnect, {required  this.title,required  this.content,required  this.userId,});
  Deserializer<CreateNoteData> dataDeserializer = (dynamic json)  => CreateNoteData.fromJson(jsonDecode(json));
  Serializer<CreateNoteVariables> varsSerializer = (CreateNoteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateNoteData, CreateNoteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateNoteData, CreateNoteVariables> ref() {
    CreateNoteVariables vars= CreateNoteVariables(title: title,content: content,userId: userId,);
    return _dataConnect.mutation("CreateNote", dataDeserializer, varsSerializer, vars);
  }
}

class CreateNoteNoteInsert {
  String id;
  CreateNoteNoteInsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateNoteNoteInsert({
    required this.id,
  });
}

class CreateNoteData {
  CreateNoteNoteInsert note_insert;
  CreateNoteData.fromJson(dynamic json):
  note_insert = CreateNoteNoteInsert.fromJson(json['note_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['note_insert'] = note_insert.toJson();
    return json;
  }

  CreateNoteData({
    required this.note_insert,
  });
}

class CreateNoteVariables {
  String title;
  String content;
  String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateNoteVariables.fromJson(Map<String, dynamic> json):
  title = nativeFromJson<String>(json['title']),content = nativeFromJson<String>(json['content']),userId = nativeFromJson<String>(json['userId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = nativeToJson<String>(title);
    json['content'] = nativeToJson<String>(content);
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  CreateNoteVariables({
    required this.title,
    required this.content,
    required this.userId,
  });
}

