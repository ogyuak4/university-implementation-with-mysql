create table COLLAGE (
    C_ID INT PRIMARY KEY NOT NULL,
    C_Name VARCHAR(50),
    C_Office VARCHAR(50),
    C_Phone VARCHAR(50), 
    C_FM_ID INT             /*FOREİGN KEY*/
);

create table DEPARTMENT (
    D_Code INT PRIMARY KEY NOT NULL,
    D_Name VARCHAR(50),
    D_Office VARCHAR(50),
    D_Phone VARCHAR(50),
    Start_Date DATE,
    D_FM_ID INT,                 /*FOREİGN KEY*/
    D_C_ID INT                    /*FOREİGN KEY*/
);


/*DROP TABLE FACULTY_MEMBER;*/
create table FACULTY_MEMBER (
    FM_ID INT PRIMARY KEY,
    FM_Phone VARCHAR(50),
    FM_Office VARCHAR(50),
    FM_Email VARCHAR(50),
    FM_Rank TEXT,
    FM_Name VARCHAR(50),
    Worked_Year INT,
    FM_D_Code INT      /*FOREİGN KEY*/
);

ALTER TABLE Collage
ADD FOREIGN KEY (C_FM_ID) REFERENCES FACULTY_MEMBER(FM_ID);

ALTER TABLE department
ADD FOREIGN KEY (D_FM_ID) REFERENCES FACULTY_MEMBER(FM_ID);

ALTER TABLE department
ADD FOREIGN KEY (D_C_ID) REFERENCES COLLAGE(C_ID);

ALTER TABLE faculty_member
ADD FOREIGN KEY (FM_D_Code) REFERENCES DEPARTMENT(D_Code);


create table CURRICULUM (
    Curric_ID INT PRIMARY KEY,
    Curric_Name VARCHAR(50),
    Curric_D_Code INT      /*FOREİGN KEY*/
);



ALTER TABLE CURRICULUM
ADD FOREIGN KEY (Curric_D_Code) REFERENCES DEPARTMENT(D_Code);


create table STUDENT (
    S_ID INT PRIMARY KEY,
    DOB DATE,
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    Address VARCHAR(60),
    Major TEXT,
    S_Photo VARCHAR(60),
    St_D_Code INT              /*FOREİGN KEY*/
);


ALTER TABLE STUDENT
ADD FOREIGN KEY (St_D_Code) REFERENCES DEPARTMENT(D_Code);

create table COURSE (
    Co_Code INT PRIMARY KEY,
    Co_Name TEXT,
    Co_Level INT,
    Co_Description TEXT
);
ALTER TABLE course
ADD Co_Credit INT;


create table KEYWORD (
    Keyword_Name VARCHAR(50) PRIMARY KEY
);



create table RESEARCH_AREA (
    Ra_Name VARCHAR(50) PRIMARY KEY
);


create table SECTION (
    Sec_ID INT PRIMARY KEY,
    Sec_No INT,
    Building VARCHAR(50),
    Room_No INT,
    Semester INT,
    year INT,
    Days_Time INT,
    Sec_Start_Date DATE,
    Sec_End_Date DATE,
    Sec_Co_Code INT     /*FOREİGN KEY*/
);

ALTER TABLE SECTION
ADD FOREIGN KEY (Sec_Co_Code) REFERENCES COURSE(Co_Code);

create table THESIS (
    Title VARCHAR(150) PRIMARY KEY,
    Th_Fm_ID INT            /*FOREİGN KEY*/
);


ALTER TABLE THESIS
ADD FOREIGN KEY (Th_Fm_ID) REFERENCES faculty_member(FM_ID);

create table PAIR (
    Pair_ID INT PRIMARY KEY,
    P_Curric_ID INT,      /*FOREİGN KEY*/
    P_Course_ID INT          /*FOREİGN KEY*/
);


ALTER TABLE PAIR
ADD FOREIGN KEY (P_Curric_ID) REFERENCES curriculum(Curric_ID);

ALTER TABLE PAIR
ADD FOREIGN KEY (P_Course_ID) REFERENCES course(Co_Code);




create table KEYWORD_CONTAIN_COURSE (
    KCC_ID INT PRIMARY KEY,
    KCC_Co_Code INT,         /*FOREİGN KEY*/
    KCC_Keyword_Name VARCHAR(50)           /*FOREİGN KEY*/
);




ALTER TABLE KEYWORD_CONTAIN_COURSE
ADD FOREIGN KEY (KCC_Co_Code) REFERENCES course(Co_Code);

ALTER TABLE KEYWORD_CONTAIN_COURSE
ADD FOREIGN KEY (KCC_Keyword_Name) REFERENCES Keyword(Keyword_Name);



create table RESEARCH_AREA_INCLUDE_KEYWORD (
    RAIK_Keyword_Name VARCHAR(50),    /*FOREİGN KEY*/
    RAIK_Research_Area_Name VARCHAR(50)       /*FOREİGN KEY*/
);



ALTER TABLE RESEARCH_AREA_INCLUDE_KEYWORD
ADD FOREIGN KEY (RAIK_Keyword_Name) REFERENCES keyword(Keyword_Name);

ALTER TABLE RESEARCH_AREA_INCLUDE_KEYWORD
ADD FOREIGN KEY (RAIK_Research_Area_Name) REFERENCES research_area(Ra_Name);

create table FACULTY_MEMBER_INTERESTED_IN_RA (
    FMIRA_FM_ID INT,            /*FOREİGN KEY*/
    FMIRA_RA_NAME VARCHAR(50)   /*FOREİGN KEY*/
);



ALTER TABLE FACULTY_MEMBER_INTERESTED_IN_RA
ADD FOREIGN KEY (FMIRA_FM_ID) REFERENCES faculty_member(FM_ID);

ALTER TABLE FACULTY_MEMBER_INTERESTED_IN_RA
ADD FOREIGN KEY (FMIRA_RA_NAME) REFERENCES research_area(Ra_Name);

create table TEACHERS_TEACHES_SECTİON (
    TTS_FM_ID INT,
    TTS_SEC_ID INT
);



create table MATCHING_CRITERIA (
    MC_FM_ID INT,
    MC_CO_Code INT,    /*FOREİGN KEY*/
    MC_MV VARCHAR(50)   /*FOREİGN KEY*/
);



ALTER TABLE MATCHING_CRITERIA
ADD FOREIGN KEY (MC_FM_ID) REFERENCES faculty_member(FM_ID);

ALTER TABLE MATCHING_CRITERIA
ADD FOREIGN KEY (MC_CO_Code) REFERENCES course(Co_Code);

create table STUDENT_TAKE_SECTION (
    STS_S_ID INT,    /*FOREİGN KEY*/
    STS_Sec_ID INT,     /*FOREİGN KEY*/
    STS_Grade DECIMAL(3,2)
);



ALTER TABLE STUDENT_TAKE_SECTION
ADD FOREIGN KEY (STS_S_ID) REFERENCES student(S_ID);

ALTER TABLE STUDENT_TAKE_SECTION
ADD FOREIGN KEY (STS_Sec_ID) REFERENCES section(Sec_ID);

create table MANDATORY (
    Mandatory_Co_Code INT    /*FOREİGN KEY*/
);



ALTER TABLE MANDATORY
ADD FOREIGN KEY (Mandatory_Co_Code) REFERENCES course(Co_Code);

create table OPTIONAL (
    Optional_Co_Code INT,       /*FOREİGN KEY*/
    Optional_is_technical VARCHAR(50)
);



ALTER TABLE OPTIONAL
ADD FOREIGN KEY (OPTIONAL_Co_Code) REFERENCES course(Co_Code);

create table RESEARCH_ASSISTANT (
    Research_Assistant_FM_ID INT       /*FOREİGN KEY*/
);



ALTER TABLE RESEARCH_ASSISTANT
ADD FOREIGN KEY (Research_Assistant_FM_ID) REFERENCES faculty_member(FM_ID);

create table INSTRUCTOR (
    INSTRUCTOR_FM_ID INT,      /*FOREİGN KEY*/
    INSTRUCTOR_Prof_Type VARCHAR(50)
);




ALTER TABLE INSTRUCTOR
ADD FOREIGN KEY (INSTRUCTOR_FM_ID) REFERENCES faculty_member(FM_ID);

create table MSC (
    MSC_FM_ID INT      /*FOREİGN KEY*/

);




ALTER TABLE MSC
ADD FOREIGN KEY (MSC_FM_ID) REFERENCES faculty_member(FM_ID);

create table PHD (
    PHD_FM_ID INT       /*FOREİGN KEY*/
);



ALTER TABLE PHD
ADD FOREIGN KEY (PHD_FM_ID) REFERENCES faculty_member(FM_ID);


insert into COLLAGE (C_ID, C_Name, C_Office, C_Phone, C_FM_ID) values (4, 'Mount Mary College', '69 Nevada Hill', '(102) 1057904',1);
insert into COLLAGE (C_ID, C_Name, C_Office, C_Phone, C_FM_ID) values (5, 'Romanian-American University', '783 Springview Avenue', '(189) 5124212',2);
insert into COLLAGE (C_ID, C_Name, C_Office, C_Phone, C_FM_ID) values (6, 'Universidad Libre de Costa Rica', '8244 Farmco Place', '(530) 1904159',3);


insert into DEPARTMENT (D_Code, D_Name, D_Office, D_Phone, Start_Date, D_FM_ID, D_C_ID) values (1, 'University of Basrah', 'Faculty of Business and Law.', '(164) 8894689', '2022-07-03 07:11:02', 1, 4);
insert into DEPARTMENT (D_Code, D_Name, D_Office, D_Phone, Start_Date, D_FM_ID, D_C_ID) values (2, 'Instituto Superior Politécnico Gaya', 'Faculty of Creative and Cultural Industries.', '(802) 9311258', '2022-12-01 07:59:57', 2, 4);
insert into DEPARTMENT (D_Code, D_Name, D_Office, D_Phone, Start_Date, D_FM_ID, D_C_ID) values (3, 'Lyndon State College', 'Faculty of Humanities and Social Sciences', '(308) 3574926', '2021-12-30 02:59:36', 3, 4);
insert into DEPARTMENT (D_Code, D_Name, D_Office, D_Phone, Start_Date, D_FM_ID, D_C_ID) values (4, 'New Jersey City University', 'Faculty of Technology', '(145) 6566818', '2022-01-28 03:11:29', 4, 4);
insert into DEPARTMENT (D_Code, D_Name, D_Office, D_Phone, Start_Date, D_FM_ID, D_C_ID) values (5, 'National Cheng Kung University', 'Faculty of Technology', '(552) 7777645', '2022-10-07 11:38:53', 5, 5);


insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (1, '(943) 7256023', '215 Dovetail Park', 'jonraet0@comcast.net', 'teacher', 'Jerrold Onraet', 18, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (2, '(502) 1952933', '2449 Packers Way', 'splunket1@flavors.me', 'teacher', 'Sibella Plunket', 20, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (3, '(465) 4849138', '48 Cambridge Circle', 'ljump2@va.gov', 'teacher', 'Liane Jump', 10, 3);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (4, '(510) 5691131', '18 Brentwood Parkway', 'ffrediani3@last.fm', 'teacher', 'Teresa Palmer', 29, 4);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (5, '(600) 6756195', '78 2nd Lane', 'htreamayne4@ow.ly', 'teacher', 'Helene Treamayne', 5, 5);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (6, '(266) 2508971', '3175 Blue Bill Park Trail', 'etreweela5@live.com', 'teacher', 'Ornella Muti', 35, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (7, '(315) 1755262', '104 Merchant Place', 'mminchinton6@goodreads.com', 'Professor', 'Meredith Minchinton', 16, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (8, '(326) 9213623', '46474 Talmadge Hill', 'bgerrelt7@shareasale.com', 'Professor', 'Berkly Gerrelt', 20, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (9, '(400) 4554269', '5987 Farwell Parkway', 'nfulleylove8@engadget.com', 'Professor', 'Norah Fulleylove', 28, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (10, '(699) 1799383', '8 Melby Hill', 'lrichardin9@google.es', 'Professor', 'Leela Richardin', 8, 1);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (11, '(192) 5773763', '46809 Tennyson Place', 'mferrettinia@shutterfly.com', 'Professor', 'Minna Ferrettini', 3, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (12, '(115) 4367040', '51 Ridgeway Way', 'hrivallandb@smugmug.com', 'Professor', 'Hernando Rivalland', 21, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (13, '(540) 3848031', '9547 Fieldstone Lane', 'okeepinc@latimes.com', 'Professor', 'Orlando Keepin', 9, 3);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (14, '(350) 4110983', '3 Monument Pass', 'vtiltd@time.com', 'Professor', 'Valry Tilt', 7, 4);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (15, '(483) 2750455', '21194 Sauthoff Pass', 'asherbornee@skyrock.com', 'Professor', 'Adolphus Sherborne', 6, 5);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (16, '(882) 9348983', '269 Redwing Terrace', 'jcoleirof@noaa.gov', 'Professor', 'Janette Coleiro', 18, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (17, '(159) 8596831', '97 Hoard Plaza', 'mmattausg@list-manage.com', 'Professor', 'Mariette Mattaus', 11, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (18, '(812) 3357106', '1830 Union Center', 'tbayfordh@sohu.com', 'assistant', 'Nastassia Kinski', 2, 2);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (19, '(902) 9586126', '97 Homewood Center', 'chammermani@desdev.cn', 'assistant', 'Carlyn Hammerman', 9, 3);
insert into FACULTY_MEMBER (FM_ID, FM_Phone, FM_Office, FM_Email, FM_Rank, FM_Name, Worked_Year, FM_D_Code) values (20, '(904) 5605041', '993 Buell Avenue', 'dmcleoidj@noaa.gov', 'assistant', 'Dani McLeoid', 4, 2);


insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (1, 'MECHANIC PHYSIC', 5);
insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (2, 'ALGORITHM AND PROBLEMS', 4);
insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (3, 'CALCULUS 1', 4);
insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (4, 'CALCULUS 2', 1);
insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (5, 'DATABASE CREATING', 2);
insert into CURRICULUM (Curric_ID, Curric_Name, Curric_D_Code) values (6, 'CINEMA AND TELEVISION', 3);




insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (1, '2022-11-05 19:56:09', 'Peter', 'Daphnée', 'Geard', '49 Vermont Junction', 'biology', 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (2, '2022-07-30 23:39:46', 'Fako', null, 'Smartman', '96065 Fisk Way', 'biology', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (3, '2022-06-06 08:30:44', 'Hector', null, 'Dudmarsh', '13892 Lakeland Lane', 'biology', 'http://dummyimage.com/190x100.png/dddddd/000000', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (4, '2022-04-01 06:45:45', 'Christel', 'Nadège', 'Tellenbrook', '1407 Westport Hill', 'biology', 'http://dummyimage.com/161x100.png/dddddd/000000', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (5, '2022-02-28 05:09:09', 'Teodoro', null, 'Skule', '3 Duke Alley', 'artificial intelligence', 'http://dummyimage.com/161x100.png/ff4444/ffffff', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (6, '2022-01-13 05:07:53', 'Holli', 'Michèle', 'Pitts', '094 Dahle Park', 'artificial intelligence', 'http://dummyimage.com/201x100.png/cc0000/ffffff', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (7, '2022-06-01 06:39:16', 'Starlin', null, 'Reedman', '0 Merrick Lane', 'artificial intelligence', 'http://dummyimage.com/240x100.png/dddddd/000000', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (8, '2022-07-25 23:41:15', 'Cate', null, 'Blanchett', '7937 East Pass', 'artificial intelligence', 'http://dummyimage.com/128x100.png/dddddd/000000', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (9, '2022-05-02 23:10:50', 'Flora', 'Wá', 'Dowdle', '117 Mosinee Hill', 'artificial intelligence', 'http://dummyimage.com/109x100.png/dddddd/000000', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (10, '2022-07-05 08:12:54', 'Sal', 'Jú', 'Lafay', '836 Huxley Center', 'artificial intelligence', 'http://dummyimage.com/103x100.png/dddddd/000000', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (11, '2022-02-17 12:40:16', 'Alvera', null, 'Softley', '0 International Avenue', 'model', 'http://dummyimage.com/158x100.png/cc0000/ffffff', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (12, '2022-11-09 21:46:00', 'Dionne', 'Thérèse', 'Buswell', '344 Hauk Lane', 'mathematic', 'http://dummyimage.com/156x100.png/cc0000/ffffff', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (13, '2022-09-30 16:19:23', 'Leona', null, 'Jirka', '471 Merchant Terrace', 'mathematic', 'http://dummyimage.com/139x100.png/dddddd/000000', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (14, '2022-11-28 05:01:46', 'Faustina', 'Eléonore', 'Izhak', '213 Helena Circle', 'mathematic', 'http://dummyimage.com/115x100.png/ff4444/ffffff', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (15, '2022-02-10 09:42:10', 'Fania', null, 'Merricks', '03777 Evergreen Parkway', 'mathematic', 'http://dummyimage.com/115x100.png/ff4444/ffffff', 5);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (16, '2022-11-06 19:56:09', 'Peter', 'Daphnée', 'Geard', '59 Vermont Junction', 'biology', 'http://dummyimage.com/226x100.png/5fa2dd/ffffff1', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (17, '2022-07-20 23:39:46', 'Farewell', null, 'Smartman', '10665 Fisk Way', 'biology', 'http://dummyimage.com/100x100.png/ff4444/ffffff1', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (18, '2022-06-07 08:30:44', 'Hüseyin', null, 'Dudmarsh', '13882 Lakeland Lane', 'biology', 'http://dummyimage.com/190x100.png/dddddd/0000001', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (19, '2022-04-01 06:45:45', 'Chris', 'Nadège', 'Tellenbrook', '1453 Westport Hill', 'biology', 'http://dummyimage.com/161x100.png/dddddd/0000001', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (20, '2022-02-28 05:09:09', 'Augustus', null, 'Hill', '3 Cruke Alley', 'artificial intelligence', 'http://dummyimage.com/161x100.png/ff4444/ffffff1', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (21, '2022-01-13 05:07:53', 'Hasan', 'Michèle', 'Pitts', '094 Dakdak Park', 'artificial intelligence', 'http://dummyimage.com/201x100.png/cc0000/ffffff1', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (22, '2022-06-01 06:39:16', 'Scarlett', null, 'Hohanson', '0 Merrick Lane', 'artificial intelligence', 'http://dummyimage.com/240x100.png/dddddd/0000001', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (23, '2022-07-15 23:41:15', 'Hakan', null, 'Balamir', '7937 West Pass', 'artificial intelligence', 'http://dummyimage.com/128x100.png/dddddd/0000001', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (24, '2022-05-12 23:10:50', 'McNulty', 'Wá', 'Dowdle', '117 Mosinee Hill', 'artificial intelligence', 'http://dummyimage.com/109x100.png/dddddd/0000001', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (25, '2022-07-15 08:12:54', 'Bunk', 'Jú', 'Lafay', '836 Huxley Center', 'artificial intelligence', 'http://dummyimage.com/103x100.png/dddddd/0000001', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (26, '2022-02-27 12:40:16', 'Kareem', null, 'Said', '0 International Avenue', 'model', 'http://dummyimage.com/158x100.png/cc0000/ffffff1', 1);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (27, '2022-11-09 21:46:00', 'Dio', 'Thérèse', 'Buswell', '314 Hanuk Lane', 'mathematic', 'http://dummyimage.com/156x100.png/cc0000/ffffff1', 2);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (28, '2022-09-30 16:19:23', 'Leo', null, 'Jirka', '471 Raid Terrace', 'mathematic', 'http://dummyimage.com/139x100.png/dddddd/0000001', 3);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (29, '2022-11-28 05:01:46', 'Faust', 'Eléonore', 'Izhak', '213 Helen Circle', 'mathematic', 'http://dummyimage.com/115x100.png/ff4444/ffffff1', 4);
insert into STUDENT (S_ID, DOB, FName, MName, LName, Address, Major, S_Photo, St_D_Code) values (30, '2022-10-01 09:42:10', 'Ali', null, 'Merricks', '0377 Green Parkway', 'mathematic', 'http://dummyimage.com/115x100.png/ff4444/ffffff1', 5);



insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (1, 'CALCULUS 1', 6, 'nullam orci pede venenatis non sodales sed tincidunt');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (2, 'CALCULUS 2', 3, 'integer a nibh in quis justo maecenas rhoncus aliquam');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (3, 'PYSHIC', 2, 'pellentesque viverra pede ac diam cras pellentesque volutpat dui');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (4, 'HISTORY', 4, 'dui vel sem sed sagittis nam congue');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (5, 'GEOGRAPHY', 2, 'in est risus auctor sed tristique');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (6, 'MATEMATHIC', 3, 'iaculis justo in hac habitasse platea dictumst etiam');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (7, 'ENGLISH', 1, 'aliquam augue quam sollicitudin vitae consectetuer');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (8, 'TURKISH', 1, 'vel sem sed sagittis nam congue');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (9, 'ELECTRIC', 4, 'nam dui proin leo');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (10, 'MUSIC', 4, 'nonummy integer non velit');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (11, 'CINEMA AND RADIO', 5, 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc');
insert into COURSE (Co_Code, Co_Name, Co_Level, Co_Description) values (12, 'DATABASE MANAGEMENT', 4, 'donec ut dolor morbi vel lectus in');

UPDATE course
SET Co_Credit = 2
WHERE Co_Code = 1;

 UPDATE course
SET Co_Credit = 2
WHERE Co_Code = 2;

UPDATE course
SET Co_Credit = 2
WHERE Co_Code = 3;

UPDATE course
SET Co_Credit = 2
WHERE Co_Code = 4;

UPDATE course
SET Co_Credit = 2
WHERE Co_Code = 5;

UPDATE course
SET Co_Credit = 3
WHERE Co_Code = 6;

UPDATE course
SET Co_Credit = 3
WHERE Co_Code = 7;

UPDATE course
SET Co_Credit = 4
WHERE Co_Code = 8;

UPDATE course
SET Co_Credit = 4
WHERE Co_Code = 9;

UPDATE course
SET Co_Credit = 4
WHERE Co_Code = 10;

UPDATE course
SET Co_Credit = 6
WHERE Co_Code = 11;

UPDATE course
SET Co_Credit = 6
WHERE Co_Code = 12;



insert into KEYWORD (Keyword_Name) values ('ramm');
insert into KEYWORD (Keyword_Name) values ('stein');
insert into KEYWORD (Keyword_Name) values ('food');
insert into KEYWORD (Keyword_Name) values ('military');
insert into KEYWORD (Keyword_Name) values ('electric');
insert into KEYWORD (Keyword_Name) values ('car');



insert into RESEARCH_AREA (Ra_Name) values ('science');
insert into RESEARCH_AREA (Ra_Name) values ('sport');
insert into RESEARCH_AREA (Ra_Name) values ('radio and television');
insert into RESEARCH_AREA (Ra_Name) values ('medicine');



insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (1, 1, '17 Knutson Court', 12, 1, 2015, 2, '2021-12-07 05:04:31', '2022-10-04 06:50:41', 1);
insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (2, 1, '459 South Parkway', 3, 2, 2010, 4, '2021-06-02 02:34:04', '2022-11-22 10:01:15', 2);
insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (3, 1, '3 Kenwood Crossing', 8, 2, 2005, 1, '2021-10-31 05:15:33', '2022-12-07 04:22:38', 3);
insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (4, 2, '35102 Holy Cross Drive', 11, 1, 2020, 5, '2021-11-19 13:21:03', '2022-09-15 09:30:28', 4);
insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (5, 2, '302 Schmedeman Place', 18, 1, 2002, 4, '2021-01-23 14:13:57', '2022-12-11 19:50:44', 10);
insert into SECTION (Sec_ID, Sec_No, Building, Room_No, Semester, year, Days_Time, Sec_Start_Date, Sec_End_Date, Sec_Co_Code) values (6, 2, '60300 Valley Edge Circle', 2, 2, 2003, 3, '2021-04-09 22:21:50', '2022-09-28 10:53:01', 9);



insert into THESIS (Title, Th_Fm_ID) values ('The consequences of obesity', 1);
insert into THESIS (Title, Th_Fm_ID) values ('Why individualism is the most important ideology?', 2);
insert into THESIS (Title, Th_Fm_ID) values ('Economic development and happiness', 3);
insert into THESIS (Title, Th_Fm_ID) values ('Feminism in the United States', 4);
insert into THESIS (Title, Th_Fm_ID) values ('The effects of the COVID-19 pandemic', 5);
insert into THESIS (Title, Th_Fm_ID) values ('Racism in schools and colleges', 6);
insert into THESIS (Title, Th_Fm_ID) values ('Overeducation in the labor market', 7);
insert into THESIS (Title, Th_Fm_ID) values ('DNA evidence in criminal justice', 8);
insert into THESIS (Title, Th_Fm_ID) values ('Evolving dictatorship in third world countries', 9);
insert into THESIS (Title, Th_Fm_ID) values ('The obey culture in Middle East Countries', 10);
insert into THESIS (Title, Th_Fm_ID) values ('Is liberalism the most optimal solution? (yes)', 11);
insert into THESIS (Title, Th_Fm_ID) values ('Discuss the feminist movement from 1845 to 1920.', 12);




insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (1, 1, 2);
insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (2, 1, 2);
insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (3, 3, 3);
insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (4, 4, 4);
insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (5, 6, 5);
insert into PAIR (Pair_ID, P_Curric_ID, P_Course_ID) values (6, 6, 5);




insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (1, 1, 'electric');
insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (2, 2, 'car');
insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (3, 3, 'food');
insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (4, 4, 'electric');
insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (5, 5, 'car');
insert into KEYWORD_CONTAIN_COURSE (KCC_ID, KCC_Co_Code, KCC_Keyword_Name) values (6, 6, 'military');



insert into RESEARCH_AREA_INCLUDE_KEYWORD (RAIK_Keyword_Name, RAIK_Research_Area_Name) values ('food', 'science');
insert into RESEARCH_AREA_INCLUDE_KEYWORD (RAIK_Keyword_Name, RAIK_Research_Area_Name) values ('electric', 'sport');
insert into RESEARCH_AREA_INCLUDE_KEYWORD (RAIK_Keyword_Name, RAIK_Research_Area_Name) values ('car', 'medicine');



insert into FACULTY_MEMBER_INTERESTED_IN_RA (FMIRA_FM_ID, FMIRA_RA_NAME) values (1, 'science');
insert into FACULTY_MEMBER_INTERESTED_IN_RA (FMIRA_FM_ID, FMIRA_RA_NAME) values (2, 'sport');
insert into FACULTY_MEMBER_INTERESTED_IN_RA (FMIRA_FM_ID, FMIRA_RA_NAME) values (3, 'medicine');
insert into FACULTY_MEMBER_INTERESTED_IN_RA (FMIRA_FM_ID, FMIRA_RA_NAME) values (4, 'sport');
insert into FACULTY_MEMBER_INTERESTED_IN_RA (FMIRA_FM_ID, FMIRA_RA_NAME) values (5, 'science');




insert into TEACHERS_TEACHES_SECTİON (TTS_FM_ID, TTS_SEC_ID) values (1, 1);
insert into TEACHERS_TEACHES_SECTİON (TTS_FM_ID, TTS_SEC_ID) values (2, 2);
insert into TEACHERS_TEACHES_SECTİON (TTS_FM_ID, TTS_SEC_ID) values (3, 3);
insert into TEACHERS_TEACHES_SECTİON (TTS_FM_ID, TTS_SEC_ID) values (4, 4);
insert into TEACHERS_TEACHES_SECTİON (TTS_FM_ID, TTS_SEC_ID) values (5, 5);




insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (1, 1, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (2, 2, false);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (3, 3, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (4, 4, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (5, 5, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (6, 6, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (7, 7, false);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (8, 8, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (9, 9, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (10, 10, false);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (11, 11, true);
insert into MATCHING_CRITERIA (MC_FM_ID, MC_CO_Code, MC_MV) values (12, 12, true);



insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (1, 1, 2.58);
insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (2, 2, 2.46);
insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (3, 3, 3.72);
insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (4, 4, 2.74);
insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (5, 5, 2.01);
insert into STUDENT_TAKE_SECTION (STS_S_ID, STS_Sec_ID, STS_Grade) values (6, 6, 2.02);




insert into MANDATORY (Mandatory_Co_Code) values (1);
insert into MANDATORY (Mandatory_Co_Code) values (2);
insert into MANDATORY (Mandatory_Co_Code) values (3);
insert into MANDATORY (Mandatory_Co_Code) values (4);
insert into MANDATORY (Mandatory_Co_Code) values (5);



insert into OPTIONAL (Optional_Co_Code, Optional_is_technical) values (1, true);
insert into OPTIONAL (Optional_Co_Code, Optional_is_technical) values (2, false);
insert into OPTIONAL (Optional_Co_Code, Optional_is_technical) values (3, true);
insert into OPTIONAL (Optional_Co_Code, Optional_is_technical) values (4, true);
insert into OPTIONAL (Optional_Co_Code, Optional_is_technical) values (5, false);




insert into RESEARCH_ASSISTANT (Research_Assistant_FM_ID) values (1);
insert into RESEARCH_ASSISTANT (Research_Assistant_FM_ID) values (2);
insert into RESEARCH_ASSISTANT (Research_Assistant_FM_ID) values (3);



insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (1, 'professor');
insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (2, 'professor');
insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (3, 'assistant professor');
insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (4, 'assistant professor');
insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (5, 'associate professor');
insert into INSTRUCTOR (INSTRUCTOR_FM_ID, INSTRUCTOR_Prof_Type) values (6, 'associate professor');




insert into MSC (MSC_FM_ID) values (1);
insert into MSC (MSC_FM_ID) values (2);
insert into MSC (MSC_FM_ID) values (3);
insert into MSC (MSC_FM_ID) values (4);



insert into PHD (PHD_FM_ID) values (1);
insert into PHD (PHD_FM_ID) values (2);
insert into PHD (PHD_FM_ID) values (3);
insert into PHD (PHD_FM_ID) values (4);






/*CHECK CONSTRAİNT 1: Any of the first name and last name fields cannot be NULL */
ALTER TABLE STUDENT
ADD CHECK (FName IS NOT NULL OR LName IS NOT NULL);




/*CHECK CONSTRAİNT 2: In the SECTION table, End Date cannot be greater than the Start Date */

ALTER TABLE section
ADD CONSTRAINT CheckDate
CHECK (Sec_Start_Date<Sec_End_Date )




/* course credits can not greater than 6 and lower than 2 */

ALTER TABLE course
  ADD CONSTRAINT course_credit_check 
  CHECK (Co_Credit >= 2 AND Co_Credit <= 6)
  ;

