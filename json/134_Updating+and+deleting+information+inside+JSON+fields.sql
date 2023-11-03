UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';


SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports - 'nearby_lakes'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

--put it back in so we can delete with other syntax
UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot","Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports #- '{"nearby_lakes", 1}'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"good_restaurants": ["La Terraza", "McDonalds"]}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';

UPDATE airports_json
SET airports = airports #- '{"good_restaurants", 1}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';
