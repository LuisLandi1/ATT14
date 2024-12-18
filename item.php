<?php
session_start();
$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM itens WHERE id = ?");
$stmt->execute([$id]);
$item = $stmt->fetch();
if (!$item) {
    die('Item não encontrado.');
}
?>
<h1><?= htmlspecialchars($item['nome']) ?></h1>
<p>Valor mínimo: R$ <?= number_format($item['minimo'], 2, ',', '.') ?></p>
<form method="POST" action="dar_lance.php">
    <input type="hidden" name="item_id" value="<?= $item['id'] ?>">
    <input type="number" name="valor" step="0.01" min="<?= $item['minimo'] ?>" required>
    <button type="submit">Dar lance</button>
</form>