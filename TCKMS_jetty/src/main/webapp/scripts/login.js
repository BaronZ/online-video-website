/**
 * @author AMC
 */

function $(id){
	return document.getElementById(id);
	}
	
function Trim(str){
	 return str.replace(/(^\s*)|(\s*$)/g, "");
	 }   
	 
function init(){
	
	$('username').focus();
}
	
function lips_open(id){
	
	$(id).style.display='block';
}

function lips_close(id){
	
	$(id).style.display='none';
}


function login_states(id){
	if ($(id).id=='username'){
		lips_close('usernull');
		lips_close('isNum');
	}
	if ($(id).id=='password'){
		lips_close('pswnull');
	}
}

function login_check(){
	
	$('username').value=Trim($('username').value);
	if($('username').value==''){
		
		lips_open('usernull');
		$('username').focus();
		return false;
	
	}else if(isNaN($('username').value)==true){
		
		lips_open('isNum');
		$('username').focus();
		return false;
		
	}else if($('password').value==''){
		
		lips_open('pswnull');
		$('password').focus();
		return false;
	}
	
		else return true;
	}


