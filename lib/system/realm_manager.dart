import 'package:realm/realm.dart';
import 'package:self_blog/system/realm_models.dart';

Realm? realm;

void initRealm() {
  var config = Configuration.local([Note.schema]);

  realm = Realm(config);
}

void write(RealmObject schemaObject) {
  if (realm == null) {
    initRealm();
  }
  realm!.write(() {
    realm!.add(schemaObject);
  });
}

List<Note> getNotes() {
  if (realm == null) {
    initRealm();
  }

  return List.from(realm!.all<Note>());
}
