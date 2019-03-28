class BaseBannerBean {
  String errorMsg;
  int errorCode;
  List<BannerBean> data;

  BaseBannerBean({this.errorMsg, this.errorCode, this.data, });

  BaseBannerBean.fromJson(Map<String, dynamic> json) {    
    this.errorMsg = json['errorMsg'];
    this.errorCode = json['errorCode'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => BannerBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMsg'] = this.errorMsg;
    data['errorCode'] = this.errorCode;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class BannerBean {
  String desc;
  String imagePath;
  String title;
  String url;
  int id;
  int isVisible;
  int order;
  int type;

  BannerBean({this.desc, this.imagePath, this.title, this.url, this.id, this.isVisible, this.order, this.type, });

  BannerBean.fromJson(Map<String, dynamic> json) {    
    this.desc = json['desc'];
    this.imagePath = json['imagePath'];
    this.title = json['title'];
    this.url = json['url'];
    this.id = json['id'];
    this.isVisible = json['isVisible'];
    this.order = json['order'];
    this.type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['imagePath'] = this.imagePath;
    data['title'] = this.title;
    data['url'] = this.url;
    data['id'] = this.id;
    data['isVisible'] = this.isVisible;
    data['order'] = this.order;
    data['type'] = this.type;
    return data;
  }
}
