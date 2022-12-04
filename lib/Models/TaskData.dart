class TaskData {
  final String id;
  final String imgUrl;
  final String title;
  final List<Map> tasks;
  final bool isCompleted;

  TaskData({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.tasks,
    required this.isCompleted,
  });
}
