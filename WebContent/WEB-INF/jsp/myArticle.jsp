<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.image3{
	width:50%;
	height:50%;
}
</style>

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
					<div class="row m-3">
					<img id="${article.photo}" alt="文章的图片" class="image3"
						src="${article.photo}">
					</div>
					<div class="mt-2" style="font-size: 16px">
						${article.articlecontent}
					</div>
					<button type="button" class="btn btn-sm agree mt-2"
						onclick="agreeArticle()" id="agreeA">
						赞同<span id="agreeArticle">${article.prisenumb}</span>
					</button>
					<button type="button" class="btn btn-sm cancel mt-2"
						onclick="cancelArticle()">▼</button>
					<a class="" href="#" onclick="deleteArticle(${article.articleid})"><small>删除</small></a>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
<script>
	function deleteArticle(id){
		if(confirm("确认删除？")){
			$.post("deleteArticle.do",{
				id:id
			},function(data){
				alert(data)
				window.location.href="myPage.do";
				
			});
			
		}
	}
</script>
</div>