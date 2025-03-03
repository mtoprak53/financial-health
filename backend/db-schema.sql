CREATE TABLE IF NOT EXISTS "users" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
	"username" text NOT NULL UNIQUE,
	"password" text NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "purchases" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"is_cash" boolean DEFAULT NULL,
	"wallet_id" bigint DEFAULT NULL,
	"credit_type_id" bigint DEFAULT NULL,
	"promo_type_id" bigint DEFAULT NULL,
	"promo_months" bigint DEFAULT NULL,
	"payment_time" timestamp without time zone NOT NULL,
	"user_id" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "wallets" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"name" text NOT NULL UNIQUE,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "financial_institutes" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"name" text NOT NULL UNIQUE,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "credit_types" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"financial_institute_id" bigint NOT NULL,
	"name" text NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "promo_types" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"name" text NOT NULL UNIQUE,
	PRIMARY KEY ("id")
);


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("wallet_id") REFERENCES "wallets"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk3" FOREIGN KEY ("credit_type_id") REFERENCES "credit_types"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk4" FOREIGN KEY ("promo_type_id") REFERENCES "promo_types"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk7" FOREIGN KEY ("user_id") REFERENCES "users"("id");


ALTER TABLE "credit_types" ADD CONSTRAINT "credit_types_fk1" FOREIGN KEY ("financial_institute_id") REFERENCES "financial_institutes"("id");
