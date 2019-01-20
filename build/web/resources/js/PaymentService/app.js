var http = require('http')
var url = require('url')
var fs = require('fs')
var qs = require('querystring')
var db = require('./app_module/db')
var crypto = require('crypto')
var mysql = require('mysql')
// var Promise = require('promise')

var port = 8383
const ctype = {
	css:'text/css', js:'application/json',
	woff:'application/font-woff', woff2:'font/woff2',
	ttf:'application/font-sfnt', eot:'application/vnd.ms-fontobject',
	otf:'application/font-sfnt', svg:'image/svg+xml'
}
// application/x-font-woff
db.connect()
	.then(con => console.log(con))
	.catch(err => {
		console.log(err)
		throw err
})

var notfound = function(res, type='text', message='') {

	if(type === 'json') {
		res.writeHead(404, {'Content-Type':'application/json'});
	    res.write(JSON.stringify({error: message===''?'Not found':message}),"utf8");
	    return res.end();
	}
	
	fs.readFile('./error.html', function(err, data) {
	    if (err) {
	    	console.log('hey')
	      res.writeHead(404, {'Content-Type': 'text/html'});
	      res.write('Not found')
	      return res.end("404 Not Found");
	    }
	    res.writeHead(404, {'Content-Type': 'text/html'});
	    res.write(data);
	    return res.end();
	 })
}

const extractdata = function(req) {
	let body = ''
	return new Promise((res,rej) => {
		if(req.method != 'POST')
			rej('Not found1')
		req.on('data', function (data) {
            body += data.toString();
            if (body.length > 1e6) {
                req.connection.destroy();
                rej('Not found2')
            }
        });
		req.on('end', function () {
			res(body)
            // res(qs.parse(body))
        });
        // rej('Not found3')
	})
}

// console.log(require('crypto').randomBytes(6).toString('hex'))

var server = http.createServer(function(req, res) {

  var path = url.parse(req.url).pathname;

  if(path.startsWith('/static/')) {
  	const index = path.indexOf('static')
  	const pathparts = path.substring(1).split('/')
  	const filepart = pathparts[pathparts.length-1].split('.')
  	const ext = filepart[filepart.length-1]
  	// var partlen = pathparts.length
  	// var fileContents = fs.readFileSync(`./static/${pathparts[pathparts.length-2]}/${pathparts[pathparts.length-1]}`,
  	// 	{encoding: 'utf8'});
  	// res.writeHead(200, {'Content-type' : pathparts[pathparts.length-2] === 'css' ? 'text/css' : 'application/javascript'} );

  	var fileContents = fs.readFileSync(`.${path}`, {encoding: 'utf8'})
  	res.writeHead(200, {'Content-type' : ctype[ext] !== undefined ? ctype[ext] : 'text/html'} );
    res.write(fileContents);
    return res.end();
  }

  switch(path) {
  	case '/':
  		fs.readFile('./index.html', function(err, data) {
		    if (err) {
		      notfound(res)
		    }  
		    res.writeHead(200, {'Content-Type': 'text/html'});
		    res.write(data);
		    return res.end();
		  });
  	break;
  	case '/pay':
  		fs.readFile('./index.html', function(err, data) {
		    if (err) {
		      notfound(res)
		    }  
		    res.writeHead(200, {'Content-Type': 'text/html'});
		    res.write(data);
		    return res.end();
		});
  	break;
  	case '/test':
  		fs.readFile('./test.html', function(err, data) {
		    if (err) {
		      notfound(res)
		    }  
		    res.writeHead(200, {'Content-Type': 'text/html'});
		    res.write(data);
		    return res.end();
		  });
  	break;
  	case '/getKey':
  		const q = url.parse(req.url, true)
  		const key = q.query.pkey
  		db.chargekey(key).then(result => {
  			console.log(result[0].charge_id)
  			if(result.length == 0) {
  				console.log('No result')
  				throw new Error()
  			}

  			if(result[0].status == 'PENDING') {
  				res.writeHead(200, {'Content-Type':'application/json'})
			    return res.end(JSON.stringify(result[0]))
  			} else if(result[0].status == 'SUCCESS') {
  				res.writeHead(204, {'Content-Type':'application/json'})
			    return res.end(JSON.stringify(result[0]))
  			} else
  				throw new Error('Token does not exist')
		    
		    
  		}).catch(err => {
  			console.log(err)
  			res.writeHead(404, {'Content-Type':'application/json'});
		    res.write(JSON.stringify({error: 'Token not found. Cannot complete payment.'}), "utf8");
		    return res.end();
  		})
  	break;
  	case '/requestToken':
  		extractdata(req).then(postdata => {
  			data = JSON.parse(postdata)
  			// console.log(data)
  			const token = crypto.randomBytes(6).toString('hex')
  			let details = [[token,data.name,data.email,JSON.stringify(data.products).replace(/\\\//g, "/"),
  								parseInt(data.amount),'PENDING',data.returnUrl,data.cancelUrl]]
  			return db.request(details)
  		}).then(inserted => {
  			return db.key(inserted.insertId)
  		}).then(result => {
  			const vals = {key:result[0].charge_id, return:result[0].returnUrl, cancel:result[0].cancelUrl}
  			res.writeHead(200, {'Content-Type':'application/json'})
  			return res.end(JSON.stringify(vals))
  		}).catch(err => {
  			console.log(err)
  			res.writeHead(404, {'Content-Type':'application/json'});
	    	// res.write(JSON.stringify({error: 'Unable to generate token.'}), "utf8");
		    return res.end({error: 'Unable to generate token.'});
  		})
  	break;

  	case '/completePayment':
  		extractdata(req).then(postdata => {
  			console.log(postdata)
  			let data = postdata
  			try	{ data = JSON.parse(data) }
  			catch(e) { data = postdata }
  			
	  		if(data !== null && data !== undefined) {
	  			if(data.card.number !== '1212 1212 1212 1212' && data.card.number.length !== 19) {
	  				res.writeHead(400, {'Content-Type':'application/json'})
	  				return res.end(JSON.stringify({error: 'Card is invalid.'}))
	  			}
	  			// const exp = data.exp.split('/')
	  			const today = new Date()
	  			const shortyear = parseInt(today.getFullYear().toString().substring(2))
	  			if(data.card.year === '' || shortyear > parseInt(data.card.year)) {
	  				res.writeHead(400, {'Content-Type':'application/json'})
	  				return res.end(JSON.stringify({error: 'Your card has expired.'}))
	  			}
	  			if(shortyear === parseInt(data.card.year)) {
	  				if((data.card.month === '' || today.getMonth() + 1) > parseInt(data.card.month)) {
	  					res.writeHead(400, {'Content-Type':'application/json'})
	  					return res.end(JSON.stringify({error: 'Your card has expired.'}))
	  				}
	  			}
	  			if(data.card.cvc === '' || data.card.cvc.length < 3) {
	  				res.writeHead(400, {'Content-Type':'application/json'})
	  				return res.end(JSON.stringify({error: 'Card is invalid.'}))
	  			}
	  			return db.update(data.key)
	  		} else
	  			throw new Error('Insufficient data given.')
	  			

  		}).then(result => {
			console.log('Charged')
			res.writeHead(200, {'Content-Type':'application/json'})
			return res.end('success')
		}).catch(err => {
			console.log(err)
			res.writeHead(404, {'Content-Type':'application/json'});
	    	// res.write(), "utf8");
		    return res.end(JSON.stringify({error: 'Oops! Unable to charge your credit card.'}))
		})
  		
  	break;

  	case '/refund':
  		extractdata(req).then(postdata => {
  			let data = ''
  			try {data = JSON.parse(postdata)}
  			catch(e) { data = postdata }

  			console.log('Refund'+data.key)
  			return db.refund(data.key)
  		}).then(result => {
  			console.log('Refunded')
			res.writeHead(200, {'Content-Type':'application/json'})
			return res.end(JSON.stringify({status:'success'}))
  		}).catch(err => {
			console.log(err)
			res.writeHead(404, {'Content-Type':'application/json'});
		    return res.end(JSON.stringify({error: 'No refund.'}))
		})
	break;

  	case '/cancel':
  		extractdata(req).then(postdata => {
  			const data = JSON.parse(postdata)
  			console.log('Delete'+data.key)
  			return db.delete(data.key)
  		}).then(result => {
  			console.log('Deleted')
			res.writeHead(200, {'Content-Type':'application/json'})
			return res.end(JSON.stringify({status:'success'}))
  		}).catch(err => {
			console.log(err)
			res.writeHead(404, {'Content-Type':'application/json'});
		    return res.end(JSON.stringify({error: 'No cancel.'}))
		})
  	break;

  	default:
  		return notfound(res);
  	break;
  		

  }
  // response.end();
});

// var server = http.createServer();
server.listen(port);
console.log('Browse at http://localhost:'+port)