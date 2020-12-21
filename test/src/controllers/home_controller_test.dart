import 'package:api_todo/src/controllers/home_controller.dart';
import 'package:api_todo/src/models/todo_model.dart';
import 'package:api_todo/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository{}

main(){

  final repository = TodoRepositoryMock();
  final controller = Home_Controller(repository);

  test('deve modificar o estado para error se a requisição falhar', () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });

}