-- Projeto Zuber — Chicago, novembro de 2017
-- Dialeto: PostgreSQL. Executar no banco disponibilizado pelo curso.
-- Os limites finais exclusivos incluem o último dia inteiro de cada período.

-- PASSO 2.1: corridas por empresa em 15 e 16 de novembro.
SELECT
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM trips AS t
INNER JOIN cabs AS c ON t.cab_id = c.cab_id
WHERE t.start_ts >= TIMESTAMP '2017-11-15 00:00:00'
  AND t.start_ts < TIMESTAMP '2017-11-17 00:00:00'
GROUP BY c.company_name
ORDER BY trips_amount DESC;

-- PASSO 2.2: nomes que contêm Yellow ou Blue, de 1 a 7 de novembro.
SELECT
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM trips AS t
INNER JOIN cabs AS c ON t.cab_id = c.cab_id
WHERE t.start_ts >= TIMESTAMP '2017-11-01 00:00:00'
  AND t.start_ts < TIMESTAMP '2017-11-08 00:00:00'
  AND (
      LOWER(c.company_name) LIKE '%yellow%'
      OR LOWER(c.company_name) LIKE '%blue%'
  )
GROUP BY c.company_name
ORDER BY trips_amount DESC;

-- PASSO 2.3: Flash Cab, Taxi Affiliation Services e Other no mês inteiro.
SELECT
    CASE
        WHEN c.company_name IN ('Flash Cab', 'Taxi Affiliation Services')
            THEN c.company_name
        ELSE 'Other'
    END AS company,
    COUNT(t.trip_id) AS trips_amount
FROM trips AS t
INNER JOIN cabs AS c ON t.cab_id = c.cab_id
WHERE t.start_ts >= TIMESTAMP '2017-11-01 00:00:00'
  AND t.start_ts < TIMESTAMP '2017-12-01 00:00:00'
GROUP BY company
ORDER BY trips_amount DESC;

-- PASSO 3.1: identificadores dos bairros.
SELECT name, neighborhood_id
FROM neighborhoods
WHERE name IN ('Loop', 'O''Hare')
ORDER BY neighborhood_id;

-- PASSO 3.2: classificação do clima na hora registrada.
SELECT
    ts,
    CASE
        WHEN LOWER(description) LIKE '%rain%'
          OR LOWER(description) LIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM weather_records
ORDER BY ts;

-- DIAGNÓSTICO: verificar a unicidade de ts antes de unir clima e corridas.
-- Resultado esperado: nenhuma linha. Repetições devem ser investigadas
-- antes do JOIN, pois podem multiplicar as corridas no resultado.
SELECT ts, COUNT(*) AS records_per_hour
FROM weather_records
GROUP BY ts
HAVING COUNT(*) > 1;

-- PASSO 3.3: Loop → O'Hare, sábados de novembro, com clima disponível.
-- No PostgreSQL, EXTRACT(DOW ...) retorna 6 para sábado.
WITH weather_by_hour AS (
    SELECT
        ts,
        CASE
            WHEN LOWER(description) LIKE '%rain%'
              OR LOWER(description) LIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
    FROM weather_records
)
SELECT
    t.start_ts,
    w.weather_conditions,
    t.duration_seconds
FROM trips AS t
INNER JOIN weather_by_hour AS w ON t.start_ts = w.ts
WHERE t.pickup_location_id = 50
  AND t.dropoff_location_id = 63
  AND EXTRACT(DOW FROM t.start_ts) = 6
  AND t.start_ts >= TIMESTAMP '2017-11-01 00:00:00'
  AND t.start_ts < TIMESTAMP '2017-12-01 00:00:00'
ORDER BY t.start_ts;
