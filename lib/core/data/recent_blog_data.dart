import 'package:blog/core/model/simple_list_item_model.dart';

/// Minta utolsó blog bejegyzések adat.
class RecentBlogData {
  final blogData = const [
    SimpleListItemModel(title: "JavaScript alapok", description: "2025.02.10"),
    SimpleListItemModel(title: "RxJs subject", description: "2025.02.02"),
    SimpleListItemModel(title: "Dart stream", description: "2025.01.20"),
  ];
}
