module.exports = {
    Content: function(title,list, body, control){
       return `
       <!doctype html>
       <html>
       <head>
       <title>D Restaurant</title>
       <meta charset="utf-8">
       <link rel="stylesheet" type="text/css" href="../css/main_style.css" />
       </head>
       <body>   
       <h1><a href ="/">D Restaurnat</a></h1>
       Transaction History<br><br>
       Customers : 
       <div id ="list">
        ${list}    
        </div>
       <div class = "result">${body}</div><br>
       ${control}
       </body>
       </html>    
       `;    
    },
    List: function(filelist){
        var i = 0;
        var list = '<ol>';
        while(i < filelist.length){
            list = list + `<li><a href ="/page/${filelist[i]}">${filelist[i]}</a></li>`;
            i++;  
        }    
        list = list + '</ol>';
        return list;        
    }
}
