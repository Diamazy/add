<?php
// Autoloader de composer
require_once "vendor/autoload.php";

// Config Base de données
\App\Kernel\DB::$db_host = "localhost";
\App\Kernel\DB::$db_login = "root";
\App\Kernel\DB::$db_password = null;
\App\Kernel\DB::$db_name = "td_php_2_db";


// Model View Controller (Router)

if(!isset($_GET['uri'])) {
    $main_controller = new \App\Http\Controllers\MainController();
    $main_controller->index();
} else if(isset($_GET['uri']) && $_GET['uri'] == "societe/add") {
    $societe_controller = new \App\Http\Controllers\SocieteController();
    $societe_controller->add();
} else if(isset($_GET['uri']) && $_GET['uri'] == "societe/create") {
    $societe_controller = new \App\Http\Controllers\SocieteController();
    $societe_controller->create();
} else if(isset($_GET['uri']) && $_GET['uri'] == "societe/list") {
    $societe_controller =  new \App\Http\Controllers\SocieteController();
    $societe_controller->lister();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "societe/edit") {
    $societe_controller =  new \App\Http\Controllers\SocieteController();
    $societe_controller->edit();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "societe/update") {
    $societe_controller = new \App\Http\Controllers\SocieteController();
    $societe_controller->update();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "societe/delete") {
    $societe_controller = new \App\Http\Controllers\SocieteController();
    $societe_controller->delete();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "statut/add") {
    $statut_controller = new \App\Http\Controllers\StatutController();
    $statut_controller->add();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "statut/create") {
    $statut_controller = new \App\Http\Controllers\StatutController();
    $statut_controller->create();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "statut/list") {
    $statut_controller = new \App\Http\Controllers\StatutController();
    $statut_controller->lister();
}

else if(isset($_GET['uri']) && $_GET['uri'] == "statut/edit") {
    $statut_controller = new \App\Http\Controllers\StatutController();
    $statut_controller->edit();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "statut/update") {
    $statut_controller = new \App\Http\Controllers\StatutController();
    $statut_controller->update();
}
else if(isset($_GET['uri']) && $_GET['uri'] == "projet/add") {
    $projet_controller = new \App\Http\Controllers\ProjetController();
    $projet_controller->add();
}






// routes
// uri = accueil > quel controller ? quelle action ? > Quelles datas ? > quelle vue ?

// uri = index.php?uri=societe/add > quel controller ? quelle action ? > Quelles datas ? > quelle vue ?