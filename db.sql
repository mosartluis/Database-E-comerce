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
