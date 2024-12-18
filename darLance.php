<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    die('Você precisa estar logado para dar um lance.');
}
$item_id = $_POST['item_id'];
$valor = $_POST['valor'];
$usuario_id = $_SESSION['usuario_id'];
$stmt = $pdo->prepare("INSERT INTO lances (item_id, usuario_id, valor) VALUES (?, ?, ?)");
if ($stmt->execute([$item_id, $usuario_id, $valor])) {
    echo "Lance enviado com sucesso!";
} else {
    echo "Erro ao enviar lance.";
}
?>
