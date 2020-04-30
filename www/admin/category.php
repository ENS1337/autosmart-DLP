<?php
session_start();
if ($_SESSION['auth_admin'] == "yes_auth"){
	define('autosmart', true);
    
    if (isset($_GET["logout"])){
        unset($_SESSION['auth_admin']);
        header("Location: login.php");
    }
    $_SESSION['urlpage'] = "<a href='index.php'>Главная</a> \ <a href='category.php'>Категории</a>";
    
    include("include/db_connect.php");
    include("include/functions.php");
    
    if ($_POST["submit_cat"])
    {
        if ($_SESSION['add_category'] == '1')
        {
            $error = array();
            if (!$_POST["cat_type"])  $error[] = "Укажите тип автомобиля!"; 
            if (!$_POST["cat_mark"]) $error[] = "Укажите название категории!";
      
            if (count($error))
            {
                $_SESSION['message'] = "<p id='form-error'>".implode('<br />',$error)."</p>"; 
            }else
            {
                $cat_type = clear_string($_POST["cat_type"]);
                $cat_mark = clear_string($_POST["cat_mark"]);
                
                            mysql_query("INSERT INTO category_cars(type_car,mark_auto)
        						VALUES(						
                                    '".$cat_type."',
                                    '".$cat_mark."'                              
        						)",$link);   
             $_SESSION['message'] = "<p id='form-success'>Категория успешно добавлена!</p>";   
             }
            
        }else{
            $msgerror = 'У вас нет прав на добавление категории!';
        }
    }
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    
	<meta name="author" content="sokol0198" />

	<title>Панель Управления - Категории</title>
    <style> 
            li{list-style-type: none}
            ul{list-style-type: none}
    </style>
</head>

<body>
<div id="block-body">
<?php
	include("include/block-header.php");
?>
    <div id="block-content">
        <div id="block-parameters">
        <p id="title-page">Категории</p>
        </div>
        <?php
        if (isset($msgerror)) echo '<p id="form-error" align="center">'.$msgerror.'</p>';
        
                if(isset($_SESSION['message']))
                {
                echo $_SESSION['message'];
                unset($_SESSION['message']);
                }
        ?>
        <form method="POST">
            <ul id="cat_cars">
                <li>
                <label>Категории</label>
                <div>
                <?php 
                if ($_SESSION['delete_category'] == '1')
                {
                    echo '<a class="delete-cat">Удалить</a>';
                }
                ?>
                </div>
                <select name="cat_type" id="cat_type" size="10">
                    <?php
                        $result = mysql_query("SELECT * FROM category_cars ORDER BY type_car",$link);
                         
                         If (mysql_num_rows($result) > 0)
                        {
                        $row = mysql_fetch_array($result);
                        do
                        {
                        	echo '
                            
                               <option value="'.$row["id"].'" >'.$row["type_car"].' - '.$row["mark_auto"].'</option>
                            
                            ';
                        }
                         while ($row = mysql_fetch_array($result));
                        }    
                    ?>
                </select>
                </li>
                <li>
                    <label>Тип автомобиля</label>
                    <input type="text" name="cat_type"/>
                </li>
                <li>
                    <label>Марка автомобиля</label>
                    <input type="text" name="cat_mark"/>
                </li>
            </ul>
            <p align="right"><input type="submit" name="submit_cat" id="submit_form" value="Добавить"/></p>
        </form>
    </div>
</div>
</body>
</html>
<?php
}else{
    header("Location: login.php");
}
?>