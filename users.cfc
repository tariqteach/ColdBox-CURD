/**
 * I am a new handler
 */
component{

	property name="users" inject="users";
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
	 * add
	 */
	function add( event, rc, prc ){		
		if(structKeyExists(rc, "username")){
			prc.addUser = users.addUser(rc);
			messageBox.info( "Add Employee Successfully!" );
			prc.getAllUsers = users.getAllUsers();
		event.setView( "users/list" );
		}else{
			event.setView( "users/add" );
		}
	}

	/**
	 * edit
	 */
	function edit( event, rc, prc ){
		prc.employeeID = rc.id;
		prc.getUser = users.getSingleUser(rc.id);
		event.setView( "users/edit" );
	}

	/**
	 * index
	 */
	function index( event, rc, prc ){
		event.setView( "users/index" );
	}

	/**
	 * list
	 */
	function list( event, rc, prc ){
		prc.getAllUsers = users.getAllUsers();
		event.setView( "users/list" );
	}

	/**
	 * Update Employee
	 */
	function update( event, rc, prc ){
		prc.successMessage = users.updateUser(rc);
		prc.getAllUsers = users.getAllUsers();
		messageBox.info( "Update Employee Successfully!" );
		event.setView( "users/list" );
	}


}
