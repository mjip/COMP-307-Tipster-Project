
 var id = [];
var title = [];
var body = [];
var location_id = [];
var tag_id = [];
var date_posted = []; 
function prepareList() {
    /*
    $('#expList').find('li:has(ul)')
    .click( function(event) {
        if (this == event.target) {
            $(this).toggleClass('expanded');
            $(this).children('ul').toggle('medium');
        } 
        return false; 
    })
    .addClass('collapsed')
    .children('ul').hide();*/
    
    $.ajax({    
        type: "POST",
        url: "http://localhost/tipster/api.php",
        data: "method=getApprovedPosts",
        success: function(response){
            var result=JSON.parse(response);     
            var content=JSON.parse(response).getApprovedPosts;
            var k;
            var i=0;
           
            $.each(content, function(k, value){ 
                //append(id,content[k].id);
                
                id[i]=content[k].id ;
                title[i]=content[k].title;
                body[i]=content[k].body;
                location_id[i]=content[k].location_id;
                tag_id[i]=content[k].tag_id;
                date_posted[i]=content[k].date_posted;
                i++;
                
            }); 
            
          makeTable(id,title,body,location_id,tag_id,date_posted);
        }
    });
};
function makeTable(id,title,body,location,tag_id,date_posted){/*
      var div = document.getElementById("showData"),
        tbl  = document.getElementById('tab');

    for(var i = 0; i < id.length; i++){
        var tr = tbl.insertRow();
 
        var td = tr.insertCell();
        td.appendChild(document.createTextNode(title[i]));
        td = tr.insertCell();
        td.appendChild(document.createTextNode(body[i]));
        td = tr.insertCell();
        td.appendChild(document.createTextNode(date_posted[i]));
        

        //td.appendChild(document.createTextNode(id[i]));
        //td = tr.insertCell();
        
        //td = tr.insertCell();
        //td.appendChild(document.createTextNode(location[i]));
        
    }
    
    
    div.appendChild(tbl);*/
    for(var i = 0; i < id.length; i++){
        var titre = document.createElement('h');
        titre.textContent=title[i];
        var date = document.createElement('date');
        date.textContent="\n Posted on "+date_posted[i];
        var newParagraph = document.createElement('p');
       // newParagraph.title=title[i];
       var br = document.createElement("br");
       
        newParagraph.textContent=body[i];
        document.getElementById("showData").appendChild(titre);
        document.getElementById("showData").appendChild(br);
        document.getElementById("showData").appendChild(date);
        document.getElementById("showData").appendChild(newParagraph);
    }
     
        
}
$(document).ready( function() {
    prepareList();
});