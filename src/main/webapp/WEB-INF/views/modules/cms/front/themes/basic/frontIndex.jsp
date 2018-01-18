<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
</head>
<body>
    <div class="hero-unit" style="padding-bottom:35px;margin:10px 0;">
      <c:set var="article" value="${fnc:getArticle('2')}"/>
      <h1>${fns:abbr(article.title,28)}</h1><p></p>
      <p>${fns:abbr(fns:replaceHtml(article.articleData.content),260)}</p>
      <p><a href="${article.url}" class="btn btn-primary btn-large">&nbsp;&nbsp;&nbsp;查看详情 &raquo;&nbsp;&nbsp;&nbsp;</a></p>
    </div>
    <div class="row clearfix home-function">
        <div id="quick-search">
            <i></i>
            <h4>快速查询</h4>
            <p>快速查询订单</p>
            <input type="text" placeholder="请输入快件单号" id="switch-input">
        </div>
        <div id="quick-mail">
            <i></i>
            <h4>快速寄件</h4>
            <p>在线寄件方便快捷</p>
        </div>
        <div id="quick-evaluate">
            <i></i>
            <h4>快速评价</h4>
            <p>输入单号进行评价</p>
        </div>
    </div>
    <div class="row">
      <div class="span4">
        <h4><small><a href="${ctx}/list-2${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>组织机构</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, 2, 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
      <div class="span4">
        <h4> <small><a href="${ctx}/list-6${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>质量监督</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, 6, 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
      <div class="span4">
        <h4><small><a href="${ctx}/list-10${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>政策法规</h4>
		<ul><c:forEach items="${fnc:getArticleList(site.id, 10, 8, '')}" var="article">
			<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${article.url}" style="color:${article.color}">${fns:abbr(article.title,28)}</a></li>
		</c:forEach></ul>
      </div>
    </div>
    <div class="modal hide fade" id="online-mail" aria-backdrop="hidden">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>快速寄件</h3>
        </div>
        <div class="modal-body">
            <table>
                <caption>收件人信息</caption>
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 50%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <td>*姓名</td>
                        <td colspan="2">
                            <input type="text" placeholder="请输入收件人姓名">
                            <span>收件人姓名应该为2-20位之间</span>
                        </td>
                    </tr>
                    <tr>
                        <td>*手机/固话</td>
                        <td colspan="2">
                            <input type="text" placeholder="请输入收件人手机/固话" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)">
                            <span>请输入正确的手机/固话格式</span>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">*收货地址</td>
                        <td colspan="2">
                            <input type="text" placeholder="请选择省/市/区">
                            <span>请选择收件人地址省/市/区</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" placeholder="详细地址（街道/门牌信息）">
                        </td>
                        <td>
                            <span>收件人详细地址应该为3-100位之间</span>
                        </td>
                    </tr>
                    <tr>
                        <td>重量</td>
                        <td colspan="2">
                            <input type="text" placeholder="重量">KG
                            <span>重量在0.1-50KG之间</span>
                        </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="2"><textarea name="" id=""  rows="2" placeholder="易碎品、液体、贵重物品等特别说明"></textarea></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <caption>寄件人信息</caption>
                <tbody>
                <tr>
                    <td>*姓名</td>
                    <td>
                        <input type="text" placeholder="请输入寄件人姓名">
                        <span>寄件人姓名应该为2-20位之间</span>
                    </td>
                </tr>
                <tr>
                    <td>*手机/固话</td>
                    <td>
                        <input type="text" placeholder="请输入寄件人手机/固话" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)">
                        <span>请输入正确的手机/固话格式</span>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">*上门地址</td>
                    <td colspan="2">
                        <input type="text" placeholder="请选择省/市/区">
                        <span>请选择寄件人地址省/市/区</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" placeholder="详细地址（街道/门牌信息）">
                    </td>
                    <td>
                        <span>寄件人详细地址应该为3-100位之间</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-primary">提交</a>
        </div>
    </div>
    <div class="modal hide fade" id="online-evaluate" aria-backdrop="hidden">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>快速评价</h3>
        </div>
        <div class="modal-body">
            <table>
                <colgroup>
                    <col>
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <td>快递单号</td>
                        <td><input type="text" placeholder="请输入快递单号"></td>
                    </tr>
                    <tr>
                        <td>评价内容</td>
                        <td>
                            <textarea name="" id=""  rows="5"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-primary">提交</a>
        </div>
    </div>
    <script>
        $(function(){
            var $quickMail = $("#quick-mail"),
                $quickSearch = $("#quick-search"),
                $quickEvaluate = $("#quick-evaluate");

            var $onlineMail = $("#online-mail"),
                $onlineEvaluate = $("#online-evaluate");

            //快速查询
           var $swiInput = $("#switch-input"),
               searchNumStr = "<div class='quick-sea'>"+
                   "<h4>快速查询</h4>"+
                   "<textarea name='' id='' cols='30' rows='6'></textarea>"+
                   "<div><button type='button'>查询</button></div></div>";

            $swiInput.on("click",function(){
                $quickSearch.html("");
                $quickSearch.html(searchNumStr);
            });

            //快速寄件
            $quickMail.on("click",function(){
                $onlineMail.modal();
            });

            //快速评价
            $quickEvaluate.on("click",function(){
                $onlineEvaluate.modal();
            });
        });
    </script>
</body>
</html>