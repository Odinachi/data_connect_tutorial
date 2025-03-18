part of 'note.dart';

class GetNotesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetNotesVariablesBuilder(this._dataConnect, );
  Deserializer<GetNotesData> dataDeserializer = (dynamic json)  => GetNotesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetNotesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetNotesData, void> ref() {
    
    return _dataConnect.query("GetNotes", dataDeserializer, emptySerializer, null);
  }
}

class GetNotesNotes {
  String id;
  String title;
  String content;
  Timestamp createdAt;
  Timestamp updatedAt;
  GetNotesNotesUser user;
  GetNotesNotes.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),content = nativeFromJson<String>(json['content']),createdAt = Timestamp.fromJson(json['createdAt']),updatedAt = Timestamp.fromJson(json['updatedAt']),user = GetNotesNotesUser.fromJson(json['user']);

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

  GetNotesNotes({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}

class GetNotesNotesUser {
  String id;
  String name;
  String email;
  String uid;
  GetNotesNotesUser.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),email = nativeFromJson<String>(json['email']),uid = nativeFromJson<String>(json['uid']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['uid'] = nativeToJson<String>(uid);
    return json;
  }

  GetNotesNotesUser({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
  });
}

class GetNotesData {
  List<GetNotesNotes> notes;
  GetNotesData.fromJson(dynamic json):
  notes = (json['notes'] as List<dynamic>)
        .map((e) => GetNotesNotes.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['notes'] = notes.map((e) => e.toJson()).toList();
    return json;
  }

  GetNotesData({
    required this.notes,
  });
}

