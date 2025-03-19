part of 'note.dart';

class DeleteNoteVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteNoteVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteNoteData> dataDeserializer = (dynamic json)  => DeleteNoteData.fromJson(jsonDecode(json));
  Serializer<DeleteNoteVariables> varsSerializer = (DeleteNoteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteNoteData, DeleteNoteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteNoteData, DeleteNoteVariables> ref() {
    DeleteNoteVariables vars= DeleteNoteVariables(id: id,);
    return _dataConnect.mutation("DeleteNote", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteNoteNoteDelete {
  String id;
  DeleteNoteNoteDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteNoteNoteDelete({
    required this.id,
  });
}

class DeleteNoteData {
  DeleteNoteNoteDelete? note_delete;
  DeleteNoteData.fromJson(dynamic json):
  note_delete = json['note_delete'] == null ? null : DeleteNoteNoteDelete.fromJson(json['note_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (note_delete != null) {
      json['note_delete'] = note_delete!.toJson();
    }
    return json;
  }

  DeleteNoteData({
    this.note_delete,
  });
}

class DeleteNoteVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteNoteVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteNoteVariables({
    required this.id,
  });
}

