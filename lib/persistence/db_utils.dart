import 'package:drift/drift.dart';
import 'package:undo/undo.dart';

extension TableUtils on GeneratedDatabase {
  Future<void> deleteRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final change = Change(
      val,
      () async => await delete(table as TableInfo).delete(val),
      (dynamic old) async => await into(table as TableInfo).insert(old),
    );
    cs.add(change);
  }

  Future<void> insertRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final change = Change(
      val,
      () async => await into(table as TableInfo).insert(val),
      (dynamic val) async => await delete(table as TableInfo).delete(val),
    );
    cs.add(change);
  }

  Future<void> updateRow(
    ChangeStack cs,
    Table table,
    Insertable val,
  ) async {
    final oldVal = await (select(table as TableInfo)..whereSamePrimaryKey(val))
        .getSingle();
    final change = Change(
      oldVal,
      () async => await update(table).replace(val),
      (dynamic old) async => await update(table).replace(old),
    );
    cs.add(change);
  }
}

Value<T> addField<T>(T? val, {T? fallback}) {
  Value<T>? oldFallback;

  if (fallback != null) {
    oldFallback = Value<T>(fallback);
  }

  if (val == null) {
    return oldFallback ?? const Value.absent();
  }

  if (val is String && (val == 'null' || val == 'Null')) {
    return oldFallback ?? const Value.absent();
  }

  return Value(val);
}
