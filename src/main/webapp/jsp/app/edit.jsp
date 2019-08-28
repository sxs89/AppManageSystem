<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>App后台信息管理系统</title>
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <%--引入头部--%>
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form" action="/app/edit" method="post">
                <input type="hidden" name="id" value="${app.id}">
                <div class="layui-form-item">

                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入软件名称" class="layui-input" value="${app.softwareName}">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">APK名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="apkName" lay-verify="title" autocomplete="off" placeholder="请输入APK名称" class="layui-input" value="${app.apkName}">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">支持ROM</label>
                        <div class="layui-input-inline">
                            <input type="text" name="supportROM" lay-verify="title" autocomplete="off" placeholder="请输入ROM名称" class="layui-input" value="${app.supportROM}">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">界面语言</label>
                        <div class="layui-input-inline">
                            <input type="text" name="interfaceLanguage" lay-verify="title" autocomplete="off" placeholder="请输入界面语言" class="layui-input" value="${app.interfaceLanguage}">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">软件大小</label>
                        <div class="layui-input-inline">
                            <input type="text" name="softwareSize" lay-verify="title" autocomplete="off" placeholder="请输入软件大小" class="layui-input" value="${app.softwareSize}">
                        </div>
                    </div>

                </div>

                <div class="layui-form-item">

                    <div class="layui-inline">
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="appStatus.valueId">
                                <option value="">--请选择--</option>
                                <c:forEach items="${appStatus}" var="obj">
                                    <option value="${obj.id}" <c:if test="${app.appStatus.id eq obj.id}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="flatform.valueId">
                                <option value="">--请选择--</option>
                                <c:forEach items="${appFlatforms}" var="obj">
                                    <option value="${obj.valueId}" <c:if test="${app.flatform.valueId eq obj.valueId}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOne">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelOne}" var="obj">
                                    <option value="${obj.id}"  <c:if test="${app.categoryLevel1.id eq obj.id}">
                                        selected
                                    </c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel2.id" id="levelTwo" lay-filter="levelTwo">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="categoryLevel3.id" id="levelThree" lay-filter="levelThree">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">应用简介</label>
                        <div class="layui-input-inline">
                            <input type="text" name="appInfo" lay-verify="title" autocomplete="off" placeholder="请输入应用简介" class="layui-input" value="${app.appInfo}">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    </div>
                </div>

            </form>
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

        //保留分级目录start=============================================
        $(function(){
            //取出一级分类的值,锁定二级的值
            var levelOne = $('#levelOne').val();
            if (levelOne != '' && levelOne != null){
                var levelTwo = '${app.categoryLevel2.id}';
                if (levelTwo != null && levelTwo != undefined && levelTwo != ''){
                    //二级曾经选过
                    $.ajax({
                        url:'/category/queryLevelTwoByLevelOne/' + levelOne,
                        type:'get',
                        success:function (data) {
                            //根据data修改数据，重新渲染即可
                            var html = '<option value="">--请选择--</option>';
                            var len = data.length;
                            <%--var levelTwo = '${appInfoDTO.levelTwoId}';--%>
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

                    var levelThree = '${app.categoryLevel3.id}';
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