import 'package:get/get.dart';
import 'package:my_task/app/data/db/db_helper.dart';
import 'package:my_task/app/data/models/task_model.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <TaskModel>[].obs;

  //add the task
  Future<int> addTask({TaskModel? task}) async {
    return await DBHelper.insert(task);
  }

  // get all task from the table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }

  void delete(TaskModel task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
