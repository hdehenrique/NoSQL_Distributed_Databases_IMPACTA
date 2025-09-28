# NoSQL_Distributed_Databases_IMPACTA
NoSQL and Distributed Databases - Caso de Estudo NoSQL Documento (Silas Tailer)

# Caso de Estudo NoSQL - Amazonas


## **Responsável**
- Henrique Ferreira Santos

---

## **Sobre o Projeto**
A Amazonas, que vende livros, CDs e alguns eletrodomésticos, quer acompanhar o que os clientes estão fazendo no site:  
- Quais produtos eles clicam;  
- O que estão comprando;  
- E também ter alguns números legais sobre vendas por estado e por produto.  

Nosso desafio foi organizar esses dados usando **MongoDB** de um jeito que seja fácil de consultar, escalar e aceitar novos produtos no futuro sem dor de cabeça.

---

## **Como organizamos os dados**
### **1. Coleção `produtos`**
- Aqui vai tudo que a empresa vende, sem separar por tipo.  
- Campos principais:  
  - `_id` → ID do produto  
  - `nome` → Nome do produto  
  - `categoria` → Tipo do produto (livro, CD, eletrodoméstico, etc.)  
  - `preco` → Preço  
  - `estoque` → Quantidade disponível  
  - `atributos` → Informações específicas de cada tipo de produto (ex: autor e ISBN para livros, artista para CDs, voltagem e marca para eletrodomésticos)  
- **Porquê:** Se a Amazonas vender algo novo amanhã, a gente não precisa mudar nada no esquema principal.

### **2. Coleção `eventos`**
- Aqui registramos tudo que o cliente faz: clique, compra, adicionar ao carrinho, etc.  
- Campos principais:  
  - `_id` → ID do evento  
  - `cliente_id` → ID do cliente  
  - `produto_id` → Produto relacionado ao evento  
  - `tipo_evento` → "clique", "compra", etc.  
  - `quantidade` → Quantos produtos comprou (se for compra)  
  - `valor_total` → Valor total do evento (se for compra)  
  - `data_evento` → Quando aconteceu  
  - `localizacao` → Estado e cidade do cliente  
- **Porquê:** Separando eventos, conseguimos analisar comportamento do cliente sem bagunçar os produtos.

---

## **Exemplos**
- **Produtos:** `collection_produtos.json`  
- **Eventos:** `collection_eventos.json`  

> Tem exemplo de livro, CD e eletrodoméstico, e também eventos de clique e compra.

---

## **Pergunta que escolhemos responder**
> Quais são os **20 produtos mais populares por estado**?

- O comando MongoDB que faz isso está no arquivo **`command_mongo.sh`**.  
- Ele filtra apenas compras, soma quantidades por produto e estado, e retorna os 20 produtos mais vendidos em cada estado.

---

## **Como está organizado o repositório**
