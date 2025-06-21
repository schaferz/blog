import 'package:ter_ui/bloc/ter_disposable.dart';
import 'package:ter_ui/data/data.dart';
import 'package:rxdart/rxdart.dart';

/// Mixin mely támogatás ad a gyakori repository igényekhez.
mixin TerBlocRepository<T extends Model> implements Disposable {
  /// A betöltött adatot stream-elő rx subject.
  final _dataSubject = BehaviorSubject<List<T>?>.seeded(null);

  /// Adathozzáféréshez stream amit például a bloc használhat.
  ValueStream<List<T>?> get dataStream => _dataSubject.stream;

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

  /// A kapott [jsonData] dinamikus adatból modell készítése.
  T fromJson(Map<String, dynamic> jsonData);

  @override
  void dispose() {
    _dataSubject.close();
  }
}
