<?php
session_start();
//if($_SESSION['token']){header("Location: ../index");}
require_once 'header.php';
?>
    <h1>Вход</h1>
    <form action="../vendor/signIn" method="post">
        <label>Логин</label>
        <input type="text" name="login">
        <label>Пароль</label>
        <input type="password" name="password">
        <br><br>
        <?php 
            echo $_SESSION['msg'];
            $_SESSION['msg'] = '';
        ?>
        <input type="submit" value="Войти">
    </form>
<?php
require_once 'footer.php';
?>
