part of 'note.dart';

class GeUserNotesVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GeUserNotesVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GeUserNotesData> dataDeserializer = (dynamic json)  => GeUserNotesData.fromJson(jsonDecode(json));
  Serializer<GeUserNotesVariables> varsSerializer = (GeUserNotesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GeUserNotesData, GeUserNotesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GeUserNotesData, GeUserNotesVariables> ref() {
    GeUserNotesVariables vars= GeUserNotesVariables(id: id,);
    return _dataConnect.query("geUserNotes", dataDeserializer, varsSerializer, vars);
  }
}

class GeUserNotesNotes {
  String id;
  String title;
  String content;
  Timestamp createdAt;
  Timestamp updatedAt;
  GeUserNotesNotesUser user;
  GeUserNotesNotes.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),content = nativeFromJson<String>(json['content']),createdAt = Timestamp.fromJson(json['createdAt']),updatedAt = Timestamp.fromJson(json['updatedAt']),user = GeUserNotesNotesUser.fromJson(json['user']);

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

  GeUserNotesNotes({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}

class GeUserNotesNotesUser {
  String id;
  String name;
  String email;
  String uid;
  GeUserNotesNotesUser.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),email = nativeFromJson<String>(json['email']),uid = nativeFromJson<String>(json['uid']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['uid'] = nativeToJson<String>(uid);
    return json;
  }

  GeUserNotesNotesUser({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
  });
}

class GeUserNotesData {
  List<GeUserNotesNotes> notes;
  GeUserNotesData.fromJson(dynamic json):
  notes = (json['notes'] as List<dynamic>)
        .map((e) => GeUserNotesNotes.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['notes'] = notes.map((e) => e.toJson()).toList();
    return json;
  }

  GeUserNotesData({
    required this.notes,
  });
}

class GeUserNotesVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GeUserNotesVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GeUserNotesVariables({
    required this.id,
  });
}

