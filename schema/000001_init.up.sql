CREATE TABLE IF NOT EXISTS users
(
  id serial primary key not null,
  name varchar(255) not null,
  username varchar(255) not null unique,
  password_hash varchar(255) not null
);

CREATE TABLE IF NOT EXISTS todo_lists
(
  id serial not null unique,
  title varchar(255),
  description varchar(255)
);

CREATE TABLE IF NOT EXISTS todo_items 
(
  id serial primary key not null,
  title varchar(255) not null,
  description varchar(255),
  done boolean not null default false
);

CREATE TABLE IF NOT EXISTS users_lists
(
  id serial primary key not null,
  user_id int not null,
  list_id int not null,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (list_id) REFERENCES todo_lists (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS lists_items
(
  id serial primary key not null,
  item_id int not null,
  list_id int not null,
  FOREIGN KEY (item_id) REFERENCES todo_items (id) ON DELETE CASCADE,
  FOREIGN KEY (list_id) REFERENCES todo_lists (id) ON DELETE CASCADE
)