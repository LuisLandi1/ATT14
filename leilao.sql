CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(64) NOT NULL
)
CREATE TABLE IF NOT EXISTS itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    minimo DECIMAL(10, 2) NOT NULL,
    estado ENUM('aberto', 'encerrado') DEFAULT 'aberto',
    vencedor INT NULL,
    FOREIGN KEY (vencedor) REFERENCES usuarios(id)
)
CREATE TABLE IF NOT EXISTS lances (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    usuario_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES itens(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
)