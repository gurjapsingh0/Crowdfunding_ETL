-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Category" (
    "category_id" SERIAL PRIMARY KEY,
    "category" varchar(50) NOT NULL,
    CONSTRAINT "uq_Category_category" UNIQUE ("category")
);

CREATE TABLE "Subcategory" (
    "subcategory_id" SERIAL PRIMARY KEY,
    "subcategory" varchar(50) NOT NULL,
    CONSTRAINT "uq_Subcategory_subcategory" UNIQUE ("subcategory")
);

CREATE TABLE "Contacts" (
    "contact_id" SERIAL PRIMARY KEY,
    "first_name" varchar(50) NOT NULL,
    "last_name" varchar(50) NOT NULL,
    "email" varchar(50) NOT NULL,
    CONSTRAINT "uq_Contacts_email" UNIQUE ("email")
);

CREATE TABLE "Campaign" (
    "cf_id" SERIAL PRIMARY KEY,
    "contact_id" int NOT NULL,
    "company_name" varchar(50) NOT NULL,
    "description" varchar(255) NOT NULL,
    "goal" float NOT NULL,
    "pledged" float NOT NULL,
    "outcome" varchar(50) NOT NULL,
    "backers_count" int NOT NULL,
    "country" varchar(50) NOT NULL,
    "currency" varchar(50) NOT NULL,
    "launched_date" int NOT NULL,
    "end_date" int NOT NULL,
    "category_id" int NOT NULL,
    "subcategory_id" int NOT NULL,
    CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY ("category_id") REFERENCES "Category" ("category_id"),
    CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY ("subcategory_id") REFERENCES "Subcategory" ("subcategory_id"),
    CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY ("contact_id") REFERENCES "Contacts" ("contact_id")
);

