$(document).on('click', '.deleteInvoice', function(){
var id = $(this).attr("id");
if(confirm("Are you sure you want to remove this?")){
$.ajax({
url:"action.php",
method:"POST",
dataType: "json",
data:{id:id, action:'delete_invoice'},
success:function(response) {
if(response.status == 1) {
$('#'+id).closest("tr").remove();
}
}
});
} else {
return false;
}
});