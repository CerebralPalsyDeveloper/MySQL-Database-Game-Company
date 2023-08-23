DROP DATABASE IF EXISTS TermProject;
CREATE DATABASE TermProject;

USE TermProject;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS developers;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS in_game_data;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS payments;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  user_email VARCHAR(255) NOT NULL,
  user_password VARCHAR(255) NOT NULL
);

CREATE TABLE developers (
    developer_id INT AUTO_INCREMENT PRIMARY KEY,
    developer_name VARCHAR(50) NOT NULL,
    developer_title VARCHAR(50) NOT NULL,
    developer_salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    developer_id INT NOT NULL,
    game_name VARCHAR(50) NOT NULL,
    game_description TEXT NOT NULL,
    game_release_date DATE NOT NULL,
    genre_name VARCHAR(50) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    budget_millions DECIMAL(10,2) NOT NULL,
    development_years DECIMAL(2,1) NOT NULL,
    game_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (developer_id) REFERENCES developers(developer_id),
    INDEX idx_game_id (game_id)
);
CREATE TABLE in_game_data (
    in_game_data_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    progress INT NOT NULL,
    achievements TEXT NOT NULL,
    CONSTRAINT fk_in_game_data_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_in_game_data_games FOREIGN KEY (game_id) REFERENCES games(game_id)
);
CREATE TABLE feedback (
  feedback_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  game_id INT NOT NULL,
  rating DECIMAL(2,1) NOT NULL,
  review TEXT NOT NULL,
  CONSTRAINT fk_feedback_users FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT fk_feedback_games FOREIGN KEY (game_id) REFERENCES games(game_id)
);
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL,
    CONSTRAINT fk_payments_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_payments_games FOREIGN KEY (game_id) REFERENCES games(game_id)
);

INSERT INTO users (user_id, username, user_email, user_password) VALUES
(1, 'JohnDoe', 'johndoe@gmail.com', 'password1'),
(2, 'JaneSmith', 'janesmith@yahoo.com', 'password2'),
(3, 'BobJohnson', 'bjohnson@hotmail.com', 'password3'),
(4, 'SamanthaBrown', 'sbrown@gmail.com', 'password4'),
(5, 'AlexNguyen', 'alex.nguyen@gmail.com', 'password5'),
(6, 'EmilyWang', 'ewang@yahoo.com', 'password6'),
(7, 'TomLee', 'tlee@hotmail.com', 'password7'),
(8, 'KarenKim', 'kkim@gmail.com', 'password8'),
(9, 'MikeChen', 'mchen@yahoo.com', 'password9'),
(10, 'LisaPark', 'lpark@hotmail.com', 'password10');

INSERT INTO developers (developer_id, developer_name, developer_title, developer_salary)
VALUES
(1, 'John Smith', 'Game Designer', 65000.00),
(2, 'Jane Doe', 'Game Artist', 55000.00),
(3, 'Mark Johnson', 'Lead Programmer', 90000.00),
(4, 'Sarah Thompson', 'Sound Designer', 60000.00),
(5, 'Tom Brown', 'Gameplay Programmer', 75000.00),
(6, 'Emily Davis', 'Character Artist', 60000.00),
(7, 'David Lee', 'AI Programmer', 85000.00),
(8, 'Rachel Kim', 'Game Writer', 60000.00),
(9, 'Michael Garcia', 'UI/UX Designer', 70000.00),
(10, 'Olivia Baker', 'Narrative Designer', 65000.00);

INSERT INTO games (game_id, developer_id, game_name, game_description, game_release_date, genre_name, platform, budget_millions, development_years, game_price)
VALUES
    (1, 1, 'Super Mario Bros', 'A classic platformer game', '1985-09-13', 'Platformer', 'Nintendo Entertainment System', 10.00, 2, 19.99),
    (2, 1, 'The Legend of Zelda', 'A classic action-adventure game', '1986-02-21', 'Action-adventure', 'Nintendo Entertainment System', 8.00, 2, 29.99),
    (3, 2, 'Sonic the Hedgehog', 'A classic platformer game featuring Sonic', '1991-06-23', 'Platformer', 'Sega Genesis', 5.00, 1.5, 14.99),
    (4, 3, 'Mortal Kombat', 'A classic fighting game', '1992-10-08', 'Fighting', 'Arcade', 2.00, 1, 9.99),
    (5, 4, 'Super Mario 64', 'A classic 3D platformer game', '1996-06-23', '3D platformer', 'Nintendo 64', 12.00, 3, 39.99),
    (6, 4, 'The Legend of Zelda: Ocarina of Time', 'A classic action-adventure game', '1998-11-23', 'Action-adventure', 'Nintendo 64', 15.00, 3, 49.99),
    (7, 5, 'Grand Theft Auto III', 'A classic open-world game', '2001-10-22', 'Open-world', 'PlayStation 2', 20.00, 2.5, 29.99),
    (8, 6, 'Half-Life 2', 'A classic first-person shooter game', '2004-11-16', 'First-person shooter', 'PC', 25.00, 5, 19.99),
    (9, 7, 'The Elder Scrolls V: Skyrim', 'A classic open-world role-playing game', '2011-11-11', 'Open-world RPG', 'PC', 30.00, 4, 59.99),
    (10, 8, 'Red Dead Redemption 2', 'A classic open-world western action-adventure game', '2018-10-26', 'Open-world western action-adventure', 'PlayStation 4', 80.00, 7, 79.99);


INSERT INTO in_game_data (user_id, game_id, progress, achievements) VALUES
(1, 1, 50, 'Defeated the final boss'),
(2, 3, 20, 'Unlocked new character'),
(3, 2, 80, 'Collected all hidden items'),
(4, 1, 100, 'Completed all levels'),
(5, 4, 40, 'Reached new high score'),
(6, 2, 60, 'Reached level 10'),
(7, 5, 10, 'Got a new sword'),
(8, 6, 5, 'Defeated 1000 enemies'),
(9, 7, 15, 'Reached the top of the leaderboard'),
(10, 3, 30, 'Completed tutorial');

INSERT INTO feedback (feedback_id, game_id, user_id, rating, review) 
VALUES 
(1, 1, 1, 4.5, 'Epic space adventure, highly recommended.'),
(2, 1, 2, 3.2, 'Not my favorite, but enjoyable.'),
(3, 2, 3, 4.7, 'Strategy masterpiece, worth every penny.'),
(4, 2, 4, 2.8, 'Disappointing, expected more.'),
(5, 3, 5, 4.9, 'Terrifying, not for the faint-hearted.'),
(6, 3, 6, 4.6, 'Best horror game I played.'),
(7, 4, 7, 3.9, 'Good, but not amazing.'),
(8, 4, 8, 4.3, 'Great strategy game for Xbox.'),
(9, 5, 9, 4.8, 'High-octane racing, love it!'),
(10, 5, 10, 3.5, 'Meh, average racing game.');

INSERT INTO purchases (purchase_id, user_id, game_id, payment_method, payment_date)
VALUES
    (1, 1, 1, 'credit card', '2022-03-15'),
    (2, 2, 3, 'credit card', '2022-03-16'),
    (3, 3, 2, 'paypal', '2022-03-17'),
    (4, 4, 1, 'credit card', '2022-03-18'),
    (5, 2, 5, 'paypal', '2022-03-19'),
    (6, 5, 4, 'credit card', '2022-03-20'),
    (7, 6, 6, 'credit card', '2022-03-21'),
    (8, 7, 3, 'paypal', '2022-03-22'),
    (9, 8, 7, 'credit card', '2022-03-23'),
    (10, 9, 2, 'credit card', '2022-03-24');

-- QUERIES
-- 1 Find average rating of a game
SELECT games.game_name, AVG(feedback.rating) AS average_rating
FROM feedback 
JOIN games ON games.game_id = feedback.game_id
GROUP BY feedback.game_id, games.game_name
ORDER BY average_rating DESC;

-- 2 Finding which developers have worked on multiple games
SELECT d.developer_id, d.developer_name
FROM developers d
INNER JOIN games g ON d.developer_id = g.developer_id
GROUP BY d.developer_id
HAVING COUNT(*) > 1;

-- 3 Which user IDs bought games with a credit card
SELECT user_id, game_name
FROM purchases
INNER JOIN (
  SELECT purchase_id
  FROM purchases
  WHERE payment_method = 'credit card'
) AS credit_payments
ON purchases.purchase_id = credit_payments.purchase_id
INNER JOIN games
ON purchases.game_id = games.game_id;

-- 4 Transaction to change the game price with ID = 1
START TRANSACTION;
UPDATE games SET game_price = 4.99 WHERE game_id = 1;
COMMIT;
SELECT * FROM games
WHERE game_id = 1;

-- 5 Window function to find the running total of game prices by developer
SELECT game_id, developer_id, game_price, game_release_date, SUM(game_price) 
OVER (PARTITION BY developer_id 
ORDER BY game_release_date) AS running_total
FROM games;

-- 6 Query to find the cost of labor per project
SELECT g.game_name, SUM(d.developer_salary * g.development_years) AS total_pay
FROM games g
INNER JOIN developers d ON g.developer_id = d.developer_id
GROUP BY g.game_name;


