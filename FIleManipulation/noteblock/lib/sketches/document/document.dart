class Document {
  late String title;
  late String data;

  Document({required this.title, required this.data});

  Document.fromJSON(Map map) {
    title = map["title"];
    data = map["data"];
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "data": data,
    };
  }
}
