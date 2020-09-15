create table seeker (
seeker_id int primary key,
seeker_name varchar(100),
experience varchar(500),
wanted_job_title varchar(100)
)

create table employer(
employer_id int primary key,
employer_name varchar(100),
job_title varchar(100),
)

create table job(
job_id int primary key,
employer_id int,
job_title varchar(100),
job_location varchar(300),
required_experience varchar(500),
published_date date,
isvacancy bit,
foreign key (employer_id) references employer(employer_id)
)

ALTER TABLE job
DROP column isvacancy;

ALTER TABLE job
ADD isvacancy varchar(1);

create table applications(
job_id int,
seeker_id int,
primary key(job_id, seeker_id),
apply_date date,
foreign key (seeker_id) references seeker(seeker_id),
foreign key (job_id) references job(job_id)
)

INSERT INTO seeker values (1,'basmala','coding and multitasking','programming')
INSERT INTO seeker values (2,'betty','creativity and teamwork','engineering')
INSERT INTO seeker values (3,'jughead','persuation and smat ','law')
INSERT INTO seeker values (4,'harry','the ability to work under pressureand teamwork','engineering')
INSERT INTO seeker values (5,'damon','A passion for problem solving and Basic mathematical skills','programming')
INSERT INTO seeker values (6,'four','Basic mathematical skills multitasking','programming')
INSERT INTO seeker values (7,'hazan','coding and A passion for problem solving','programming')

INSERT INTO employer values (1,'androw','programming')
INSERT INTO employer values (2,'jones','engineering')
INSERT INTO employer values (3,'veronica','law')
INSERT INTO employer values (4,'cheryl','education')

INSERT INTO job values (1,1,'programming','9st maadi,cairo,egypt','coding and A passion for problem solving','2020-02-15',1)
INSERT INTO job values (2,2,'engineering','talaat harb,cairo,egypt','creativity and teamwork','2020-03-19',1)
INSERT INTO job values (3,3,'engineering','talaat harb,cairo,egypt','creativity and teamwork','2020-04-19',1)
INSERT INTO job values (4,4,'education','9st maadi,cairo,egypt','patient and smart communication skills','2020-05-14',1)

INSERT INTO applications values (1,1,'2020-05-15')
INSERT INTO applications values (2,2,'2020-05-19')
INSERT INTO applications values (3,3,'2020-05-29')
INSERT INTO applications values (4,4,'2020-05-14')

SELECT job_id 
FROM applications
WHERE DATEPART(m, apply_date) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, apply_date) = DATEPART(yyyy, DATEADD(m, -1, getdate()))

SELECT employer_id,
COUNT(employer_id) AS number_of_announcments 
FROM job
GROUP BY employer_id
ORDER BY number_of_announcments DESC
LIMIT 1