function prepareList() {
    $('#expList').find('li:has(ul)')
    .click( function(event) {
        if (this == event.target) {
            $(this).toggleClass('expanded');
            $(this).children('ul').toggle('medium');
        }
        return false;
    })
    .addClass('collapsed')
    .children('ul').hide();

};

$(document).ready( function() {
    prepareList()
});

$.ajax({    
type: "POST",
url: "http://localhost/tipster/api.php",
data: "method=getUnapprovedPosts",
success: function(response){
    var result=JSON.parse(response);
    var content=JSON.parse(response).getUnapprovedPosts;
    $.each(result.getUnapprovedPosts, function(i, value) {
        alert(i+" "+value.id);
        /*
            alert(i+" "+value.id);
            alert(i+" "+value.title);
            alert(i+" "+value.body);
            alert(i+" "+value.location_id);
            alert(i+" "+value.tag_id);
            alert(i+" "+value.date_posted);*/
        });
    }
});