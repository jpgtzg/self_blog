// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String date, {
    Iterable<Entry> entries = const [],
  }) {
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set<RealmList<Entry>>(
        this, 'entries', RealmList<Entry>(entries));
  }

  Note._();

  @override
  String get date => RealmObjectBase.get<String>(this, 'date') as String;
  @override
  set date(String value) => RealmObjectBase.set(this, 'date', value);

  @override
  RealmList<Entry> get entries =>
      RealmObjectBase.get<Entry>(this, 'entries') as RealmList<Entry>;
  @override
  set entries(covariant RealmList<Entry> value) =>
      throw RealmUnsupportedSetError();

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
      'date': date.toEJson(),
      'entries': entries.toEJson(),
    };
  }

  static EJsonValue _toEJson(Note value) => value.toEJson();
  static Note _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'date': EJsonValue date,
        'entries': EJsonValue entries,
      } =>
        Note(
          fromEJson(date),
          entries: fromEJson(entries),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Note._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('date', RealmPropertyType.string),
      SchemaProperty('entries', RealmPropertyType.object,
          linkTarget: 'Entry', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Entry extends _Entry with RealmEntity, RealmObjectBase, EmbeddedObject {
  Entry(
    String emotion,
    String text,
  ) {
    RealmObjectBase.set(this, 'emotion', emotion);
    RealmObjectBase.set(this, 'text', text);
  }

  Entry._();

  @override
  String get emotion => RealmObjectBase.get<String>(this, 'emotion') as String;
  @override
  set emotion(String value) => RealmObjectBase.set(this, 'emotion', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  Stream<RealmObjectChanges<Entry>> get changes =>
      RealmObjectBase.getChanges<Entry>(this);

  @override
  Stream<RealmObjectChanges<Entry>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Entry>(this, keyPaths);

  @override
  Entry freeze() => RealmObjectBase.freezeObject<Entry>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'emotion': emotion.toEJson(),
      'text': text.toEJson(),
    };
  }

  static EJsonValue _toEJson(Entry value) => value.toEJson();
  static Entry _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'emotion': EJsonValue emotion,
        'text': EJsonValue text,
      } =>
        Entry(
          fromEJson(emotion),
          fromEJson(text),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Entry._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.embeddedObject, Entry, 'Entry', [
      SchemaProperty('emotion', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
