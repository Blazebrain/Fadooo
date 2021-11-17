// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TodoNameValueKey = 'todoName';
const String TodoContentValueKey = 'todoContent';

mixin $AddTodoView on StatelessWidget {
  final TextEditingController todoNameController = TextEditingController();
  final TextEditingController todoContentController = TextEditingController();
  final FocusNode todoNameFocusNode = FocusNode();
  final FocusNode todoContentFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    todoNameController.addListener(() => _updateFormData(model));
    todoContentController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            TodoNameValueKey: todoNameController.text,
            TodoContentValueKey: todoContentController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    todoNameController.dispose();
    todoNameFocusNode.dispose();
    todoContentController.dispose();
    todoContentFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get todoNameValue => this.formValueMap[TodoNameValueKey];
  String? get todoContentValue => this.formValueMap[TodoContentValueKey];

  bool get hasTodoName => this.formValueMap.containsKey(TodoNameValueKey);
  bool get hasTodoContent => this.formValueMap.containsKey(TodoContentValueKey);
}

extension Methods on FormViewModel {}
