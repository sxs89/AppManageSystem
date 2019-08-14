<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>App后台信息管理系统</title>
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css">
    <style>

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <%--引入头部--%>
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <form class="layui-form" action="/app/query" method="post">
                <div class="layui-form-item">
                    <input type="hidden" name="pageNum" value="1">
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" value="${appInfoDTO.softwareName}" class="layui-input">
                        </div>
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="appStatus">
                                <option value="">--请选择--</option>
                                <c:forEach items="${appStatus}" var="obj">
                                    <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.appStatus}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="appFlatform">
                                <option value="">--请选择--</option>
                                <c:forEach items="${appFlatforms}" var="obj">
                                    <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.appFlatform}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelOneId" id="levelOne" lay-filter="levelOne">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelOne}" var="obj">
                                    <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.levelOneId}">
                                        selected
                                    </c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelTwoId" id="levelTwo" lay-filter="levelTwo">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="levelThreeId" id="levelThree" lay-filter="levelThree">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                </div>
            </div>

            </form>

            <div class="layui-input-block">
                <a href="/app/toAdd" class="layui-btn">新增APP基础信息</a>
            </div>

            <table class="layui-table">
                <thead>
                    <tr>
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小（单位：M）</th>
                        <th>所属平台</th>
                        <th>所属分类（一级分类、二级分类、三级分类）</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${page.list}" var="obj">
                    <tr>
                        <td>${obj.softwareName}</td>
                        <td>${obj.apkName}</td>
                        <td>${obj.softwareSize}</td>
                        <td>
                            <c:if test="${obj.flatformId eq 1}">
                                手机
                            </c:if>
                            <c:if test="${obj.flatformId eq 2}">
                                平板
                            </c:if>
                            <c:if test="${obj.flatformId eq 3}">
                                通用
                            </c:if>
                        </td>
                        <td>
                            ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                        </td>
                        <td>
                            <c:if test="${obj.status eq 1}">
                                待审核
                            </c:if>
                            <c:if test="${obj.status eq 2}">
                                审核通过
                            </c:if>
                            <c:if test="${obj.status eq 3}">
                                审核不通过
                            </c:if>
                            <c:if test="${obj.status eq 4}">
                                已上架
                            </c:if>
                            <c:if test="${obj.status eq 5}">
                                已下架
                            </c:if>
                        </td>
                        <td>${obj.downloads}</td>
                        <td>${obj.newAppVersion.versionNo}</td>
                        <td>
                            <a class="layui-btn layui-btn-normal" href="/app/toEdit/${obj.id}"><i class="layui-icon">&#xe642;</i></a>
                            <a class="layui-btn layui-btn-danger" href="/app/delete/${obj.id}"><i class="layui-icon">&#xe640;</i></a>
                            <a class="layui-btn" href="/app/queryById/${obj.id}"><i class="layui-icon">&#xe615;</i></a>
                        </td>
                    </tr>
                    </c:forEach>

                    <tr>
                        <td>
                            共${page.total}条记录 第${page.pageNum} / ${page.pages}页
                        </td>
                        <td colspan="8">
                            <a href="javascript:void(0):" page="first">首页</a>
                            <a href="javascript:void(0):" page="prev">上一页</a>
                            <a href="javascript:void(0):" page="next">下一页</a>
                            <a href="javascript:void(0):" page="last">尾页</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <%--引入尾部--%>
    <jsp:include page="/jsp/common/footer.jsp"/>

</div>
<script src="/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;

        // 二级分类start=======================================
        form.on('select(levelOne)',function(){

            //获取id
            var levelOne = $('#levelOne').val();
            if (levelOne == ''){
                var html = '<option value="">--请选择--</option>';
                $("#levelTwo").html(html);
                form.render();    //重新渲染
                return;
            } else {
                $.ajax({
                    url:'/category/queryLevelTwoByLevelOne/' + levelOne,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据，重新渲染即可
                        var html = '<option value="">--请选择--</option>';
                        var len = data.length;
                        for (var i =0;i < len;i++){
                            html += '<option value="'+data[i].id+'">' + data[i].categoryName + '</option>';
                        }
                        //选择levelTwo更新
                        $("#levelTwo").html(html);
                        form.render();    //重新渲染
                    }
                });
            }
        });

        //二级分类end===================================================
        //三级分类start=================================================
        form.on('select(levelTwo)',function(){
            //获取已选择的二级分类的id
            var levelTwo = $('#levelTwo').val();
            if (levelTwo == ''){
                var html = '<option value="">--请选择--</option>';
                $("#levelTwo").html(html);
                form.render();    //重新渲染
                return;
            } else {
                $.ajax({
                   url:"/category/queryLevelThreeBylevelTwo/" + levelTwo,
                   type:"get",
                   success:function (data) {
                       //根据data修改数据，重新渲染即可
                       var html = '<option value="">--请选择--</option>';
                       var len = data.length;
                       for (var i=0;i<len;i++){
                           html += '<option value="'+data[i].id+'">' + data[i].categoryName + '</option>';
                       }
                       //重新更新levelThree
                       $("#levelThree").html(html);
                       form.render();
                   }
                });
            }
        });
        //三级分类end===================================================

        //分页时间start=================================================
        $('a[page]').click(function(){
           var pageNum = 1;  //当前页
           var currPage = '${page.pageNum}';
           var totalPages = '${page.pages}';   //总页数
           var v = $(this).attr('page');
           
           switch (v){
               case "first":
                   pageNum = 1;
                   break;
               case "prev":
                   pageNum = currPage - 1;
                   if (pageNum < 1){
                       pageNum = 1;
                   }
                   break;
               case "next":
                   pageNum = parseInt(currPage) + 1;
                   if (pageNum > totalPages){
                       pageNum = totalPages;
                   }
                   break;
               case "last":
                   pageNum = totalPages;
                   break;
           }

           //更新隐藏域里面的值
            $('input[name=pageNum]').val(pageNum);
           //提交表单
            $('form').submit();
        });
        //分页时间end===================================================

        //保留分级目录start=============================================
        $(function(){
            //取出一级分类的值,锁定二级的值
           var levelOne = $('#levelOne').val();
           if (levelOne != '' && levelOne != null){
               var levelTwo = '${appInfoDTO.levelTwoId}';
               if (levelTwo != null && levelTwo != undefined && levelTwo != ''){
                   //二级曾经选过
                   $.ajax({
                       url:'/category/queryLevelTwoByLevelOne/' + levelOne,
                       type:'get',
                       success:function (data) {
                           //根据data修改数据，重新渲染即可
                           var html = '<option value="">--请选择--</option>';
                           var len = data.length;
                           var levelTwo = '${appInfoDTO.levelTwoId}';
                           for (var i =0;i < len;i++){
                               html += '<option value="' + data[i].id + '"';
                               if (data[i].id == levelTwo) {
                                   html += ' selected ';
                               }
                               html += '>' + data[i].categoryName + '</option>'
                           }
                           //选择levelTwo更新
                           $("#levelTwo").html(html);
                           form.render();    //重新渲染
                       }
                   });

                   var levelThree = '${appInfoDTO.levelThreeId}';
                   $.ajax({
                       url:"/category/queryLevelThreeBylevelTwo/" + levelTwo,
                       type:"get",
                       success:function (data) {
                           //根据data修改数据，重新渲染即可
                           var html = '<option value="">--请选择--</option>';
                           var len = data.length;
                           for (var i=0;i<len;i++){
                               html += '<option value="' + data[i].id + '"';
                               if (data[i].id == levelThree) {
                                   html += ' selected ';
                               }
                               html += '>' + data[i].categoryName + '</option>'
                           }
                           //重新更新levelThree
                           $("#levelThree").html(html);
                           form.render();
                       }
                   });

               }
           }
        });
        //保留分级目录end===============================================
    });
</script>
</body>
</html>