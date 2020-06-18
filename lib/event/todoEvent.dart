import '../task.dart';

enum EventType { add, delete }

class ToDoEvent {
  Task task;
  String id;
  EventType eventType;

  ToDoEvent.add(Task task) {
    this.eventType = EventType.add;
    this.task = task;
  }

  ToDoEvent.delete(String id) {
    this.eventType = EventType.delete;
    this.id = id;
  }
}
