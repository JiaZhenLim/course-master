function reset(){
	$("input").each(function(){
	    $(this).val(""); 
	});
	$("textarea").each(function () {
		$(this).val("");
    });
	window.onload = reload();
}

//绑定元素，使其点击能够使用laydate
laydate.render({
    elem: '.js_createTime' //指定元素
});