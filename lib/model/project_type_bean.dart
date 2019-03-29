class BaseProjectTypeBean {
  String errorMsg;
  int errorCode;
  List<ProjectTypeBean> data;

  BaseProjectTypeBean({this.errorMsg, this.errorCode, this.data, });

  BaseProjectTypeBean.fromJson(Map<String, dynamic> json) {    
    this.errorMsg = json['errorMsg'];
    this.errorCode = json['errorCode'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => ProjectTypeBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMsg'] = this.errorMsg;
    data['errorCode'] = this.errorCode;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class ProjectTypeBean {
  String name;
  bool userControlSetTop;
  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;

  ProjectTypeBean({this.name, this.userControlSetTop, this.courseId, this.id, this.order, this.parentChapterId, this.visible, });

  ProjectTypeBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.userControlSetTop = json['userControlSetTop'];
    this.courseId = json['courseId'];
    this.id = json['id'];
    this.order = json['order'];
    this.parentChapterId = json['parentChapterId'];
    this.visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userControlSetTop'] = this.userControlSetTop;
    data['courseId'] = this.courseId;
    data['id'] = this.id;
    data['order'] = this.order;
    data['parentChapterId'] = this.parentChapterId;
    data['visible'] = this.visible;
    return data;
  }
}
