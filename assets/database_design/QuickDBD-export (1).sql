-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "User" (
    "ID" int   NOT NULL,
    "username" varchar(20)   NOT NULL,
    "name" varchar(30)   NOT NULL,
    "surname" varchar(40)   NOT NULL,
    "password" varchar(60)   NOT NULL,
    "email" varchar(30)   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_User_username" UNIQUE (
        "username"
    )
);

CREATE TABLE "Follower" (
    "User_From_ID" int   NOT NULL,
    "User_to_ID" int   NOT NULL
);

CREATE TABLE "Post" (
    "ID" int   NOT NULL,
    "user_ID" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Media" (
    "ID" int   NOT NULL,
    "type" enum   NOT NULL,
    "url" varchar(100)   NOT NULL,
    "post_id" int   NOT NULL,
    CONSTRAINT "pk_Media" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Comment" (
    "ID" int   NOT NULL,
    "comment_text" varchar(1000)   NOT NULL,
    "author_ID" int   NOT NULL,
    "post_ID" int   NOT NULL,
    CONSTRAINT "pk_Comment" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Follower" ADD CONSTRAINT "fk_Follower_User_From_ID" FOREIGN KEY("User_From_ID")
REFERENCES "User" ("ID");

ALTER TABLE "Follower" ADD CONSTRAINT "fk_Follower_User_to_ID" FOREIGN KEY("User_to_ID")
REFERENCES "User" ("ID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_ID" FOREIGN KEY("user_ID")
REFERENCES "User" ("ID");

ALTER TABLE "Media" ADD CONSTRAINT "fk_Media_post_id" FOREIGN KEY("post_id")
REFERENCES "Post" ("ID");

ALTER TABLE "Comment" ADD CONSTRAINT "fk_Comment_author_ID" FOREIGN KEY("author_ID")
REFERENCES "User" ("ID");

ALTER TABLE "Comment" ADD CONSTRAINT "fk_Comment_post_ID" FOREIGN KEY("post_ID")
REFERENCES "Post" ("ID");

