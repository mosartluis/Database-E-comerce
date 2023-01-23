CREATE TABLE "users" (
  "user_id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "password" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "age" int NOT NULL,
  "rol_id" int NOT NULL
);

CREATE TABLE "courses" (
  "course_id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" varhcar NOT NULL,
  "teacher" varhcar NOT NULL,
  "category_id" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "course_video_id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "course_id" uuid NOT NULL
);

CREATE TABLE "categories" (
  "category_id" uuid PRIMARY KEY,
  "category_name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "rol_id" uuid PRIMARY KEY,
  "rol_name" varchar NOT NULL
);

CREATE TABLE "courses_seen" (
  "course_seen_id" uuid PRIMARY KEY,
  "advance" varchar NOT NULL,
  "course_review" text NOT NULL,
  "course_id" uuid NOT NULL,
  "category_id" uuid NOT NULL,
  "user_id" uuid NOT NULL
);

ALTER TABLE "courses_seen" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "courses_seen" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("course_id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("rol_id");


insert into categories 
(
  category_id,
  category_name
)
VALUES 
(
	'a2c8e18b-848c-4fd9-843d-87179f6664b9',	
	'Computing'
),
(
	'ba7deed7-ef14-47e3-9453-d02b4cd67840',	
	'Infrastructure'
),
(
	'052e55c9-db6f-493d-a095-bdce48e6935c',	
	'Developing'
);

insert into roles
(
	rol_id,
  	rol_name
)
VALUES
(
	'9bea25fb-bc21-45a3-8aff-2b10904d1a0d',
	'Student'
),
(
	'0569bf57-a199-477c-8721-bf7c332f2670',
	'Teacher'
),
(
	'7b6bea8f-c9f0-4208-b3d7-1483afb94e48',
	'Admin'
);

insert into users 
(
	user_id,
  	first_name,
  	last_name,
  	password,
  	email,
  	age,
  	rol_id	
)
VALUES 
(
	'e03640f9-7de3-43f2-b883-d8085a8ac70d',
	'Carlos Mario',
	'Ortega',
	'123456',
	'carlos.mario@gmail.com',
	'25',
	'9bea25fb-bc21-45a3-8aff-2b10904d1a0d'	
),
(
	'4c2094d0-61a5-4a07-abae-47351119748a',
	'Juan carlos',
	'Ante',
	'45637',
	'juancante@gmail.com',
	'35',
	'0569bf57-a199-477c-8721-bf7c332f2670'	
),
(
	'83c3d339-ba74-4ef9-b861-d8cb7d809838',
	'Andres Fernando',
	'Piamba',
	'658798',
	'anpiamba@gmail.com',
	'32',
	'7b6bea8f-c9f0-4208-b3d7-1483afb94e48'		
);


insert into courses 
(
  course_id,
  title,
  description,
  level_course,
  teacher,
  category_id
)
VALUES 
(
	'de65275f-0bce-476f-b2e1-a7716b7827f2',
	'Advanced Informatics',
	'Software Development',
	'Beginners',
	'Roberton Gomez',
	'a2c8e18b-848c-4fd9-843d-87179f6664b9'	
),
(
	'e559dc0d-8652-4322-9e53-3ee55a4c032d',
	'Data Center',
	'Cloud Storage',
	'Medium',
	'Carlos Beltran',
	'ba7deed7-ef14-47e3-9453-d02b4cd67840'	
),
(
	'9da154b9-0679-48d2-95e3-7286b5176b75',
	'React',
	'React-router-dom',
	'Advanced',
	'Carmen Hoyos',
	'052e55c9-db6f-493d-a095-bdce48e6935c'	
); 

insert into courses_video 
(
	course_video_id,
  	title,
  	url,
  	course_id  	
)
VALUES 
(
	'4e1214dc-d78c-4f7b-9ed5-3be062c50059',
	'Software Development',
	'https://www.sdev.academlo.com',
	'de65275f-0bce-476f-b2e1-a7716b7827f2'		
),
(
	'cd879f87-9fa9-440e-93fb-c8f060870800',
	'Cloud Storage',
	'https://www.scloudst.academlo.com',
	'e559dc0d-8652-4322-9e53-3ee55a4c032d'
),
(
	'f4ad4dd6-d819-413d-96fb-d8ebc0580eea',
	'React-router-dom',
	'https://www.reactrout.academlo.com',
	'9da154b9-0679-48d2-95e3-7286b5176b75'		
); 



insert into courses_seen 
(
  course_seen_id,
  advance,
  course_review,
  course_id,
  category_id,
  user_id
)
VALUES
(
	'487c45ed-9b58-4bcb-ab91-8c1aa496f0f1',
	'25%',
	'In course',
	'de65275f-0bce-476f-b2e1-a7716b7827f2',
	'a2c8e18b-848c-4fd9-843d-87179f6664b9',
	'e03640f9-7de3-43f2-b883-d8085a8ac70d'	
),
(
	'769d17cd-b2d9-491f-a003-d9bdb4d62bbf',
	'50%',
	'In course',
	'e559dc0d-8652-4322-9e53-3ee55a4c032d',
	'ba7deed7-ef14-47e3-9453-d02b4cd67840',
	'4c2094d0-61a5-4a07-abae-47351119748a'
),
(
	'83a13a5c-59dd-4f3d-8396-7fd9d4d46230',
	'70%',
	'In Course',
	'9da154b9-0679-48d2-95e3-7286b5176b75',
	'052e55c9-db6f-493d-a095-bdce48e6935c',
	'83c3d339-ba74-4ef9-b861-d8cb7d809838'	
);
