
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
        },
        error: function(xhr){
           
            var table = document.getElementById("statTable");
            table.appendChild( document.createTextNode("No stats to show"));
        }
    });
};
function makeTable(id,title,body,location,tag_id,date_posted){
      var div = document.getElementById("showData");
   
    for(var i = id.length-1;i>=0; i--){
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
    makeStats(location,tag_id);
     
        
}
function makeStats(location,tag_id){
    
    var count={} ;
    for(var i = 0; i< location.length; i++) {
        var num = location[i];
        count[num] = count[num] ? count[num]+1 : 1;
    }
    
    var arr= Object.keys(count);

    /*
    var noDup = location.filter(function(item, pos) {
    return location.indexOf(item) === pos;
    });*/
    
    
    
    var div = document.getElementById("stats");
    var table = document.getElementById("statTable");
     var tr = document.createElement('tr');

    var bor=tr.appendChild( document.createElement('th') );
    bor.appendChild( document.createTextNode('Boroughs') );
    //var occ=tr.appendChild( document.createElement('th') );
    var tot=tr.appendChild( document.createElement('th') );

    
    //occ.appendChild( document.createTextNode('#') );
    tot.appendChild( document.createTextNode('Incidents') );
    table.appendChild(tr);
    for(var i = arr.length-1;i>=0; i--){
      
        var row = table.insertRow();
        var td = row.insertCell('td');
        var t=td.appendChild( document.createElement('th') );
        t.appendChild(document.createTextNode(arr[i]));
        var td = row.insertCell();
        td.appendChild(document.createTextNode(count[arr[i]]));
    }
   
    
    
    //var tr = table.insertRow();
       /*
        div.appendChild(document.createTextNode(""));
        div.appendChild(tag);
        div.appendChild(br);
        div.appendChild(date);
        div.appendChild(newParagraph);
        div.appendChild(lieu);
        div.appendChild(document.createElement('hr'));*/
    
}
$(document).ready( function() {
    prepareList();
    
});