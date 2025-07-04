import 'package:rxdart/rxdart.dart';
import 'package:ter_ui/bloc/ter_disposable.dart';
import 'package:ter_ui/data/data.dart';

/// Mixin mely támogatás ad a gyakori repository igényekhez.
mixin TerBlocRepository<T extends Model> implements Disposable {
  /// A betöltött adatot stream-elő rx subject.
  final _dataSubject = BehaviorSubject<List<T>?>.seeded(null);

  /// Adathozzáféréshez stream amit például a bloc használhat.
  ValueStream<List<T>?> get dataStream => _dataSubject.stream;

  /// Az aktuálisan betöltött adatokhoz közvetlen hozzáférés.
  List<T>? get data => _dataSubject.value;

  /// A paraméterben kapott [data] hozzáadása a belső stream-hez.
  void addData(List<T>? data) {
    _dataSubject.add(data);
  }

  /// A paraméterben kapott [data] modellé alakítása majd hozzáadása a belső
  /// stream-hez.
  ///
  /// Lásd [fromJson] [addData].
  void addJsonData(List<Map<String, dynamic>>? data) {
    if (data != null) {
      final modelListResult = data.map((row) => fromJson(row)).toList();

      addData(modelListResult);
    } else {
      addData(null);
    }
  }

  /// Hiba hozzáadása.
  ///
  /// Lásd [BehaviorSubject.addError]
  void addError(Object error, [StackTrace? stackTrace]) {
    _dataSubject.addError(error, stackTrace);
  }

  /// Szerkesztés befejezése, de még előtte a szerkesztett modell alkalmazása a tárolt adat
  /// listában, ha új modell volt, akkor beszúrás, ha meglévő akkor csere.
  void applyEdit(T model) {
    if (model.id == null) {
      final newData = [...data!, model];

      addData(newData);
    } else {
      final index = data!.indexWhere((m) => model.id == m.id);

      data![index] = model;

      addData([...data!]);
    }
  }

  /// Törlés végrehajtása, modell eltávolítása az adatok közül.
  void applyDelete(T model) {
    data!.removeWhere((m) => model.id == m.id);

    addData([...data!]);
  }

  /// A kapott [jsonData] dinamikus adatból modell készítése.
  T fromJson(Map<String, dynamic> jsonData);

  @override
  void dispose() {
    _dataSubject.close();
  }
}
