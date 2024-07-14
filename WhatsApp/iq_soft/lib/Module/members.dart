class Members {
  String? id;
  bool? isAdmin;
  bool? isSuperAdmin;

  Members({this.id, this.isAdmin, this.isSuperAdmin});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdmin = json['isAdmin'];
    isSuperAdmin = json['isSuperAdmin'];
  }
}
