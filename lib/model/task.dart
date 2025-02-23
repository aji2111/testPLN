class Task {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Task({this.userId, this.id, this.title, this.completed});

  Task.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
