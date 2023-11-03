---- https://www.postgresql.org/docs/current/functions-string.html
-- length ( text ) → integer
-- Returns the number of characters in the string.
-- length('jose') → 4

-- left ( string text, n integer ) → text
-- Returns first n characters in the string, or when n is negative, returns all but last |n| characters.
-- left('abcde', 2) → ab

-- right ( string text, n integer ) → text
-- Returns last n characters in the string, or when n is negative, returns all but first |n| characters.
-- right('abcde', 2) → de

CREATE OR REPLACE FUNCTION select_url(path_to_search_for text, additional text[], default_path text)
RETURNS text AS $$
DECLARE
	additional_element text;
	additional_url text;
BEGIN
	FOREACH additional_element IN ARRAY additional LOOP
		IF left(additional_element, length(path_to_search_for)) = path_to_search_for THEN
			additional_url := right(additional_element, length(additional_element) -
												length(path_to_search_for) - 1);
			RETURN trim(additional_url);
		END IF;
	END LOOP;

	RETURN default_path;
END
$$ LANGUAGE plpgsql;


SELECT select_url('sm', ARRAY['sm: /url2', 'md: url3'], '/url1');
SELECT select_url('md', ARRAY['sm: /url2', 'md: url3'], '/url1');
SELECT select_url('md', ARRAY['sm: /url2'], '/url1');

CREATE OR REPLACE FUNCTION first_multiple(x int[], y int) RETURNS int AS $$
DECLARE
	test_number int;
BEGIN
	FOREACH test_number IN ARRAY x LOOP
		IF test_number % y = 0 THEN
			RETURN test_number;
		END IF;
	END LOOP;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

SELECT first_multiple(ARRAY[13, 12, 64, 10], 32);
