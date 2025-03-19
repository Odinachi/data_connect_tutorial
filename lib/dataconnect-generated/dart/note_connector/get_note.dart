part of 'note.dart';

class GetNoteVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetNoteVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetNoteData> dataDeserializer = (dynamic json)  => GetNoteData.fromJson(jsonDecode(json));
  Serializer<GetNoteVariables> varsSerializer = (GetNoteVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetNoteData, GetNoteVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetNoteData, GetNoteVariables> ref() {
    GetNoteVariables vars= GetNoteVariables(id: id,);
    return _dataConnect.query("GetNote", dataDeserializer, varsSerializer, vars);
  }
}

class GetNoteNote {
  String id;
  String title;
  String content;
  Timestamp createdAt;
  Timestamp updatedAt;
  GetNoteNoteUser user;
  GetNoteNote.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),content = nativeFromJson<String>(json['content']),createdAt = Timestamp.fromJson(json['createdAt']),updatedAt = Timestamp.fromJson(json['updatedAt']),user = GetNoteNoteUser.fromJson(json['user']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['content'] = nativeToJson<String>(content);
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    json['user'] = user.toJson();
    return json;
  }

  GetNoteNote({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}

class GetNoteNoteUser {
  String id;
  String name;
  String email;
  String uid;
  GetNoteNoteUser.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),email = nativeFromJson<String>(json['email']),uid = nativeFromJson<String>(json['uid']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['uid'] = nativeToJson<String>(uid);
    return json;
  }

  GetNoteNoteUser({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
  });
}

class GetNoteData {
  GetNoteNote? note;
  GetNoteData.fromJson(dynamic json):
  note = json['note'] == null ? null : GetNoteNote.fromJson(json['note']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (note != null) {
      json['note'] = note!.toJson();
    }
    return json;
  }

  GetNoteData({
    this.note,
  });
}

class GetNoteVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetNoteVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetNoteVariables({
    required this.id,
  });
}

