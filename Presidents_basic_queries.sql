-- Query 1

CREATE VIEW president_party
AS
SELECT CONCAT(fname, ' ' ,lname) AS presidents,
party
FROM people
INNER JOIN person_party ON person_party.person_id = people.person_id
INNER JOIN party ON party.party_id = person_party.party_id;

-- Query 2

CREATE VIEW president_terms
AS
SELECT 
CONCAT(fname, ' ', lname) AS Presidents,
num_terms AS Terms
FROM people 
INNER JOIN person_classification USING(person_id)
WHERE classification_id = 1 AND num_terms  > 1; 

-- Query 3

CREATE VIEW president_virginia_artifacts
AS
SELECT 
COUNT(artifact_type_id) AS "Museums in Virginia"
FROM artifacts 
WHERE artifact_type_id = 5 AND state = 'VA'; 

-- Query 4

CREATE VIEW president_artifact
AS
SELECT CONCAT(fname, ' ', lname) AS 'President Name', artifact_name, city, state
FROM people 
INNER JOIN president_artifacts USING(person_id)
INNER JOIN artifacts USING (artifact_id);

-- Query 5

CREATE VIEW average_first_lady_terms
AS
SELECT AVG(num_terms) AS 'AVG Terms for First Lady'
FROM people 
INNER JOIN person_classification USING(person_id)
WHERE person_id = 3;

-- Query 6
CREATE VIEW first_lady_birthplace
AS
SELECT 
person_id,
CONCAT(fname, ' , ', lname) AS First_Lady,
birth_state AS Total_State_Birthplace
FROM people
WHERE person_id IN (
	SELECT DISTINCT person_id
	FROM person_classification
	WHERE classification_id = 3
    )
    ORDER BY Total_State_Birthplace;

