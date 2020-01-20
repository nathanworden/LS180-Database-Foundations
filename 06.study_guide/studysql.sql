CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
  );

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
  );


INSERT INTO customers (name, payment_token)
VALUES ('Pat Johnson',    'XHGOAHEQ'),
       ('Nancy Monreal',  'JKWQPJKL'),
       ('Lynn Blake',     'KLZXWEEE'),
       ('Chen Ke-Hua',    'KWETYCVX'),
       ('Scott Lakso',    'UUEAPQPS'),
       ('Jim Pornot',     'XKJEYAZA');

INSERT INTO services (description, price)
VALUES ('Unix Hosting',         '5.95'),
       ('DNS',                  '4.95'),
       ('Whois Registration',   '1.95'),
       ('High Bandwidth',       '15.00'),
       ('Business Support',     '250.00'),
       ('Dedicated Hosting',    '50.00'),
       ('Bulk Email',           '250.00'),
       ('One-to-one Training',  '999.00');

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  service_id integer NOT NULL REFERENCES services (id),
  customer_id integer NOT NULL REFERENCES customers (id) ON DELETE CASCADE,
  UNIQUE(service_id, customer_id)
  );

INSERT INTO customers_services (customer_id, service_id)
VALUES (1,1), 
       (1,2),
       (1,3),
       (3,1),
       (3,2),
       (3,3),
       (3,4),
       (3,5),
       (4,1),
       (4,4),
       (5,1),
       (5,2),
       (5,6),
       (6,1),
       (6,6),
       (6,7);





SELECT customers.name FROM customers LEFT OUTER JOIN customers_services ON customers_services.customer_id = customers.id WHERE customers_services.service_id IS NULL;



SELECT services.description FROM customers_services RIGHT OUTER JOIN services ON service_id = services.id WHERE service_id IS NULL;


















