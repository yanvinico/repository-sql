-- Databricks notebook source
-- DBTITLE 1,Criando faixas de preços 
SELECT *,
  CASE 
    WHEN vlPreco <= 100 THEN '000 -| 100'
    WHEN vlPreco <= 200 THEN '100 -| 200'
    WHEN vlPreco <= 200 THEN '200 -| 300'
    WHEN vlPreco <= 200 THEN '300 -| 400'
    WHEN vlPreco <= 200 THEN '400 -| 500'
    WHEN vlPreco <= 200 THEN '500 -| 600'
    WHEN vlPreco <= 200 THEN '600 -| 700'
    WHEN vlPreco <= 200 THEN '700 -| 800'
    WHEN vlPreco <= 200 THEN '800 -| 900'
    WHEN vlPreco <= 200 THEN '900 -| 1000'
    ELSE '+1000'
  END as fxPreco
FROM silver.olist.item_pedido

-- COMMAND ----------

-- DBTITLE 1,Valor do frete pelo preço do produto
SELECT *,
  CASE
    WHEN vlFrete / (vlFrete+vlPreco) = 0 THEN 'Frete gratis'
    WHEN vlFrete / (vlFrete+vlPreco) <= 0.2 THEN 'frete baixo'
    WHEN vlFrete / (vlFrete+vlPreco) <= 0.4 THEN 'frete medio'
    ELSE 'frete alto'
  END AS descFrete
FROM silver.olist.item_pedido

-- COMMAND ----------

-- DBTITLE 1,Regiões dos clientes no Brasil
SELECT *,
  CASE 
    WHEN descUF IN ('SC', 'PR', 'RS') THEN 'Sul'
    WHEN descUF IN('RJ','SP', 'MG', 'ES') THEN 'Sudeste'
    WHEN descUF IN('MT', 'MS', 'GO') THEN 'Centro-Oeste'
    WHEN descUF IN('RR', 'AM', 'AP', 'PA', 'TO', 'RO', 'AC') THEN 'Norte'
    WHEN descUF IN('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') THEN 'Nordeste'
  END AS Regiao
FROM silver.olist.cliente

-- COMMAND ----------

-- DBTITLE 1,Naturalidade dos vendedores 
SELECT *,
  CASE 
    WHEN descUF = 'SP' THEN 'Paulista'
    WHEN descUF = 'BA' THEN 'Baiano'
    WHEN descUF = 'RJ' THEN 'Carioca'
    WHEN descUF = 'MG' THEN 'Mineiro'
    ELSE 'Não mapeado'
  END as descNaturalidade
FROM silver.olist.vendedor
