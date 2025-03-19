part of 'note.dart';

class UpdateNoteVariablesBuilder {
  String id;
  String title;
  String content;

  final FirebaseDataConnect _dataConnect;
  UpdateNoteVariablesBuilder(this._dataConnect, {required  this.id,required  this.title,required  this.content,});
  Deserializer<UpdateNoteData> dataDeserializer = (dynamic json)  => UpdateNoteData.fromJson(jsonDecode(json));
  Serializer<UpdateNoteVariables> varsSerializer = (UpdateNoteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateNoteData, UpdateNoteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateNoteData, UpdateNoteVariables> ref() {
    UpdateNoteVariables vars= UpdateNoteVariables(id: id,title: title,content: content,);
    return _dataConnect.mutation("UpdateNote", dataDeserializer, varsSerializer, vars);
  }
}

class UpdateNoteNoteUpdate {
  String id;
  UpdateNoteNoteUpdate.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateNoteNoteUpdate({
    required this.id,
  });
}

class UpdateNoteData {
  UpdateNoteNoteUpdate? note_update;
  UpdateNoteData.fromJson(dynamic json):
  note_update = json['note_update'] == null ? null : UpdateNoteNoteUpdate.fromJson(json['note_update']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (note_update != null) {
      json['note_update'] = note_update!.toJson();
    }
    return json;
  }

  UpdateNoteData({
    this.note_update,
  });
}

class UpdateNoteVariables {
  String id;
  String title;
  String content;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateNoteVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),content = nativeFromJson<String>(json['content']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['content'] = nativeToJson<String>(content);
    return json;
  }

  UpdateNoteVariables({
    required this.id,
    required this.title,
    required this.content,
  });
}

