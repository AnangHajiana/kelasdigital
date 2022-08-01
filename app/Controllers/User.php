<?php

namespace App\Controllers;

class User extends BaseController
{
    public function index()
    {
        return view('welcome_message');
    }

    public function login()
    {
        $user = $this->userModel->where('user_name', $this->request->getJsonVar('user_name'))->first();
        
        if($user){
            if($user['password'] == hash('sha256', $this->request->getJsonVar('password'))){

                //delete old token
                $this->tokenModel->where('user_name',$this->request->getJsonVar('user_name'))->where('uuid',$this->request->getJsonVar('uuid'))->delete();

                $token_generator = bin2hex(openssl_random_pseudo_bytes(8));
                $token_data = [
                    'uuid' => $this->request->getJsonVar('uuid'),
                    'user_name' => $this->request->getJsonVar('user_name'),
                    'token' => 'token_'.$token_generator
                ];

                $this->tokenModel->insert($token_data);

                $resp = [
                    'status' => 200,
                    'message' => 'OK',
                    'token' => $token_generator
                ];
            }else{
                $resp = [
                    'status' => 400,
                    'message' => 'Username dan password salah'
                ];
            }
        }else{
            $resp = [
                'status' => 400,
                'message' => 'Username dan password salah'
            ];
        }

        return $this->response->setJSON($resp);
    }
}
