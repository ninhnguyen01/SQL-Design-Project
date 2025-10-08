--------------------------------------------------------
--  File created - Monday-October-11-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STUDENT_T
--------------------------------------------------------


/**************************************

REPLACE JOSEORACLE with your own ID for
accessing Oracle DB!

***************************************/





--Create Students Table

CREATE TABLE "JOSEORACLE"."Students" 
   (	"snum" CHAR(9 BYTE), 
	"sname" CHAR(10 BYTE), 
	"standing" VARCHAR2(15 BYTE),
    "Major" VARCHAR2(15 BYTE),
    "GPA" NUMBER,
    "Major_GPA" number
    PRIMARY KEY ("snum")
   )
;

--Create Courses Table

CREATE TABLE "JOSEORACLE"."Courses"(
   	"dept" VARCHAR2(10 BYTE), 
	"cnum" VARCHAR2(50 BYTE), 
	"ctitle" VARCHAR2(50 BYTE),
    "Major" VARCHAR2(15 BYTE),
    "crhr" NUMBER,
    "standing" number,
    PRIMARY KEY ("cnum")
   )
;

--Create Enrollments Table

CREATE TABLE "JOSEORACLE"."SchClasses"(
   	"callnum" number, 
	"year" number, 
	"semester" VARCHAR2(10 BYTE),
    "dept" VARCHAR2(15 BYTE),
    "cnum" VARCHAR2(15 BYTE),
    "section" VARCHAR2(50 BYTE),
    "day" VARCHAR2(50 BYTE),
    "time" VARCHAR2(50 BYTE),
    "room" VARCHAR2(50 BYTE),
    "instructor" VARCHAR2(50 BYTE),
    "capacity" number,
    PRIMARY KEY ("cnum")
   )
;

--Create Enrollments Table

CREATE TABLE "JOSEORACLE"."Enrollments"(
   	"snum" number, 
	"callnum" number, 
	"grade" VARCHAR2(10 BYTE),
    PRIMARY KEY ("cnum","callnum")
   )
;

--Data for the Students Table

insert into "Students" VALUES (101, 'Andy', 4, 'IS', 2.8, 3.2);
insert into "Students" VALUES (102, 'Betty', 2, null, 3.2, null);
insert into "Students" VALUES (103, 'Cindy', 3, 'IS', 2.5, 3.5);


/*Data for the table 'Courses' */

insert into "Courses" VALUES ('IS', 300, 'Intro to MIS', 3, 2);
insert into "Courses" VALUES ('IS', 310, 'Statistics', 3, 3);
insert into "Courses" VALUES ('IS', 380, 'Database Administration', 3, 3);
insert into "Courses" VALUES ('mkt', 320, 'Intro to MIS', 4, 2);

/*Data for the table 'SchClasses' */

insert into "SchClasses" VALUES (10110, 2015, 'Sp', 'IS', 300, 1, 'MW', '800-930','222','Smith', 45);
insert into "SchClasses" VALUES (10115, 2015, 'Sp', 'IS', 300, 2, 'MW', '900-1015','235','Lee', 35);
insert into "SchClasses" VALUES (10110, 2015, 'Fa', 'IS', 380, 1, 'TTh', '1330-1445','122','Jones', 65);
insert into "SchClasses" VALUES (10110, 2015, 'Fa', 'IS', 320, 1, 'MWF', '1000-1100','122','TBA', 65);

/*Data for the table 'Enrollments' */

insert into "Enrollments" VALUES (101, 10110, 'F');
insert into "Enrollments" VALUES (102, 10110, 'A');
insert into "Enrollments" VALUES (103, 10120, 'A');
