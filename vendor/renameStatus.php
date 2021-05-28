<?php
session_start();
    require_once 'db.php';
    $id_user = $_SESSION['id_user'];
    $change_date = date("Y-m-d");

    $idKyriera = $_POST['idKyrier'];

    if($_POST['statusZakaza'] == 'принят'){
        $setStatusZakaza = new db();
        $setStatusZakaza = $setStatusZakaza->query("
        UPDATE `заказы` SET `дата_нов_прин` = ?, `id_менеджера` = ?, `статус_зак` = ? 
        WHERE `заказы`.`id_заказа` = ?",
        [$change_date , $id_user, $_POST['statusZakaza'], $_POST['getIdZakaza']]);
    }

    if($_POST['statusZakaza'] == 'выполнен'){
        $setStatusZakaza = new db();
        $setStatusZakaza = $setStatusZakaza->query("
        UPDATE `заказы` SET `дата_прин_вып` = ?, `id_курьера` = ?, `статус_зак` = ? 
        WHERE `заказы`.`id_заказа` = ?",
        [$change_date , $idKyriera, $_POST['statusZakaza'], $_POST['getIdZakaza']]);
    }
   
    header("Location: ../page/lk_manager.php");