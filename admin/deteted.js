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
        button.value = "X";
        button.style.color='red';
        button.onclick = (function(a) {
            return function() {
               deletePost(a);
            };
        })(id[i]);

        td = tr.insertCell();
        td.appendChild(button);
    }
    
    
    div.appendChild(tbl);
        
}
function getPosts() {
      
    $.ajax({    
        type: "POST",
        url: "http://localhost/tipster/api.php",
        data: "method=getDisapprovedPosts",
        success: function(response){
            var result=JSON.parse(response);     
            var content=JSON.parse(response).getDisapprovedPosts;
            var k;
            var i=0;
            
   
            $.each(content, function(k, value){ 
                //append(id,content[k].id);
                
                id[i]=content[k].id ;
                title[i]=unescape(content[k].title);
                body[i]=unescape(content[k].body);
                location_id[i]=content[k].location_id;
                tag_id[i]=content[k].tag_id;
                date_posted[i]=content[k].date_posted;
                i++;
                
            }); 
          makeTable(id,title,body,location_id,tag_id,date_posted);
        },
        error: function(xhr,rsult){  
            alert(rsult);
        }
    });
  
}
function deletePost(i){
   
        $.ajax({    
        type: "POST",
        url: "http://localhost/tipster/api.php",
        data: 'method=deletePost'+'&id='+i,
        success: function(response){
            var result=JSON.parse(response);     
            location.reload();
            
        },
        error: function(xhr){  
      
        }
    });
   
}





