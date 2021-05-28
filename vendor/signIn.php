<?php
session_start();
    require_once 'db.php';

    class authorization extends db{
        private $data;

        public function __construct(){
            parent::__construct();
            return $this->checkUser();
        }

        private function setMsg($text){
            $_SESSION['msg'] = $text; 
            return header("Location: ../page/auth");
        }

        private function checkUser(){
            $login = $_POST['login'];
            $password = $_POST['password'];

            if($login == ''){return $this->setMsg('Введите логин!');}
            if($password == ''){return $this->setMsg('Введите пароль!');}

            $data = $this->query("SELECT * FROM `пользователи` WHERE `логин` = ? AND `пароль` = ?",[$login, $password]);
            if (!$data){return $this->setMsg('Неверный логин или пароль!');}

            $id_user = $data[0]['id_пользователя'];
            $_SESSION['id_user'] = $id_user;
            $token = uniqid();
            $this->make("UPDATE `пользователи` SET `token` = ? WHERE `пользователи`.`id_пользователя` = ?", [$token, $id_user]);
            $_SESSION['token'] = $token;
            $_SESSION['status'] = $data[0]['статус'];
            
            if($data[0]['статус'] == 'Менеджер'){return $this->getManager();}
            if($data[0]['статус'] == 'Пользователь'){return $this->getUser();}
            if($data[0]['статус'] == 'Админ'){return $this->getAdmin();}
        }

        private function getManager(){
            header("Location: ../page/lk_manager.php");
        }

        private function getAdmin(){
            header("Location: ../page/lk_admin.php");
        }

        private function getUser(){
            header("Location: ../page/lk_user.php");
        }
    }
    new authorization;