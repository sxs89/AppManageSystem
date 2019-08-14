<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开发者登录</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body>

${errMsg}

<div class="layui-container">
    <form action="/dev/login" method="post" class="layui-form">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="devCode" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="test001">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="123456">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重填</button>
            </div>
        </div>
    </form>

</div>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>