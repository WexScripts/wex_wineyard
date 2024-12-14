INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_wine', 'Wine', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_wine', 'Wine', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_wine', 'Wine', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('wine', 'Wine')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('wine',0,'worker','worker',20,'{}','{}'),
	('wine',1,'skilled','skilled',40,'{}','{}'),
	('wine',2,'manager','manager',60,'{}','{}'),
	('wine',3,'boss','owner',85,'{}','{}')
;