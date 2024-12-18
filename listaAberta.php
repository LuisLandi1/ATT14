<?php
session_start();
$stmt = $pdo->query("SELECT id, nome, minimo FROM itens WHERE estado = 'aberto'");
$itens = $stmt->fetchAll();
?>
<ul>
    <?php foreach ($itens as $item): ?>
        <li>
            <a href="item.php?id=<?= $item['id'] ?>">
                <?= htmlspecialchars($item['nome']) ?> - R$ <?= number_format($item['minimo'], 2, ',', '.') ?>
            </a>
        </li>
    <?php endforeach; ?>
</ul>

