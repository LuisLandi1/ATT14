<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    die('Você precisa estar logado para acessar esta página.');
}
$usuario_id = $_SESSION['usuario_id'];
$stmt = $pdo->prepare("SELECT * FROM itens WHERE vencedor IS NULL AND id IN (SELECT item_id FROM lances WHERE usuario_id = ?)");
$stmt->execute([$usuario_id]);
$itens = $stmt->fetchAll();
foreach ($itens as $item) {
    $stmtLance = $pdo->prepare("SELECT usuario_id, valor FROM lances WHERE item_id = ? ORDER BY valor DESC LIMIT 1");
    $stmtLance->execute([$item['id']]);
    $lance = $stmtLance->fetch();
    $pdo->prepare("UPDATE itens SET estado = 'encerrado', vencedor = ? WHERE id = ?")->execute([$lance['usuario_id'], $item['id']]);
    echo "Leilão do item {$item['nome']} encerrado com vencedor ID {$lance['usuario_id']} e lance de R$ {$lance['valor']}\n";
}
?>
