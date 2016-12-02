
 var id = [];
var title = [];
var body = [];
var location_id = [];
var tag_id = [];
var date_posted = []; 
function prepareList() {
    
    $.ajax({    
        type: "POST",
        url: "https://localhost/tipster/api.php",
        data: "method=getApprovedPosts",
        success: function(response){
            var result=JSON.parse(response);     
            var content=JSON.parse(response).getApprovedPosts;
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
        }
    });
};
function makeTable(id,title,body,location,tag_id,date_posted){
      var div = document.getElementById("showData");
   
    for(var i = 0; i < id.length; i++){
        var titre = document.createElement('h');
        titre.textContent=title[i];
        var date = document.createElement('date');
        date.textContent="\n Posted on "+date_posted[i];
        var lieu=document.createElement('l');
        lieu.textContent=location[i];
        var tag=document.createElement('tg');
        tag.textContent='#'+tag_id[i];
        var newParagraph = document.createElement('p');
       // newParagraph.title=title[i];
       var br = document.createElement("br");
       
       
        newParagraph.textContent=body[i];
        div.appendChild(titre);
        div.appendChild(tag);
        div.appendChild(br);
        div.appendChild(date);
        div.appendChild(newParagraph);
        div.appendChild(lieu);
        div.appendChild(document.createElement('hr'));
    }
     
        
}
$(document).ready( function() {
    prepareList();
});