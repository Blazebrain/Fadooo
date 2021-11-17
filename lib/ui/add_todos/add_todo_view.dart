import 'package:flutter/material.dart';
import '../home_view/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_todo_view.form.dart';
import 'add_todo_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'todoName'),
  FormTextField(name: 'todoContent'),
])
class AddTodoView extends StatelessWidget with $AddTodoView {
  AddTodoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTodoModel>.reactive(
      viewModelBuilder: () => AddTodoModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Add New Todo'),
          ),
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: todoNameController,
                              focusNode: todoNameFocusNode,
                              decoration: const InputDecoration(
                                label: Text('Title'),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: todoContentController,
                              focusNode: todoContentFocusNode,
                              decoration: const InputDecoration(
                                label: Text('Content'),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: () async {
                                await viewModel.createTodo(
                                  todoNameController.text,
                                  todoContentController.text,
                                );
                              },
                              child: const Text('Create Todo'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
