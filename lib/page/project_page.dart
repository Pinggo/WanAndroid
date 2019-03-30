import 'package:flutter/material.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/model/project_type_bean.dart';
import 'package:flutter_app/page/project_type_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage> with AutomaticKeepAliveClientMixin{
  List<ProjectTypeBean> projectTypes = [];

  @override
  void initState() {
    super.initState();
    fetchProjectTypes();
  }

  void fetchProjectTypes() async {
    try {
      var response = await HttpUtil.get(Api.URL + Api.PROJECT_TYPE);
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
        title: Text('项目'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (projectTypes.length == 0) {
      return _getLoadingWidget();
    }
    return DefaultTabController(
      length: projectTypes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('项目'),
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
              return ProjectTypePage(projectType.id);
            }).toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}