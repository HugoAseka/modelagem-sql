CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"email" serial NOT NULL,
	"password" serial NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"price" serial NOT NULL,
	"mainImage" serial NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productsImages" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"url" TEXT NOT NULL,
	CONSTRAINT "productsImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"size" serial(1) NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"type" TEXT NOT NULL,
	"cartProductId" TEXT NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cartProducts" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"sizeId" int NOT NULL,
	"categoriesId" int NOT NULL,
	CONSTRAINT "cartProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "productsImages" ADD CONSTRAINT "productsImages_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");



ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("cartProductId") REFERENCES "cartProducts"("id");

ALTER TABLE "cartProducts" ADD CONSTRAINT "cartProducts_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "cartProducts" ADD CONSTRAINT "cartProducts_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "cartProducts" ADD CONSTRAINT "cartProducts_fk2" FOREIGN KEY ("categoriesId") REFERENCES "categories"("id");








