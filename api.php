<?phperror_reporting(E_ERROR | E_PARSE);
//Connect to DB
define('HOSTNAME', 			'localhost');
define('NAME', 				'Tipster');
define('USERNAME', 			'a');
define('PASSWORD', 			'2MZv4n3zEcbuRatT');
define('PORT', 				'');

$method='';

if (isset($_POST['method'])) $method = $_POST['method'];
if ($method <> ''){
	if($method=='login'){
		login();
	}
	else if($method=='getApprovedPosts'){
		getApprovedPosts();
	}
	else if($method=='getUnapprovedPosts'){
		getUnapprovedPosts();
	}
	else if($method=='submitPost'){
		submitPost();
	}
	else if($method=='setApproved'){
		setApproved();
	}
	else if($method=='deletePost'){
		deletePost();
	}
	else if($method=='test'){
		test();
	}

}

function db_connect() {
    if (!($db = mysql_connect(HOSTNAME . ':' . PORT, USERNAME, PASSWORD))) {
        echo '{"result":"ERROR","error_message":"'.mysql_error().'"}';
	return false;
    }
    if (!(mysql_select_db(NAME, $db))) {
	echo '{"result":"ERROR","error_message":"'.mysql_error().'"}';
	return false;
    }
    return $db;
}

function login(){
	$username='';
	$password='';
	if (isset($_POST['username'])) $username = $_POST['username'];
	if (isset($_POST['password'])) $password = $_POST['password'];
	if ($username<>'' && $password <> '') {
		if ($db = db_connect()) {

		$query = "SELECT username FROM admin WHERE username='". $username."'AND password= '". $password."' ";
		$res = mysql_query($query,$db);
		$row = mysql_fetch_assoc($res);
		if (mysql_num_rows($res) == 1) {
			echo '{"result":"OK","login":"login_accepted"}'		
		}
		else{
			echo '{"result":"ERROR","error_message":"invalid_login"}';
		}
	}
	}
	
	

}

function getApprovedPosts(){
	$query="SELECT id,title,body,date_posted,location_id,tag_id FROM post WHERE approved= 1 ";
		if ($db = db_connect()) {		
			$res = mysql_query($query,$db);
			if (mysql_num_rows($res) > 0) {

					echo '{"result":"OK","getApprovedPosts":[';
					$sep = '';
					while ($row = mysql_fetch_assoc($res)) {
						echo $sep . json_encode($row);
						$sep = ',';
					}
					echo ']}';

			} else{
				echo '{"result":"OK","getApprovedPosts":[]}';
			}
		}
}
function getUnapprovedPosts(){
	$query="SELECT id,title,body,date_posted,location_id,tag_id FROM post WHERE approved= 0 ";
		if ($db = db_connect()) {		
			$res = mysql_query($query,$db);
			if (mysql_num_rows($res) > 0) {
					echo '{"result":"OK","getUnapprovedPosts":[';
					$sep = '';
					while ($row = mysql_fetch_assoc($res)) {
						echo $sep . json_encode($row);
						$sep = ',';
					}
					echo ']}';

			} else{
				echo '{"result":"OK","getUnapprovedPosts":[]}';
			}
		}
}
function submitPost(){

	if (isset($_POST['title'])) $title = $_POST['title'];
	if (isset($_POST['body'])) $body = $_POST['body'];
	if (isset($_POST['location_id']) && preg_match('/^[0-9]+$/i', $_POST['location_id'])) $location_id = $_POST['location_id'];
	if (isset($_POST['tag_id'])) $tag_id = $_POST['tag_id'];
	if($title <> '' && $body <> '' && $location_id <> ''&& $tag_id <> ''){
		$query="INSERT INTO post(title,body,location_id,tag_id,date_posted,approved) VALUES ('".$title."','".$body."','".$location_id."','".$tag_id."','".date('Y-m-d H:i:s', time())."', 0 ) ";
		if ($db = db_connect()) {
			$res = mysql_query($query,$db);
			if($res){
				$row = mysql_fetch_assoc($res);
				echo '{"result":"OK","submistPost":[';
				echo json_encode($row);
				echo ']}';
			}
			else{
				echo '{"result":"ERROR", "error_message":"'.mysql_error().'"}';
			}

		}
	}
	else{
		echo '{"result":"ERROR", "error_message":"missing_parameter"}';
	}
	
}

function setApproved(){
	$query="UPDATE post SET approve=1";
	if ($db = db_connect()) {
		$res = mysql_query($query,$db);
		if($res){
			$row = mysql_fetch_assoc($res);
			echo '{"result":"OK","setApproved":[';
			echo json_encode($row);
			echo ']}';
		}
		else{
			echo '{"result":"ERROR", "error_message":"'.mysql_error().'"}';
		}
	}
}

function deletePost(){
	if (isset($_POST['id'])) $id = $_POST['id'];
	$query="DELETE FROM post WHERE id='".$id."'  ";

	if ($db = db_connect()) {
		$res = mysql_query($query,$db);
		if($res){
			$row = mysql_fetch_assoc($res);
			echo '{"result":"OK","deletePost":[';
			echo json_encode($row);
			echo ']}';
		}
		else{
			echo '{"result":"ERROR", "error_message":"'.mysql_error().'"}';
		}
	}

}
function test(){
	if (isset($_POST['tag_id'])) $title = $_POST['tag_id'];
	echo $title;

}






?>