CREATE DATABASE skypro;

CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Мария', 'Жукова', 'жен.', 35),
       ('Татьяна', 'Маслова', 'жен.', 51),
       ('Валерий', 'Скрипкин', 'муж.', 27),
       ('Борис', 'Карпов', 'муж.', 41),
       ('Ольга', 'Шаталова', 'жен.', 24);
-- Получите информацию об именах и фамилиях по всем сотрудникам. Колонки должны называться «Имя» и «Фамилия».
SELECT first_name AS Имя, last_name AS Фамилия
FROM employee;
-- Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.
SELECT first_name, last_name, gender, age
FROM employee
WHERE NOT age BETWEEN 30 AND 50;
-- Получите всю информацию о сотрудниках, которым от 30 до 50 лет.
SELECT first_name, last_name, gender, age
FROM employee
WHERE age BETWEEN 30 AND 50;
-- Выведите полный список сотрудников, которые отсортированы по фамилиям в обратном порядке.
SELECT first_name, last_name
FROM employee
ORDER BY last_name DESC;
--Выведите сотрудников, имена которых длиннее 5 символов.
SELECT first_name, last_name
FROM employee
WHERE first_name LIKE '%______';
-- Измените имена у двух сотрудников так, чтобы на 5 сотрудников было только 3 разных имени.
UPDATE employee
SET first_name ='Татьяна'
WHERE id = 1;
UPDATE employee
SET first_name ='Борис'
WHERE id = 3;
-- Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах «имя» и «суммарный возраст».
SELECT first_name AS Имя, SUM(age) AS Суммарный_возраст
FROM employee
GROUP BY first_name;
-- Выведите имя и самый юный возраст, соответствующий имени.
SELECT first_name AS Имя, MIN(age) AS Возраст
FROM employee
GROUP BY first_name;
-- Вывод имени самого молодого сотрудника. (Сделал для себя...)
SELECT first_name, age
FROM employee
WHERE age = (SELECT MIN(age) FROM employee);
-- Выведите имя и максимальный возраст только для неуникальных имен. Результат отсортируйте по возрасту в порядке возрастания.
SELECT first_name AS Имя, MAX(age) AS Возраст
FROM employee
GROUP BY first_name
HAVING count(first_name) > 1;