function reset(){
	$("input").each(function(){
	    $(this).val(""); 
	});
	$("textarea").each(function () {
		$(this).val("");
    });
	window.onload = reload();
}

//将所有checkbox类型都和id为allOrNotAll的选中状态一致
function allOrNotAll(isChecked) {
    // var isChecked = $().prop("checked");
    console.log(isChecked);
    $("input[type='checkbox']").prop("checked", isChecked);
}

function getCheckedCheckbox(){
	return $('input[name="check"]:checked');
}



