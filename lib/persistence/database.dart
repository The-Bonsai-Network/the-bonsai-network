import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:undo/undo.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [],
  daos: [],
)
class BonsaiDatabase extends _$BonsaiDatabase {
  BonsaiDatabase() : super(_openConnection());

  final cs = ChangeStack();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    },
  );
}
