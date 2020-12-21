

import 'package:api_todo/src/models/todo_model.dart';
import 'package:api_todo/src/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class Home_Controller {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final state =  ValueNotifier<HomeState>(HomeState.start);

  Home_Controller([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try{
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch(e){
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }