/*function prepareList() {
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
/*
$.ajax({    
type: "POST",
url: "http://localhost/tipster/api.php",
data: "method=getUnapprovedPosts",
success: function(response){
    var result=JSON.parse(response);
    var content=JSON.parse(response).getUnapprovedPosts;
    var id = [];
    var title = [];
    var body = [];
    var location_id = [];
    var tag_id = [];
    var date_posted = [];
    $.each(result.getUnapprovedPosts, function(i, value) {
        id[i]=value.id;
        title[i]=value.title;
        body[i]=value.body;
        location_id[i]=value.location_id;
        tag_id[i]=value.tag_id;
        date_posted[i]=value.date_posted;


   
        /*
            alert(i+" "+value.id);
            alert(i+" "+value.title);
            alert(i+" "+value.body);
            alert(i+" "+value.location_id);
            alert(i+" "+value.tag_id);
            alert(i+" "+value.date_posted);*/
            /*
        });
    }
});

function CreateTableFromJSON() {
        var myBooks = [
            {
                "Book ID": "1",
                "Book Name": "Computer Architecture",
                "Category": "Computers",
                "Price": "125.60"
            },
            {
                "Book ID": "2",
                "Book Name": "Asp.Net 4 Blue Book",
                "Category": "Programming",
                "Price": "56.00"
            },
            {
                "Book ID": "3",
                "Book Name": "Popular Science",
                "Category": "Science",
                "Price": "210.40"
            }
        ]

        // EXTRACT VALUE FOR HTML HEADER. 
        // ('Book ID', 'Book Name', 'Category' and 'Price')
        var col = [];
        for (var i = 0; i < myBooks.length; i++) {
            for (var key in myBooks[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th");      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
        }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < myBooks.length; i++) {

            tr = table.insertRow(-1);

            for (var j = 0; j < col.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = myBooks[i][col[j]];
            }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);


    }
*/
function CreateTableFromJSON() {
    var id = [];
    var title = [];
    var body = [];
    var location_id = [];
    var tag_id = [];
    var date_posted = [];
    $.ajax({    
        type: "POST",
        url: "http://localhost/tipster/api.php",
        data: "method=getUnapprovedPosts",
        success: function(response){
            var result=JSON.parse(response);
            var content=JSON.parse(response).getUnapprovedPosts;
            var k;
            for(var k in content){
                
                id[k]=content[k].id ;
                title[k]=content[k].title;
                body[k]=content[k].body;
                location_id[k]=content[k].location_id;
                tag_id[k]=content[k].tag_id;
                date_posted[k]=content[k].date_posted;
            }              
        }
    });
    
    //
        
    
    //
    var table=document.createElement("table");
                    // TABLE ROW.

    for (var i = 0; i < id.length; i++) {
        var th = document.createElement("th");      // TABLE HEADER.
        th.innerHTML = id[i];
        tr.appendChild(th);
    }
    
    

     // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < id.length; i++) {
            tr = table.insertRow(-1);
            for (var j = 0; j < id.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = id[i][title[j]];
            }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = id.length;
        divContainer.appendChild(table);

}





