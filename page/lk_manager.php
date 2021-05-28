<?php
session_start();
if(!$_SESSION['token']){header("Location: ../page/auth");}
require_once '../vendor/db.php';
require_once 'header.php';
$data = new db();

$data = $data->query("
    SELECT * FROM заказы as з 
    JOIN пользователи as п ON п.id_пользователя = з.id_пользователя 
    WHERE з.статус_зак = ?", 
    ['новый']);
?>

<!-- SELECT * FROM заказы as з 
JOIN пользователи as п ON п.id_пользователя = з.id_пользователя 
JOIN набор_товаров as н ON н.id_заказа = з.id_заказа
WHERE з.статус_зак = 'новый'

SELECT * FROM заказы as з 
JOIN пользователи as п ON п.id_пользователя = з.id_пользователя 
JOIN набор_товаров as н ON н.id_заказа = з.id_заказа
JOIN товары as т ON т.id_товара = н.id_товара
WHERE з.статус_зак = 'новый'

SELECT * FROM заказы as з
JOIN набор_товаров as н ON н.id_заказа = з.id_заказа
JOIN товары as т ON т.id_товара = н.id_товара
WHERE з.id_заказа = 3;-->

<a href="../vendor/out">Выход</a>

<div>
<br>
    <h2>Новые заказы</h2>
        <?php 
            echo '<table>';
            echo '<th>#</th>';
            echo '<th>ФИО</th>';
            echo '<th>Телефон</th>';
            echo '<th>Адрес доставки</th>';
            echo '<th>Способ оплаты</th>';
            echo '<th>Товары</th>';
            echo '<th>Общая стоимость</th>';
            echo '<th>Статус</th>';
            foreach($data as $key){
                echo '<form action="../page/tovar_zakaza.php" method="get">';

                echo '<tr>';
                echo '<td>'. $key['id_заказа'] . '</td>'; echo "<input type='hidden' name='id_zakaza' value='" . $key['id_заказа'] ."'>";
                echo '<td>'. $key['фио'] . '</td>';
                echo '<td>'. $key['телефон_при_зак'] . '</td>';
                echo '<td>'. $key['адрес_доставки'] . '</td>';
                echo '<td>'. $key['способ_оплаты'] . '</td>';
                echo "<td><input type='submit' name='tovari_zakaza' value='Посмотреть'></td>";
                echo '<td>'. $key['общая_стоимость'] . '</td>';

                echo '</form>';

                echo '<form action="../vendor/renameStatus.php" method="post">';
                echo "<input type='hidden' name='getIdZakaza' value='" . $key['id_заказа'] ."'>";
                echo "<td><select name='statusZakaza'>";
                echo '<option value="новый">Новый</option>';
                echo '<option value="принят">Принят</option>';
                echo '<select></td>';
                echo "<td><input type='submit' value='Изменить статус'></td>";
                echo '</form>';

                echo '</tr>';

                
            }
            echo '</table>';
            
        ?>

<br><br><br>
    <h2>Принятые заказы</h2>

    <?php 
        $idKyrier = new db();
        $idKyrier = $idKyrier->query("
            SELECT * FROM пользователи as п WHERE п.статус = ?",
            ['Курьер']);
 
        

        $data = new db();

        $data = $data->query("
            SELECT * FROM заказы as з 
            JOIN пользователи as п ON п.id_пользователя = з.id_пользователя 
            WHERE з.статус_зак = ?", 
            ['принят']);


            echo '<table>';
            echo '<th>#</th>';
            echo '<th>ФИО</th>';
            echo '<th>Телефон</th>';
            echo '<th>Адрес доставки</th>';
            echo '<th>Способ оплаты</th>';
            echo '<th>Товары</th>';
            echo '<th>Общая стоимость</th>';
            echo '<th>Курьер</th>';
            echo '<th>Статус</th>';
            foreach($data as $key){
                echo '<form action="../page/tovar_zakaza.php" method="get">';

                echo '<tr>';
                echo '<td>'. $key['id_заказа'] . '</td>'; echo "<input type='hidden' name='id_zakaza' value='" . $key['id_заказа'] ."'>";
                echo '<td>'. $key['фио'] . '</td>';
                echo '<td>'. $key['телефон_при_зак'] . '</td>';
                echo '<td>'. $key['адрес_доставки'] . '</td>';
                echo '<td>'. $key['способ_оплаты'] . '</td>';
                echo "<td><input type='submit' name='tovari_zakaza' value='Посмотреть'></td>";
                echo '<td>'. $key['общая_стоимость'] . '</td>';

                echo '</form>';

                echo '<form action="../vendor/renameStatus.php" method="post">';
                echo "<input type='hidden' name='getIdZakaza' value='" . $key['id_заказа'] ."'>";
                echo "<td><select name='idKyrier'>";

                foreach($idKyrier as $key){
                    echo "<option value='" . $key['id_пользователя'] . "'>" . $key['фио'] . "</option>";
                }

                echo '<select></td>';

                echo "<td><select name='statusZakaza'>";
                echo '<option value="принят">Принят</option>';
                echo '<option value="выполнен">Выполнен</option>';
                echo '<select></td>';

                echo "<td><input type='submit' value='Изменить статус'></td>";
                echo '</form>';

                echo '</tr>';

                
            }
            echo '</table>';    
    ?>

<br><br><br>
<h2>История заказов</h2>

    <?php 
        $getHistory = new db();
        $getHistory = $getHistory->query("
            SELECT * FROM заказы WHERE статус_зак = ?",
            ['Выполнен']);
 

            echo '<table>';
            echo '<th>#</th>';
            echo '<th>ФИО</th>';
            echo '<th>Телефон</th>';
            echo '<th>Адрес доставки</th>';
            echo '<th>Способ оплаты</th>';
            echo '<th>Товары</th>';
            echo '<th>Общая стоимость</th>';
            echo '<th>Статус</th>';
            foreach($getHistory as $key){
                echo '<form action="../page/tovar_zakaza.php" method="get">';

                echo '<tr>';
                echo '<td>'. $key['id_заказа'] . '</td>'; echo "<input type='hidden' name='id_zakaza' value='" . $key['id_заказа'] ."'>";
                echo '<td>'. $key['фио'] . '</td>';
                echo '<td>'. $key['телефон_при_зак'] . '</td>';
                echo '<td>'. $key['адрес_доставки'] . '</td>';
                echo '<td>'. $key['способ_оплаты'] . '</td>';
                echo "<td><input type='submit' name='tovari_zakaza' value='Посмотреть'></td>";
                echo '<td>'. $key['общая_стоимость'] . '</td>';

                echo '</form>';

                echo "<td>" . $key['статус_зак'] . "</td>";

                echo '</tr>';

                
            }
            echo '</table>';   
    ?>

        
</div>

<?php
require_once 'footer.php';
?>