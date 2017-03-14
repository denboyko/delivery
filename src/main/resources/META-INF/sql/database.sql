-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Table: order
CREATE TABLE orders (
  id      INT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT      NOT NULL,
  data    DATETIME NOT NULL,
  total   INT      NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
)
  ENGINE = InnoDB;

-- Table: product
CREATE TABLE products (
  id          INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(255)  NOT NULL,
  price       INT           NOT NULL,
  description VARCHAR(1000) NOT NULL,
  photo       VARCHAR(255)  NOT NULL

)
  ENGINE = InnoDB;

-- Table for mapping order and product: order_product
CREATE TABLE order_product (
  order_id INT NOT NULL,
  product_id INT NOT NULL,

  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (product_id) REFERENCES products (id),

  UNIQUE (order_id, product_id)
)
  ENGINE = InnoDB;


-- Insert data

INSERT INTO users VALUES (1, 'proselyte', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);