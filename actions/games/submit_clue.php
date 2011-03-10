<?php
    require_once '../../lib/MindReadrDb.php';
	
	$db = new MindReadrDb();

	$game_id = $_GET["game_id"];
	$answer_id = $_GET["answer_id"];
	$user_id = $_GET["user_id"];
	$clue = $_GET["clue"];
	$points = $_GET["points"];
	$revealed = $_GET["revealed"];
	$difficulty = $_GET["difficulty"];
	
	if($revealed=1){
		if ($difficulty = 1){
		$points=$points-1000; 	
		}
		if ($difficulty = 2){
		$points=$points-1500;
		}
		if ($difficulty = 3){
		$points=$points-2000;
		}
	}
	
	$count = count(explode(" ", $clue));
	$points = $points-($count*100);
	 
	$db->recordClue($game_id, $user_id, $answer_id, $clue, $points);
	
	header("Location: http://cgi.stanford.edu/~mduong/ed196x/views/given_wait.php?game_id=" . $game_id);
?>