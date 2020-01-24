var express = require('express');
var app = express();
var template = require('./lib/template.js');
var bodyParser = require('body-parser');
var fs = require('fs');
var path = require('path');
var qs = require('querystring');

app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(__dirname + '/public'));

// main
app.get('/', function(req, res){
    fs.readdir('./tipHistory', function(err, filelist){
        var title = 'Welcome';
        var description = 'Hi, this is a main page. Welcome! Thank you for visiting here.';
        var list = template.List(filelist);
        var content = template.Content(title, list, `${description}`, `
        <input class = "mainBtn" type = "button" value = "Tip Calculator" onclick="location.href = '/tip'">`);
        
        res.send(content);
    })        
});

// customer info
app.get('/page/:pageId', function(req, res){
    fs.readdir('./tipHistory', function(err, filelist){        
        fs.readFile(`./tipHistory/${req.params.pageId}`, function(err, description){
            var title= req.params.pageId;
            var list = template.List(filelist);
            var content = template.Content(title, list, `${description}`, `             
            <form action = "/delete_process" method = "post">                     
            <input class = "mainBtn" type = "button" value = "Tip Calculator" onclick="location.href = '/tip'">
            <input type = "hidden" name = "id" value = ${title}>
            <input class = "mainBtn" type = "submit" value = "Delete" onclick = "return confirm('Are you sure you want to delete it?');">
            <input class = "mainBtn mainBtn_Home" type = "button" value = "Home" onclick="location.href = '/'";>
            </form>            
            `
            );
            res.send(content);
        })
    })
})

// tip calculator
app.get('/tip', function(req, res){    
    res.send(
        `<!DOCTYPE html>
        <html>
            <head>
                <title>Tip Calculator</title>
                <meta charset="utf-8">        
                <link rel="stylesheet" type="text/css" href="css/tip_style.css" />
            </head>
            <body>                        
                <header>
                <h1>Tip Calculator</h1></header>
                <div id = "bottomBorder"></div>
                <div class = "contentsCss">
                    <div class = "contents">
                        <form action ="/tip_process" method = "post">
                            <p>Customer Number</p>
                                <p># <input type = "text" name = "custNum"></p>
                            <p>How much was your bill?</p>
                                <p>$<input type = "text" name = "initCal" placeholder = "Bill Amount"></p>
                            <p>How was your service?</P>
                                <input type = "text" name = "tip" placeholder = "other" size = "8"> %                                
                            <p>How many people are sharing the bill?</p>
                                <p><input type = "text" name = "people" placeholder = "Number of People"> people</p><br/><br/>
                            <input id = "calBtn" type = "submit" value = "CALCULATE !">
                            <input id = "calBtn" type = "button" value = "Back" onclick="location.href = '/'";>
                        </form>
                    </div>
                </div>                        
            </body>
        </html>`);
})
// tip calculator process
app.post('/tip_process', function(req, res){
    var post = req.body;
    var custNum = post.custNum;
    var initCal = post.initCal;
    var service = (post.tip) * 0.01;
    var tip = service*100;
    var people = post.people;
    var totalTip = (initCal * service) / people;
    totalTip = Math.round(totalTip * 100)/100;
    totalTip = totalTip.toFixed(2);
    var description = ` Customer Number: #${custNum}<br>
                        Bill Amount: $ ${initCal}<br>
                        Service: ${tip} %<br>
                        Number of People: ${people}<br><br>
                        <strong>Tip Amount: $ ${totalTip} each<br>
                        `;     

    fs.writeFile(`./tipHistory/${custNum}`, description, 'utf8', function(err){
        res.redirect(`/page/${custNum}`);
    })
})

// delete customer history
app.post('/delete_process', function(req, res){    
    var post = req.body;
    var id = post.id;
    fs.unlink(`./tipHistory/${id}`, function(err){
        if (err) throw err;
        res.redirect('/');
    })
});

app.listen(process.env.PORT || 3000, function(){
    console.log('Example app listening on port 3000!');
});