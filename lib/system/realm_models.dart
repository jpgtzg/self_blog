// Written by Juan Pablo Gutiérrez
// 3 06 2024

import 'dart:html';

import 'package:realm/realm.dart';

part 'realm_models.realm.dart';

// TODO MUSIC attribute
@RealmModel()
class _Note {
  late String date;
  late List<_Entry> entries;
}

@RealmModel(ObjectType.embeddedObject)
class _Entry{
  late String emotion;
  late String text;
}
