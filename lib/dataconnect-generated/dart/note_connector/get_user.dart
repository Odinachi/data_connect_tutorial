part of 'note.dart';

class GetUserVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetUserVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetUserData> dataDeserializer = (dynamic json)  => GetUserData.fromJson(jsonDecode(json));
  Serializer<GetUserVariables> varsSerializer = (GetUserVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserData, GetUserVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserData, GetUserVariables> ref() {
    GetUserVariables vars= GetUserVariables(id: id,);
    return _dataConnect.query("GetUser", dataDeserializer, varsSerializer, vars);
  }
}

class GetUserUser {
  String id;
  String name;
  String email;
  String uid;
  GetUserUser.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),email = nativeFromJson<String>(json['email']),uid = nativeFromJson<String>(json['uid']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['email'] = nativeToJson<String>(email);
    json['uid'] = nativeToJson<String>(uid);
    return json;
  }

  GetUserUser({
    required this.id,
    required this.name,
    required this.email,
    required this.uid,
  });
}

class GetUserData {
  GetUserUser? user;
  GetUserData.fromJson(dynamic json):
  user = json['user'] == null ? null : GetUserUser.fromJson(json['user']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user != null) {
      json['user'] = user!.toJson();
    }
    return json;
  }

  GetUserData({
    this.user,
  });
}

class GetUserVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetUserVariables({
    required this.id,
  });
}

