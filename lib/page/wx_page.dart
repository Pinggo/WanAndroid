import 'package:flutter/material.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/model/project_type_bean.dart';
import 'package:flutter_app/page/project_type_page.dart';
import 'package:flutter_app/page/wx_type_page.dart';

class WxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WxPageState();
  }
}

class _WxPageState extends State<WxPage> {
  List<ProjectTypeBean> projectTypes = [];

  @override
  void initState() {
    super.initState();
    fetchWxActicleTypes();
  }

  void fetchWxActicleTypes() async {
    try {
      var response = await HttpUtil.get(Api.URL + Api.WXARTICLE);
      BaseProjectTypeBean baseBean = BaseProjectTypeBean.fromJson(response);
      if (baseBean.errorCode == 0) {
        if (this.mounted) {
          setState(() {
            projectTypes = baseBean.data;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }
  Widget _getLoadingWidget(){
    return Scaffold(
      appBar: AppBar(
        title: Text('公众号'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (projectTypes.length == 0) {
      return _getLoadingWidget();
    }
    return DefaultTabController(
      length: projectTypes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('公众号'),
          bottom: TabBar(
            isScrollable: true,
            tabs: projectTypes.map((ProjectTypeBean projectType) {
              return Tab(
                text: projectType.name.replaceAll('&amp;', '&'),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: projectTypes.map((ProjectTypeBean projectType) {
            return WxTypePage(projectType.id);
          }).toList(),
        ),
      ),
    );
  }
}