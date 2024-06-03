// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String title,
  ) {
    RealmObjectBase.set(this, 'title', title);
  }

  Note._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObjectBase.getChanges<Note>(this);

  @override
  Stream<RealmObjectChanges<Note>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Note>(this, keyPaths);

  @override
  Note freeze() => RealmObjectBase.freezeObject<Note>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'title': title.toEJson(),
    };
  }

  static EJsonValue _toEJson(Note value) => value.toEJson();
  static Note _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'title': EJsonValue title,
      } =>
        Note(
          fromEJson(title),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Note._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
