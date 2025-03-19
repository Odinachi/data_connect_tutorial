# note_connector SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
NoteConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetUsers
#### Required Arguments
```dart
// No required arguments
NoteConnector.instance.getUsers().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUsersData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await NoteConnector.instance.getUsers();
GetUsersData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = NoteConnector.instance.getUsers().ref();
ref.execute();

ref.subscribe(...);
```


### GetUser
#### Required Arguments
```dart
String uid = ...;
NoteConnector.instance.getUser(
  uid: uid,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserData, GetUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await NoteConnector.instance.getUser(
  uid: uid,
);
GetUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String uid = ...;

final ref = NoteConnector.instance.getUser(
  uid: uid,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetNotes
#### Required Arguments
```dart
// No required arguments
NoteConnector.instance.getNotes().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetNotesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await NoteConnector.instance.getNotes();
GetNotesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = NoteConnector.instance.getNotes().ref();
ref.execute();

ref.subscribe(...);
```


### GeUserNotes
#### Required Arguments
```dart
String id = ...;
NoteConnector.instance.geUserNotes(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GeUserNotesData, GeUserNotesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await NoteConnector.instance.geUserNotes(
  id: id,
);
GeUserNotesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = NoteConnector.instance.geUserNotes(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetNote
#### Required Arguments
```dart
String id = ...;
NoteConnector.instance.getNote(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetNoteData, GetNoteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await NoteConnector.instance.getNote(
  id: id,
);
GetNoteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = NoteConnector.instance.getNote(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateUser
#### Required Arguments
```dart
String uid = ...;
String email = ...;
String name = ...;
NoteConnector.instance.createUser(
  uid: uid,
  email: email,
  name: name,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserData, CreateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await NoteConnector.instance.createUser(
  uid: uid,
  email: email,
  name: name,
);
CreateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String uid = ...;
String email = ...;
String name = ...;

final ref = NoteConnector.instance.createUser(
  uid: uid,
  email: email,
  name: name,
).ref();
ref.execute();
```


### CreateNote
#### Required Arguments
```dart
String title = ...;
String content = ...;
String userId = ...;
NoteConnector.instance.createNote(
  title: title,
  content: content,
  userId: userId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateNoteData, CreateNoteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await NoteConnector.instance.createNote(
  title: title,
  content: content,
  userId: userId,
);
CreateNoteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String title = ...;
String content = ...;
String userId = ...;

final ref = NoteConnector.instance.createNote(
  title: title,
  content: content,
  userId: userId,
).ref();
ref.execute();
```


### DeleteNote
#### Required Arguments
```dart
String id = ...;
NoteConnector.instance.deleteNote(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteNoteData, DeleteNoteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await NoteConnector.instance.deleteNote(
  id: id,
);
DeleteNoteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = NoteConnector.instance.deleteNote(
  id: id,
).ref();
ref.execute();
```


### UpdateNote
#### Required Arguments
```dart
String id = ...;
String title = ...;
String content = ...;
NoteConnector.instance.updateNote(
  id: id,
  title: title,
  content: content,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateNoteData, UpdateNoteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await NoteConnector.instance.updateNote(
  id: id,
  title: title,
  content: content,
);
UpdateNoteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String title = ...;
String content = ...;

final ref = NoteConnector.instance.updateNote(
  id: id,
  title: title,
  content: content,
).ref();
ref.execute();
```

