/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
CREATE TABLE roles (
     id integer uniqe,
     name varchar(255) primary key (name),
               
);

CREATE TABLE userinfo (
    id integer primary key,
    name varchar(255),
    surname varchar(255),
              
);

CREATE TABLE "user" (
      id integer unique,
      email varchar(255) primary key,
      password varchar(255) NOT NULL,
      info integer NOT NULL references userinfo(id) uniqe,
      role integer NOT NULL references roles(id),
                  
);

CREATE TABLE "order"
(
      id integer primary key,
      customer integer references "user" (id),
      created timestamp NOT NULL,
                   
);

CREATE TABLE supplier (
      id integer unique,
      name varchar(255) primary key,
      address varchar(255),
      phone varchar(255) NOT NULL,
      representative varchar(255),
                    
);

CREATE TABLE product (
      id integer unique,
      code varchar(255) primary key,
      title varchar(255) NOT NULL,
      supplier integer NOT NULL references supplier(id),
      initial_price double NOT NULL,
      retail_value double NOT NULL,
            
);

CREATE TABLE order2product (
      orders integer references "order" (id),
      product integer references product(id),
       constraint pk_order2product primary key(orders, product)              
);




INSERT INTO roles(id, name)
VALUES  (1, 'master'),
        (2, 'manager'),
        (3, 'customer');

INSERT INTO userinfo(id, name, surname)
VALUES  (1, 'Max', 'Smith'),
        (2, 'john', 'Bin'),
        (3, 'Alice', 'Brown');

INSERT INTO "user"(id, email, password, info, role)
VALUES (1, '1@mail.ru', 'qwerty1', 1, 1),
       (2, '2@mail.ru', 'qwerty2', 2, 2),
       (3, '3@mail.ru', 'qwerty3', 3, 3);

INSERT INTO "order"(id, customer, created)
VALUES  (1, 1, CURRENT TIMESTAMP),
        (2, 2, CURRENT TIMESTAMP),
        (3, 3, CURRENT TIMESTAMP);

INSERT INTO supplier(id, name, address, phone, representative)
VALUES (1, 'Pobeda', 'Russia, Voroneg, Liziukova 15', '1234567', 'Alla'),
       (2, 'Star', 'UK, Duvr, Main street 1', '1234567', 'Edvard'),
       (3, 'NLP group', 'Russia, SPb, Nevsky 43', '1234567', 'Mark');

INSERT INTO product(id, code, title, supplier, initial_price, retail_value)
VALUES (1, '56', 'apple', 1, 5, 15),
       (2, '43', 'barry', 2, 8, 14),
       (3, '67', 'lemon', 3, 2, 6);

INSERT INTO order2product("order", product)
VALUES (1, 1),
       (2, 2),
       (3, 3);

SELECT *
FROM "order";

SELECT *
FROM "user";

SELECT *
FROM roles;

SELECT *
FROM userinfo;

SELECT *
FROM order2product;

SELECT *
FROM product;

SELECT *
FROM supplier;


