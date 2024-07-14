class Groups {
  List<GetAllGroupsResult>? getAllGroupsResult;

  Groups({this.getAllGroupsResult});

  Groups.fromJson(Map<String, dynamic> json) {
    if (json['getAllGroups_Result'] != null) {
      getAllGroupsResult = <GetAllGroupsResult>[];
      json['getAllGroups_Result'].forEach((v) {
        getAllGroupsResult!.add(GetAllGroupsResult.fromJson(v));
      });
    }
  }
}

class GetAllGroupsResult {
  String? id;
  int? t;
  String? name;
  List? labels;
  GetAllGroupsResult({this.id, this.t, this.name, this.labels});

  GetAllGroupsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    t = json['t'];
    name = json['name'];
    labels = json['labels'];
  }
}
