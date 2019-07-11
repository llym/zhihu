<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div>
	<h4 class="ml-3 font-weight-bold">我的文章</h4>
</div>
<div id="ideas">
	<c:forEach items="${articles}" var="article">
		<div id="article-item">
			<div id="article-content">
				<div class="article">
					<p style="font-size: 18px; font-weight: bold">${article.articlename}</p>
					<p class="mt-1">
						<image id="${username}" src="common/image/head.jpg" onload ="getPhotoPath(this)" style="width:20px;height:20px"></image>
						${username}<span class="text-muted"><fmt:formatDate value="${idea.createtime}" pattern="yyyy-MM-dd"/></span>
					</p>
					<div class="mt-2" style="font-size: 16px">
						${article.articlecontent}
					</div>
					<button type="button" class="btn btn-sm agree mt-2"
						onclick="agreeArticle()" id="agreeA">
						赞同<span id="agreeArticle">${article.prisenumb}</span>
					</button>
					<button type="button" class="btn btn-sm cancel mt-2"
						onclick="cancelArticle()">▼</button>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>

</div>