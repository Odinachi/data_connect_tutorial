part of 'note.dart';

class GetUsersVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetUsersVariablesBuilder(this._dataConnect, );
  Deserializer<GetUsersData> dataDeserializer = (dynamic json)  => GetUsersData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetUsersData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetUsersData, void> ref() {
    
    return _dataConnect.query("GetUsers", dataDeserializer, emptySerializer, null);
  }
}

class GetUsersUsers {
  String id;
  String name;
  String email;
  String uid;
  GetUsersUsers.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),email = nativeFromJson<String>(json['email']),uid = nativeFromJson<String>(json['uid']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['uid'] = nativeToJson<String>(uid);
    return json;
  }

  GetUsersUsers({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
  });
}

class GetUsersData {
  List<GetUsersUsers> users;
  GetUsersData.fromJson(dynamic json):
  users = (json['users'] as List<dynamic>)
        .map((e) => GetUsersUsers.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  GetUsersData({
    required this.users,
  });
}

