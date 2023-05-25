-- Databricks notebook source
-- DBTITLE 1,Filtro para produtos iguais ou mais caros que R$500,00
SELECT *
FROM silver.olist.item_pedido
WHERE vlPreco >= 500

-- COMMAND ----------

-- DBTITLE 1,Comparando valor frete e produto
SELECT *
FROM silver.olist.item_pedido
WHERE vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,Preço maior que 100 reais e frete maior que preço
SELECT *
FROM silver.olist.item_pedido
WHERE vlPreco >= 100
AND vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,Filtrando produtos de petshop, telefonia com OR
SELECT *
FROM silver.olist.produto
WHERE descCategoria = 'pet_shop'
OR descCategoria = 'telefonia'

-- COMMAND ----------

-- DBTITLE 1,Filtrando produtos de petshop, telefonia e bebes com IN
SELECT *
FROM silver.olist.produto
WHERE descCategoria IN ('pet_shop', 'telefonia', 'bebes')

-- COMMAND ----------

SELECT 
  idPedido,
  idCliente,
  descSituacao,
  dtPedido,
  date(dtPedido)

FROM silver.olist.pedido
WHERE date(dtPedido) >= '2017-01-01'
AND date(dtPedido) <= '2017-01-31'

-- COMMAND ----------

SELECT *
FROM silver.olist.pedido
WHERE year(dtPedido) = 2017
AND month(dtPedido) = 1

