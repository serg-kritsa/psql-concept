-- this took 9 minutes on my computer to run

CREATE TABLE airports_json AS (
SELECT JSONB_STRIP_NULLS (
	 jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ',')),
	'runways', (SELECT JSONB_AGG(to_jsonb(runway_json)) FROM
		(SELECT le_ident, he_ident, length_ft, width_ft, surface,
		 	lighted AS is_lighted,closed AS is_closed,
			le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
			he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
		FROM runways
		WHERE airport_ident = air.ident) as runway_json
		),
	'navaids', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT name, filename, ident, type, frequency_khz,
					latitude_deg, longitude_deg, elevation_ft, dme_frequency_khz,
					dme_channel, dme_latitude_deg, dme_latitude_deg,dme_elevation_ft,
					slaved_variation_deg, magnetic_variation_deg,usagetype, power
				FROM navaids
				WHERE associated_airport = air.ident) AS nav
		),
	'frequencies', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT type, description, frequency_mhz
				FROM airport_frequencies
				WHERE airport_ident = air.ident) AS nav
		)
)) AS airports

FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code
);
