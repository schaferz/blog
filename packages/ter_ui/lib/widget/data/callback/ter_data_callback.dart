import 'package:ter_ui/ter_ui.dart';

/// Oszlop funkció esetén használható callback, ahol nincs sor kontextus.
typedef TerColumnActionCallback = void Function(TerColumn column);

/// Cellában lévő funkció esetén használható callback sorral.
typedef TerRowActionCallback = void Function(TerColumn column, JsonData data);
