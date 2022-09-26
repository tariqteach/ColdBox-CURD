/**
 * I am a new handler
 */
component{

    property name='iDocHive' inject='iDocHive';
    property name='messageBox' inject='@cbmessagebox';

    
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	 * index
	 */
	function index( event, rc, prc ){
		
		prc.message = iDocHive.sayHello();
		messageBox.info( "This is IDocHive Function sayHello!" );
		event.setView( "iDocHive/index" );
	}

	/**
	 * add
	 */
	function add( event, rc, prc ){
		event.setView( "iDocHive/add" );
	}

	/**
	 * edit
	 */
	function edit( event, rc, prc ){
		event.setView( "iDocHive/edit" );
	}

	/**
	 * list
	 */
	function list( event, rc, prc ){
		event.setView( "iDocHive/list" );
	}



}
