class PostCommentModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostCommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  @override
  String toString() {
    return 'PostCommentsModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
      postId: json['postId'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };
}
