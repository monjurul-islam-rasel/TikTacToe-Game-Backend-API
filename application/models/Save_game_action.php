<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Save_game_action extends CI_Model {

    public function save_action($tictaktoe) {
        if( $tictaktoe['action_type'] == '@@INIT' || $tictaktoe['action_type'] == 'START_AGAIN' ) {
                        
            $data = array (
                'game_id' => $tictaktoe['game_id'],
                'draw'    => $tictaktoe['data']['draw'],
                'turn'    => $tictaktoe['data']['turn']
            );
            $this->db->insert('games', $data);
            return true;
        }
        elseif ($tictaktoe['action_type'] == 'ADD_SYMBOL') {
            $data = array (
                'board' => json_encode($tictaktoe['data']['board']),
                'draw'    => $tictaktoe['data']['draw'],
                'turn'    => $tictaktoe['data']['turn'],
                'won'     => isset($tictaktoe['data']['won']) ? $tictaktoe['data']['won'] : null,
                'wonLine' => isset($tictaktoe['data']['wonLine']) ? $tictaktoe['data']['wonLine'] : null
            );
            $this->db->where('game_id', $tictaktoe['game_id']);
            $this->db->update('games', $data);

            $data_log = array (
                'game_id' => $tictaktoe['game_id'],
                'action'    => json_encode($tictaktoe['action'])
            );
            $this->db->insert('game_action_log', $data_log);

            return true;
        }
    }
    
    public function get_actions($game_id) {
        $log = [];

        $qry_log = $this->db->get_where('game_action_log', array('game_id'=>$game_id));

        foreach($qry_log->result() as $qry_log_res)
        {
            $log []= json_decode( $qry_log_res->action);
        }

        return $log;
    }

}

/* End of file Save_game_action.php */
