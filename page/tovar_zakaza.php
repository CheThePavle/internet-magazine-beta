<?php
    require_once '../page/header.php';
    require_once '../vendor/db.php';

    echo $_GET['ban'];

    $data = new db();
    $data = $data->query("
    SELECT * FROM заказы as з
    JOIN набор_товаров as н ON н.id_заказа = з.id_заказа
    JOIN товары as т ON т.id_товара = н.id_товара
    JOIN категории as к ON к.id_категории = т.id_категории
    JOIN виды_отдыха as в ON в.id_вида = т.id_вида
    WHERE з.id_заказа = ?",
    [$_GET['id_zakaza']]);

    echo '<table>';
    echo '<th>#</th>';
    echo '<th>Название</th>';
    echo '<th>Описание</th>';
    echo '<th>Цена</th>';
    echo '<th>Возраст</th>';
    echo '<th>Важная инфа</th>';
    echo '<th>Категория</th>';
    echo '<th>Вид отдыха</th>';
    echo '<th>Количество</th>';

    foreach($data as $key){
        echo '<tr>';

        echo '<td>'. $key['id_товара'] . '</td>';
        echo '<td>'. $key['название_тов'] . '</td>';
        echo '<td>'. $key['описание_тов'] . '</td>';
        echo '<td>'. $key['цена_тов'] . '</td>';
        echo '<td>'. $key['возраст'] . '</td>';
        echo '<td>'. $key['важная_инфа'] . '</td>';
        echo '<td>'. $key['название_кат'] . '</td>';
        echo '<td>'. $key['название_вида'] . '</td>';
        echo '<td>'. $key['кол_тов_зак'] . '</td>';

        echo '</tr>';
    }
    echo '</table>';

?>

<a href="../page/lk_manager.php">Назад</a>

<?php
    require_once '../page/footer.php';
?>