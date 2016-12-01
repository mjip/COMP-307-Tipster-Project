 var id = [];
var title = [];
var body = [];
var location_id = [];
var tag_id = [];
var date_posted = []; 

$(document).ready(function() { getPosts(); });
function makeTable(id,title,body,location,tag_id,date_posted){
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
        
        var button = document.createElement("input");
        button.type = "button";
        button.value = "OK";
        button.click(approve());
        var notok = document.createElement("input");
        notok.type = "button";
        notok.value = "X";
        notok.style.color='red';
        td = tr.insertCell();
        td.appendChild(button);
        td.appendChild(notok);
        //td.appendChild(document.createTextNode(id[i]));
        //td = tr.insertCell();
        
        //td = tr.insertCell();
        //td.appendChild(document.createTextNode(location[i]));
    }
    
    
    div.appendChild(tbl);
        
}
function getPosts() {
   
    $.ajax({    
        type: "POST",
        url: "http://localhost/tipster/api.php",
        data: "method=getUnapprovedPosts",
        success: function(response){
            var result=JSON.parse(response);     
            var content=JSON.parse(response).getUnapprovedPosts;
            var k;
            var i=0;
            //alert(id.length);
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
  
}
function approve(){
    alert("yo");
}





