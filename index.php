<?php
session_start();
    require_once 'page/header.php';
?>
<h1>Главная еще не готова</h1>
<?php
    if($_SESSION['token']){
        switch ($_SESSION['status']){
            case 'Пользователь': echo '<a href="page/lk_user.php">ЛК</a>'; break;
            case 'Админ': echo '<a href="page/lk_admin.php">ЛК</a>'; break;
            case 'Менеджер': echo '<a href="page/lk_manager.php">ЛК</a>'; break;
        }
    } else { echo '<a href="page/auth">войти</a>';};
?>
<p>только для менеджеров</p>
<?php
    require_once 'page/footer.php';
?>

        

    