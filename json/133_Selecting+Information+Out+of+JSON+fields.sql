SELECT airports->'runways'->0, airports->'country_name'
FROM airports_json;

SELECT airports->'runways'->>0, airports->>'country_name'
FROM airports_json;

SELECT '{"a": {"b": [3, 2, 1]}}'::jsonb #> '{a,b}';

SELECT '{"a": {"b": [3, 2, 1], "c": {"d": 5}}}'::jsonb #> '{a, c, d}';

SELECT airports->'frequencies'->1, airports->>'region_name'
FROM airports_json
ORDER BY  airports->'frequencies'->1 ASC;
