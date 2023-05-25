-- Databricks notebook source
-- DBTITLE 1,Consultando tabelas
SELECT *
FROM silver.olist.pedido
LIMIT 10

-- COMMAND ----------

-- DBTITLE 1,Todas as colunas + 1
SELECT *,
  vlPreco+vlFrete AS vlTotal
FROM silver.olist.item_pedido

-- COMMAND ----------

SELECT idPedido, 
  idProduto,
  vlPreco, 
  vlPreco, 
  vlFrete,
  vlPreco+vlFrete AS vlTotal

FROM silver.olist.item_pedido
