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
	const crypto = require('crypto');

	const ALLOW_PLUGIN_REUSE = true;
	const STANARD_HOOKS = [ 'DISP_ROOT', 'LOAD_PLUGIN'];


  class HyperDispatch extends EE{

    constructor(options = {}){
      super();
      this.clearRegistry();
      this.addHooks(...STANARD_HOOKS);

      //janky
      this.on('error', (e)=>{ throw new Error(e.msg) });
    }

    clearRegistry(){
    	this.stack    = [];
    	this.registry = { hooks: {}, plugins:{}, cache:[] };
    }

    findHook( hook ){
    	return this.stack.indexOf( hook );
    }

    reservedHooks(){}

    swapHooks( hook1, hook2 ){
    	const NUM = 'number';
    	let stack = this.stack;
    	let idx1, idx2;
    	if( typeof hook1 === NUM ){
    	 idx1  = hook1;
    	 hook1 = stack[hook1];
    	}else{
    	 idx1 = this.findHook( hook1 );
    	}
     	if( typeof hook2 === NUM ){
    	 idx2  = hook2;
    	 hook2 = stack[hook2];
    	}else{
    	 idx2 = this.findHook( hook2 );
    	}
    	if(idx1===0||idx2===0){
    		this.emit('error', { msg : `cannot swap ROOT hook`, data:[idx1,idx2] } );	
    	}else{
	    	if(idx1 > -1 && idx2 > -1){
	    		stack[ idx1 ] = hook2;
	    		stack[ idx2 ] = hook1;
	    	}
    	}
    	return this;
    }

    deleteHook( hook ){
    	let stack = this.stack;
    	let reg   = this.registry.hooks;
    	let idx   = this.findHook( hook );

    	//janky
    	if( hook === 'DISP_ROOT' ) this.emit('error', { msg : `cannot delete ROOT hook` } );	

    	if(idx > -1){
    		let cache = reg[ hook ];
    		stack.splice(idx,1);
    		reg[ hook ] = undefined; //FIX hmm...
    		delete reg[ hook ];
    		//maybe return cache
    	}
    	return this;
    }

    addHook( newHook ){
    	let stack = this.stack;
    	let reg   = this.registry.hooks;
    	let idx   = this.findHook( newHook );
    	if( idx === -1 ){
    		stack.push( newHook );
    		//this.stack = stack;
    		reg[ newHook ] = [];
    		this.emit('success',{ msg: `success! hook ${newHook} added`, data:newHook });	
    	}else{
    		this.emit('error', { msg : `hook ${newHook} already exists`, data:newHook, idx:idx } );	
    	}
    	return this;
    }

    insertHook( hook, newHook, before ){
    	let stack = this.stack;
    	let reg   = this.registry.hooks;
    	let idx   = this.findHook( newHook );
    	let nidx  = this.findHook( hook );
    	let hooks = [ (before?newHook:hook), (before?hook:newHook) ];
    	if(idx === -1 && nidx > -1){
    		stack.splice(nidx+(before?0:1),0,newHook);
    		//this.stack = stack;
    	  reg[ newHook ] = [];
    		this.emit('success',{ msg: `success! hook ${newHook} inserted!`, data:newHook });	
    	}
    	return this;
    }
    
    //FIXIT: default param + args not working (before=false)
    insertHookBefore( hook, newHook ){
    	return this.registerHookInsert(hook,newHook,true);
    }

    insertHookAfter( hook, newHook ){
    	return this.registerHookInsert(hook,newHook,false);
    }

    addHooks(...hooks){
  		hooks.forEach((hook,i)=>{
  			this.addHook(hook);
  		});
    }

    readyHooks(){
    	let stack = this.stack;
    	let len   = stack.length-1;
    	this.addHook('DISP_FINAL');
    }

    registerPlugin( id, fx, hook='LOAD_PLUGIN' ){

    	let stack = this.stack;
    	let reg   = this.registry.hooks;
    	let preg  = this.registry.plugins;
    	let cache = this.registry.cache;

    	let idx   = this.findHook( hook );
    	if( idx < 0 ) this.emit('error', { msg : `Hook ${hook} not initiated.` } );	

    	let hash  = this.getPluginHash( fx );

    	//if fx is already stored dont store it again
    	let cid  = this.findPluginByCache( hash );

    	//fx not in cache
    	if( cid < 0 ){
    		cache.push(hash);
    		cid = cache.length-1;

    		//find unique plugin name
    		if( this.findPluginByName( id ) ){
    			this.emit('error', { msg : `plugin name ${id} already used.`, data:hash } );	
    		}else{
    			let plugin = { cache : cid, fx: fx };
    			preg[id] = plugin;
    			reg[hook].push(id);
	    		this.emit('success',{ msg: `success! plugin ${id} registered!`, data:hash });	
    		}
    	}else{
    		if( this.findPluginByHook( id, hook ) < 0 ){
  				reg[hook].push(id);
  				this.emit('success',{ msg: `success! reusing plugin ${id}!`, data:hash });	
  			}
    	}

    	console.log(hook, id, hash);

    	return hash;
    	
    }

    findPluginByHook( id, hook='LOAD_PLUGIN'){
    	let reg    = this.registry.hooks;
    	let rstack = reg[ hook ];
    	let ridx   = rstack.indexOf( id );
    	console.log(ridx,hook,id);
    	return ridx;
    }


    findPluginByName( id ){
    	let preg   = this.registry.plugins;
    	let plugin = preg[id];
    	if( plugin ) return true;
    	return false;
    }

    findPluginByCache( hash ){
    	let cache = this.registry.cache;
    	return cache.indexOf( hash );
    }


    getPluginHash( plugin ){
    	return crypto.createHash('md5').update(plugin.toString()).digest("hex");	
    }

    dryRun(){

    	this.readyHooks();

    	let stack = this.stack;
    	let reg   = this.registry.hooks;
    	let preg  = this.registry.plugins;

    	stack.forEach((hookEvent)=>{
    		console.log(hookEvent);
    		let pstack = reg[hookEvent];

    		pstack.forEach((pluginEvent)=>{
    			//console.log(pluginEvent);
    			let plugin = preg[pluginEvent];
    			plugin.fx(`---${pluginEvent}-test`);
    		});

    	});
    }

    middleware(){
    	return function(req, res, next){
    		//something like that
    		stack.forEach((hookEvent)=>{
    			 fn(req, res, callback);
    		},(err)=>{
          if (err) return console.error(err);
          next();
    		});	
    	}
    }

  }


/*/////////////////////////////////////////////////////////////////////////////
// Exports
/////////////////////////////////////////////////////////////////////////////*/


  module.exports = HyperDispatch;
  module.exports.driver = function(){
  	var Dispatch = HyperDispatch;
  	var disp = new Dispatch();
  	disp.on('error',(data)=>{ console.error(data) });
  	disp.on('success',(data)=>{ console.log(data) });
  	disp.addHook('driver_dream');
  	disp.addHook('driver_wake');
  	disp.addHook('driver_eat');
  	disp.addHook('driver_shower');
  	disp.addHooks('driver_kitty','driver_work');
  	//disp.swapHooks(0,4);//error
  	disp.swapHooks(1,4);
  	return disp;
  }

/*/////////////////////////////////////////////////////////////////////////////
// Standalone
/////////////////////////////////////////////////////////////////////////////*/

  if( require.main === module ){
    var args = process.argv.slice(2);
    args.forEach(function (val, index, array) {
      console.log(index + ': ' + val);
    });
  }
