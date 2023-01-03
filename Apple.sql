CREATE TABLE "Products" (
	"ProductCode"	varchar(255)		NOT NULL,
	"product"	varchar(255)		NULL,
	"productname"	varchar(255)		NULL,
	"color"	varchar(255)		NULL,
	"size"	varchar(255)		NULL,
	"storage"	varchar(255)		NULL,
	"connectivity"	varchar(255)		NULL,
	"price"	number(20)	DEFAULT 0	NULL
);

CREATE TABLE "User" (
	"ID"	varchar(255)		NOT NULL,
	"Last name"	varchar(255)		NULL,
	"First name"	varchar(255)		NULL,
	"Country"	varchar(255)		NULL,
	"PW"	varchar(255)		NULL,
	"Phone"	varchar(40)		NULL,
	"Subscribe"	char(1)		NULL,
	"Join Date"	date		NULL
);

COMMENT ON COLUMN "User"."Subscribe" IS 'Y: 수신 / N: 거부';

CREATE TABLE "order" (
	"ordernum"	varchar(255)		NOT NULL,
	"ID"	varchar(255)		NOT NULL,
	"totalprice"	number(20)		NULL,
	"receiver"	varchar(255)		NULL,
	"raddress"	varchar(255)		NULL,
	"rmessage"	varchar(255)		NULL,
	"result"	char(1)		NULL
);

COMMENT ON COLUMN "order"."result" IS 'Y: 배송완료/ C: 취소';

CREATE TABLE "orderDetail" (
	"ordernum"	varchar(255)		NOT NULL,
	"ProductCode"	varchar(255)		NOT NULL,
	"orderquantitiy"	number(20)		NULL,
	"price"	number(20)		NULL,
	"ProductCode2"	varchar(255)		NOT NULL,
	"ProductCode3"	varchar(255)		NOT NULL
);

CREATE TABLE "Cart" (
	"ProductCode"	varchar(255)		NOT NULL,
	"ProductCode2"	varchar(255)		NOT NULL,
	"ProductCode3"	varchar(255)		NOT NULL,
	"orderquantitiy"	number(20)		NULL,
	"ID"	varchar(255)		NOT NULL,
	"Phone"	varchar(40)		NULL
);

CREATE TABLE "CopyOfProducts" (
	"ProductCode"	varchar(255)		NOT NULL,
	"product"	varchar(255)		NULL,
	"productname"	varchar(255)		NULL,
	"color"	varchar(255)		NULL,
	"size"	varchar(255)		NULL,
	"storage"	varchar(255)		NULL,
	"connectivity"	varchar(255)		NULL,
	"price"	number(20)	DEFAULT 0	NULL
);

CREATE TABLE "CopyOfProducts2" (
	"ProductCode"	varchar(255)		NOT NULL,
	"product"	varchar(255)		NULL,
	"productname"	varchar(255)		NULL,
	"color"	varchar(255)		NULL,
	"size"	varchar(255)		NULL,
	"storage"	varchar(255)		NULL,
	"connectivity"	varchar(255)		NULL,
	"price"	number(20)	DEFAULT 0	NULL
);

ALTER TABLE "Products" ADD CONSTRAINT "PK_PRODUCTS" PRIMARY KEY (
	"ProductCode"
);

ALTER TABLE "User" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"ID"
);

ALTER TABLE "order" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"ordernum"
);

ALTER TABLE "orderDetail" ADD CONSTRAINT "PK_ORDERDETAIL" PRIMARY KEY (
	"ordernum"
);

ALTER TABLE "Cart" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"ProductCode",
	"ProductCode2",
	"ProductCode3"
);

ALTER TABLE "CopyOfProducts" ADD CONSTRAINT "PK_COPYOFPRODUCTS" PRIMARY KEY (
	"ProductCode"
);

ALTER TABLE "CopyOfProducts2" ADD CONSTRAINT "PK_COPYOFPRODUCTS2" PRIMARY KEY (
	"ProductCode"
);

ALTER TABLE "orderDetail" ADD CONSTRAINT "FK_order_TO_orderDetail_1" FOREIGN KEY (
	"ordernum"
)
REFERENCES "order" (
	"ordernum"
);

ALTER TABLE "Cart" ADD CONSTRAINT "FK_Products_TO_Cart_1" FOREIGN KEY (
	"ProductCode"
)
REFERENCES "Products" (
	"ProductCode"
);

ALTER TABLE "Cart" ADD CONSTRAINT "FK_CopyOfProducts_TO_Cart_1" FOREIGN KEY (
	"ProductCode2"
)
REFERENCES "CopyOfProducts" (
	"ProductCode"
);

ALTER TABLE "Cart" ADD CONSTRAINT "FK_CopyOfProducts2_TO_Cart_1" FOREIGN KEY (
	"ProductCode3"
)
REFERENCES "CopyOfProducts2" (
	"ProductCode"
);

