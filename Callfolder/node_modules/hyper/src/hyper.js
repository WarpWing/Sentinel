/*                    
     __     
     \ \    
      \ \   
       > \  
      / ^ \ 
     /_/ \_\
            
      hyper 


*/

/*/////////////////////////////////////////////////////////////////////////////

  Author  : @qodeninja

/////////////////////////////////////////////////////////////////////////////*/

  "use strict";


/*/////////////////////////////////////////////////////////////////////////////
// λ - Includes 
/////////////////////////////////////////////////////////////////////////////*/  


  const initServer = require('./app');

  //const config      = HyperServer.defaults;

/*/////////////////////////////////////////////////////////////////////////////
// λ - Run 
/////////////////////////////////////////////////////////////////////////////*/  

  try{
    console.log("================== hyper ===================");
    let hyper = initServer({sky:'blue', PORT:3000});

    // hyper.registerHooks([
    //   'mount',
    //   'config',
    //   'locals',
    //   'session',
    //   'reroute',
    //   'static',
    //   'bind',
    //   'unbind',
    //   'shutdown'
    // ]);

    //let hyper = new HyperServer({sky:'blue'});

    hyper.on('init', function(e){
      console.log('init event yay', e);
      this.start();
    });

    hyper.on('config', function(e){
      console.log('config changed', this.config);
    });

    hyper.on('start', function(e){
      console.log('get ready to run!', e);
      this.run();
    });


    

    //console.log(hyper);
  }catch(err){
    console.error(err);
    process.exit(1);
  }
