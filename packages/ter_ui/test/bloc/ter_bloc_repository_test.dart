import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ter_ui/ter_ui.dart';
import 'package:test/test.dart';

/// Egységteszt minta, mely már egy stream-el való interakciót is tesztel.
void main() {
  late TestModel model;
  late TestRepository repository;

  setUp(() {
    model = TestModel(id: 1, value: 'Test');
    repository = TestRepository();
  });

  group('TerBlocRepository', () {
    test('fromJson megfelelő kimenetet ad és a modellek megegyeznek azonos értékek esetén', () {
      expect(TestModel.fromJson(model.toJson()), repository.fromJson(model.toJson()));
    });

    test('addJsonData hozzáadja a megfelelő modell példányt a repository-hoz', () {
      expect(
        repository.dataStream,
        emitsInOrder([
          null,
          [model],
        ]),
      );

      repository.addJsonData([model.toJson()]);
    });
  });
}

class TestModel extends Equatable implements Model {
  /// Egyedi azonosító.
  @override
  final int? id;

  /// Felhasználó neve.
  final String? value;

  const TestModel({this.id, this.value});

  @override
  List<Object?> get props => [id, value];

  @override
  TestModel copyWith(Map<String, dynamic> data) {
    return TestModel(id: data['id'] ?? id, value: data['value'] ?? value);
  }

  @override
  Map<String, dynamic> toJson() => {'id': id, 'value': value}.filter((v) => v != null);

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel().copyWith(json);
}

class TestRepository with TerBlocRepository<TestModel> {
  @override
  TestModel fromJson(Map<String, dynamic> jsonData) {
    return TestModel.fromJson(jsonData);
  }
}
