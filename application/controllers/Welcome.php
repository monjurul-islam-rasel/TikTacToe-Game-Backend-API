<?php
header('Access-Control-Allow-Origin: *');
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('save_game_action');
	}	

	public function index()
	{		
		$tiktactoe = json_decode(trim(file_get_contents('php://input')), true);

		if($tiktactoe!="" || $tiktactoe!=NULL) {
			if( isset($tiktactoe['data']['game_id']) && $tiktactoe['data']['game_id']!="") {
				
				$tiktactoe['game_id'] = $tiktactoe['data']['game_id'];
				$tiktactoe['action_type'] = $tiktactoe['action']['type'];

				if($this->save_game_action->save_action($tiktactoe)) { //save game data
					$tiktactoe['response_code'] = '101';
					$tiktactoe['status'] = 'Valid Request';
					$tiktactoe['response'] = 'Game Status Saved';
					$tiktactoe['action_logs'] =  $this->save_game_action->get_actions( $tiktactoe['game_id'] ); 
				}
			} else {				
				$tiktactoe['response_code'] = '404';
				$tiktactoe['status'] = 'Invalid Request';
			}			
		} else {
			$tiktactoe['response_code'] = '404';
			$tiktactoe['status'] = 'Invalid Request';
		}

		echo json_encode($tiktactoe);		
	}

	// public function get_action_log()
	// {
	// 	$game = json_decode(trim(file_get_contents('php://input')), true);

	// 	$tiktactoe['action_logs'] =  $this->save_game_action->get_actions( $game['game_id'] ); 

	// 	echo json_encode($tiktactoe);	
	// }
}
