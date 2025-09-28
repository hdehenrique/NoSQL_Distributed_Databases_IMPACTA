#!/bin/bash

# Conectar ao MongoDB e executar agregação
mongo <<EOF
use amazonas;  # Substitua pelo nome do seu banco de dados

db.eventos.aggregate([
  { \$match: { tipo_evento: "compra" } },
  { \$group: { 
      _id: { estado: "\$localizacao.estado", produto_id: "\$produto_id" },
      total_vendido: { \$sum: "\$quantidade" }
    }
  },
  { \$sort: { "_id.estado": 1, total_vendido: -1 } },
  { \$group: {
      _id: "\$_id.estado",
      produtos_populares: { \$push: { produto_id: "\$_id.produto_id", total_vendido: "\$total_vendido" } }
    }
  },
  { \$project: {
      produtos_populares: { \$slice: ["\$produtos_populares", 20] }
    }
  }
]).pretty()
EOF
