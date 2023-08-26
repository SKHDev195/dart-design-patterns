import 'package:adapter_design_pattern/list_with_separator.dart';
import 'package:flutter/material.dart';

final class ListContext {
  late ListViewer _listViewer;
  ListViewer get listViewer => _listViewer;

  void setViewer(ListViewer listViewer) {
    _listViewer = listViewer;
  }

  Widget createList() => listViewer as Widget;
}
