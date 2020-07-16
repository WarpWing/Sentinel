/*/////////////////////////////////////////////////////////////////////////////

  Author  : @qodeninja

/////////////////////////////////////////////////////////////////////////////*/

"use strict";


/*/////////////////////////////////////////////////////////////////////////////
// λ - Includes
/////////////////////////////////////////////////////////////////////////////*/  
  
  const util    = require('util');
  const EE      = require('events');
  const http    = require('http');
  const path    = require('path');

  const proto    = require('express');
  const sss      = require('express-session');
  const session  = require('cookie-session');
  const cookie   = require('cookie-parser');
  const body     = require('body-parser');
  const errors   = require('errorhandler');
  const override = require('method-override');
  const favicon  = require('serve-favicon');
  const xstatic  = require('serve-static');
  const disp     = require('./dispatch.js');

  //const app  = express(); //require('fastify')();
	//const io   = require('socket.io');


  const defaults = {
    SERVER_ID   : 'Hyper',
    SESSION_ID  : 'hyper.sid',
    VIEW_ENGINE : 'pug',
    APP_PORT    : 80,
    LOCAL_PORT  : 3000,
    PUBLIC_WWW  : './www'
  }
	
/*/////////////////////////////////////////////////////////////////////////////
// λ - Server Prototype
/////////////////////////////////////////////////////////////////////////////*/  

  class HyperServer extends EE{

    constructor( $ = {} ){
      super();

      $ = Object.assign( defaults, $ ); 

      this.config = $;
      this.server = proto();
      this.dispatch = {}
      setTimeout( ()=>{
        this.init();
      },1000);
    }



    init(){
      console.log('stub::init');

      
      let $  = this.config;
      let $h = this.server;



      let dev  = $.MODE = ( 'development' == $h.get('env') || process.env.NODE_ENV  == 'development' );
      let port = $.PORT = (( dev ? $.LOCAL_PORT : $.APP_PORT ) || process.env.NODE_PORT );

      $h.set( 'port', port );
      $h.set( 'view engine', $.VIEW_ENGINE );

      if( dev ) $h.use( errors({ dumpExceptions: true, showStack: true }) );

      $h.use( body.json() );
      $h.use( body.urlencoded({ extended:true }) );
      $h.use( override() );
      $h.use( cookie() );
      $h.use( sss({secret: 'secret', key:$.SESSION_ID, resave:true, saveUninitialized:true }));

      $h.use( ( i, o, n ) => { o.set('X-Powered-By', $.SERVER_ID ); n(); });
      $h.use( ( i, o, n ) => { i.baseUrl = i.originalUrl.split("?").shift(); n(); });
      $h.use( ( i, o, n ) => { console.info( `[${i.method} ${i.baseUrl}]`) || n(); }); 

      $h.use( favicon( $.PUBLIC_WWW + '/favicon.ico') );
      $h.use( xstatic( $.PUBLIC_WWW, {  
          setHeaders: ( res, path, stat ) => res.set('X-Timestamp', Date.now())
      }));


      $h.get('/', (req, res) => res.send('Hello World!'))
      //$.router.route( $n );


      this.emit('init',{today:1});

    }

    conf( options ){
      console.log('stub::config');
      this.config = {...this.config, ...options};
      this.emit('config');
    }

    start(){
      console.log('stub::start');
      this.emit('start');
    }


    setMode( mode ){}
    setPort( port ){}

    registerDispatcher(){}

    run(){


      let $    = this.config;
      let $app = this.server;

      let port = $.PORT;
      let dev  = $.MODE;

      console.log('config',port, dev, $)
      // app.listen(3000, '0.0.0.0', function (err, address) {
      //   if (err) {
      //     console.error(err)
      //     process.exit(1)
      //   }
      //   console.info(`server listening on ${address}`,arguments)
      // })

      //$app.listen(this.port,()=>console.info(`server listening on ${this.port}`))

      let $ns = http.createServer($app).on( 'close', ()=> {
              console.error( $.SERVER_ID + " - Shutting Down..");

            }).listen( port, data => {
              console.info( `Env  : [ ${( dev ? "DEV" : "PROD" )} ] \nPort : [ ${port} ]` );
              console.info( `URL  :  http://localhost:${port}` );
            });


    }

  }


/*/////////////////////////////////////////////////////////////////////////////
// Exports
/////////////////////////////////////////////////////////////////////////////*/


  module.exports = HyperServer;


/*/////////////////////////////////////////////////////////////////////////////
// Standalone
/////////////////////////////////////////////////////////////////////////////*/

  if( require.main === module ){
    var args = process.argv.slice(2);
    args.forEach(function (val, index, array) {
      console.log(index + ': ' + val);
    });
  }
