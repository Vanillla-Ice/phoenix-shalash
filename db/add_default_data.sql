-- Заполнение статических таблиц
INSERT INTO
    mark_categories (mark_category, description)
VALUES
    (
        'Социальные навыки',
        'Навыки, описывающие способность ребенка к корректному социальному взаимодействию'
    ),
    (
        'Трудное поведение',
        'Параметры, отражающие девиации в поведении ребенка'
    );

INSERT INTO
    mark_types (description, min_value, max_value, mark_category)
VALUES
    (
        'Конструктивно воспринимает неуспех',
        0,
        3,
        'Социальные навыки'
    ),
    (
        'Понимает свои границы',
        0,
        3,
        'Социальные навыки'
    ),
    (
        'Понимает чужие границы',
        0,
        3,
        'Социальные навыки'
    ),
    (
        'Соблюдает правила группы',
        0,
        3,
        'Социальные навыки'
    ),
    (
        'Участвует в деятельности',
        0,
        3,
        'Социальные навыки'
    ),
    (
        'Бьет или царапает себя',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Бьет, толкает участников группы',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Громко кричит во время занятия',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Игнорирует напоминания о правилах',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Кидает или ломает вещи',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Уходит во время задания',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Оскорбляет участников группы',
        0,
        3,
        'Трудное поведение'
    ),
    (
        'Отказывается присоединиться к деятельности',
        0,
        3,
        'Трудное поведение'
    );

INSERT INTO
    roles (role_name, eng_role_name, level_code)
VALUES
    ('Куратор', 'Curator', 'C'),
    ('Ведущий', 'Tutor', 'T'),
    ('Методист', 'Methodist', 'M'),
    ('Администратор', 'Admin', 'A');

INSERT INTO
    track_type (start_age, end_age, max_lessons_number)
VALUES
    (7, 11, 1),
    (11, 15, 2);

INSERT INTO
    course (course_name)
VALUES
    ('Математика'),
    ('Информатика'),
    ('Грамматика'),
    ('Сеанс психотерапии');

INSERT INTO
    semester (start_date, end_date)
VALUES
    ('2023-06-30', '2023-12-31'),
    ('2024-01-01', '2024-03-30'),
    ('2024-03-31', '2024-08-01'),
    ('2024-08-02', '2024-12-30');

-- Заполнение динамических таблиц
INSERT INTO
    group_table (group_name, track_type)
VALUES
    (
        'Дети',
        (
            SELECT
                track_type_id
            FROM
                track_type
            WHERE
                start_age = 7
        )
    ),
    (
        'Подростки',
        (
            SELECT
                track_type_id
            FROM
                track_type
            WHERE
                start_age = 11
        )
    ),
    (
        'Младшие школьники',
        (
            SELECT
                track_type_id
            FROM
                track_type
            WHERE
                start_age = 7
        )
    ),
    (
        'Старшие школьники',
        (
            SELECT
                track_type_id
            FROM
                track_type
            WHERE
                start_age = 11
        )
    );

INSERT INTO
    child (
        name,
        surname,
        birthday,
        current_group_id,
        add_to_group_date,
        gender
    )
VALUES
    (
        'Вася',
        'Петров',
        '2015-02-01',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Дети'
        ),
        CURRENT_DATE,
        'М'
    ),
    (
        'Оля',
        'Петрова',
        '2014-09-05',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Дети'
        ),
        CURRENT_DATE,
        'Ж'
    ),
    (
        'Вика',
        'Сидорова',
        '2015-01-03',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Дети'
        ),
        CURRENT_DATE,
        'Ж'
    ),
    (
        'Альберт',
        'Энштейн',
        '2010-02-11',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Подростки'
        ),
        CURRENT_DATE,
        'М'
    ),
    (
        'Федя',
        'Смирнов',
        '2011-02-01',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Подростки'
        ),
        CURRENT_DATE,
        'М'
    ),
    (
        'Лена',
        'Морозова',
        '2012-12-21',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Подростки'
        ),
        CURRENT_DATE,
        'Ж'
    ),
    (
        'Максим',
        'Кузнецов',
        '2015-05-15',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Младшие школьники'
        ),
        CURRENT_DATE,
        'М'
    ),
    (
        'Света',
        'Иванова',
        '2013-11-22',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Старшие школьники'
        ),
        CURRENT_DATE,
        'Ж'
    ),
    (
        'Даша',
        'Ковалёва',
        '2011-06-18',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Старшие школьники'
        ),
        CURRENT_DATE,
        'Ж'
    ),
    (
        'Кирилл',
        'Новиков',
        '2010-03-02',
        (
            SELECT
                group_id
            FROM
                group_table
            WHERE
                group_name = 'Подростки'
        ),
        CURRENT_DATE,
        'М'
    );

INSERT INTO
    parent (name, surname, role)
VALUES
    ('Ольга', 'Петрова', 'Мама'),
    ('Михаил', 'Петров', 'Папа'),
    ('Демьян', 'Сидоров', 'Брат'),
    ('Герман', 'Энштейн', 'Дед'),
    ('Валерия', 'Смирнова', 'Бабушка'),
    ('Павел', 'Морозов', 'Лучший друг'),
    ('Наталья', 'Кузнецова', 'Мама'),
    ('Алексей', 'Кузнецов', 'Папа'),
    ('Екатерина', 'Иванова', 'Мама'),
    ('Александр', 'Ковалёв', 'Папа'),
    ('Ирина', 'Новикова', 'Мама');

INSERT INTO
    parent_by_child (child_id, parent_id)
SELECT
    c.child_id,
    p.parent_id
FROM
    child c
    JOIN parent p ON c.name = p.name;

INSERT INTO
    parent_phones (parent_id, phone_number)
VALUES
    (1, '+79845862115'),
    (1, '+75681459578'),
    (2, '+71245891536'),
    (3, '+78432578953'),
    (4, '+78542698289'),
    (4, '+77922277881'),
    (5, '+78963212998'),
    (6, '+79887433012'),
    (6, '+78300945627'),
    (7, '+79812345678'),
    (7, '+79822345678'),
    (8, '+79832345678'),
    (9, '+79842345678'),
    (10, '+79852345678'),
    (11, '+79862345678');

INSERT INTO
    worker (name, surname, patronymic, hire_date)
VALUES
    (
        'Ольга',
        'Сидорова',
        'Константиновна',
        '2024-08-01+03'
    ),
    (
        'Нина',
        'Разумихина',
        'Андреевна',
        '2024-08-01+03'
    ),
    (
        'Родион',
        'Раскольников',
        'Романович',
        '2024-08-01+03'
    ),
    ('Борис', 'Федоров', '', '2024-08-01+03'),
    ('Иван', 'Иванов', 'Иванович', '2024-08-01+03'),
    (
        'Алексей',
        'Петров',
        'Алексеевич',
        '2024-08-01+03'
    );

INSERT INTO
    worker_by_role (level_code, worker_id, tensure_start_date)
VALUES
    ('T', 1, '2024-08-01+03'),
    ('M', 1, '2024-08-01+03'),
    ('T', 2, '2024-08-01+03'),
    ('T', 4, '2024-08-01+03'),
    ('M', 2, '2024-08-01+03'),
    ('C', 3, '2024-08-01+03'),
    ('A', 5, '2024-08-01+03'),
    ('T', 6, '2024-08-01+03');

INSERT INTO
    group_creators (group_id, curator_id)
SELECT
    group_id,
    3
FROM
    group_table;

INSERT INTO
    course_by_mark_types (course_id, mark_type)
SELECT
    c.course_id,
    m.mark_type_id
FROM
    course c
    JOIN mark_types m ON m.mark_category = 'Социальные навыки';

INSERT INTO
    course_authors (course_id, author_id)
SELECT
    c.course_id,
    w.worker_id
FROM
    course c
    JOIN worker_by_role w ON w.level_code = 'M';

INSERT INTO
    group_class (group_id, teacher_id, course_id, creation_date)
SELECT
    g.group_id,
    w.worker_id,
    c.course_id,
    '2024-08-01+03'
FROM
    group_table g
    JOIN worker_by_role w ON w.level_code = 'T'
    JOIN course c ON c.course_name = 'Математика';

INSERT INTO
    course_comments (course_id, author_id, description)
SELECT
    c.course_id,
    3,
    'Все отлично, вы молодцы'
FROM
    course c;

INSERT INTO
    class_info (class_id, author_id, description)
SELECT
    gc.class_id,
    w.worker_id,
    'Все отлично, вы молодцы'
FROM
    group_class gc
    JOIN worker_by_role w ON w.level_code = 'T';

INSERT INTO
    child_info (child_id, author_id, description)
SELECT
    c.child_id,
    w.worker_id,
    'Прекрасный ребенок'
FROM
    child c
    JOIN worker w ON w.worker_id = 1;

INSERT INTO
    login_data
VALUES
    ('admin', 1);

INSERT INTO
    lesson (class_id, lesson_date, duration, semester_id)
VALUES
    (1, '2024-08-10 09:00:00+03', 40, 4),
    (1, '2024-08-10 10:00:00+03', 40, 4),
    (1, '2024-08-11 11:00:00+03', 40, 4),
    (1, '2024-08-11 12:00:00+03', 40, 4),
    (1, '2024-08-12 13:00:00+03', 40, 4),
    (1, '2024-08-12 14:00:00+03', 40, 4),
    (2, '2024-08-13 15:00:00+03', 40, 4),
    (2, '2024-08-13 16:00:00+03', 40, 4),
    (3, '2024-08-14 17:00:00+03', 40, 4),
    (3, '2024-08-14 18:00:00+03', 40, 4),
    (4, '2024-08-15 09:00:00+03', 40, 4),
    (4, '2024-08-15 10:00:00+03', 40, 4),
    (4, '2024-08-16 11:00:00+03', 40, 4),
    (4, '2024-08-16 12:00:00+03', 40, 4),
    (1, '2024-08-13 09:00:00+03', 40, 4),
    (1, '2024-08-13 10:00:00+03', 40, 4);

INSERT INTO
    class_history (child_id, class_id, add_date, leave_date)
VALUES
    (1, 1, '2024-08-10+03', '2024-08-12+03'),
    (2, 1, '2024-08-11+03', '2024-08-13+03'),
    (3, 1, '2024-08-12+03', '2024-08-14+03'),
    (4, 1, '2024-08-13+03', '2024-08-15+03'),
    (5, 1, '2024-08-14+03', '2024-08-15+03'),
    (6, 1, '2024-08-15+03', '2024-08-16+03'),
    (7, 2, '2024-08-12+03', '2024-08-14+03'),
    (8, 2, '2024-08-13+03', '2024-08-15+03'),
    (9, 2, '2024-08-14+03', '2024-08-16+03'),
    (10, 3, '2024-08-15+03', '2024-08-17+03');

INSERT INTO
    reports (
        child_id,
        class_id,
        semester_id,
        filename,
        add_time
    )
VALUES
    (1, 1, 4, 'report1.pdf', '10:00:00+03'),
    (2, 1, 4, 'report2.pdf', '11:00:00+03'),
    (3, 1, 4, 'report3.pdf', '12:00:00+03'),
    (4, 1, 4, 'report4.pdf', '13:00:00+03'),
    (5, 1, 4, 'report5.pdf', '14:00:00+03'),
    (6, 1, 4, 'report6.pdf', '15:00:00+03'),
    (7, 2, 4, 'report7.pdf', '16:00:00+03'),
    (8, 2, 4, 'report8.pdf', '17:00:00+03'),
    (9, 3, 4, 'report9.pdf', '18:00:00+03'),
    (10, 3, 4, 'report10.pdf', '19:00:00+03');

INSERT INTO
    visits (
        child_id,
        class_id,
        lesson_date,
        description,
        visited
    )
VALUES
    (
        1,
        1,
        '2024-08-10 09:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        2,
        1,
        '2024-08-10 10:00:00+03',
        'Опоздание на занятие',
        true
    ),
    (
        3,
        1,
        '2024-08-11 11:00:00+03',
        'Отсутствие по болезни',
        false
    ),
    (
        4,
        1,
        '2024-08-11 12:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        5,
        1,
        '2024-08-12 13:00:00+03',
        'Пропуск без уважительной причины',
        false
    ),
    (
        6,
        1,
        '2024-08-12 14:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        7,
        2,
        '2024-08-13 15:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        8,
        2,
        '2024-08-13 16:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        9,
        3,
        '2024-08-14 17:00:00+03',
        'Пропуск без уважительной причины',
        false
    ),
    (
        10,
        3,
        '2024-08-14 18:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        1,
        1,
        '2024-08-13 09:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        2,
        1,
        '2024-08-13 10:00:00+03',
        'Опоздание на занятие',
        true
    ),
    (
        3,
        1,
        '2024-08-14 11:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        4,
        1,
        '2024-08-14 12:00:00+03',
        'Отсутствие по болезни',
        false
    ),
    (
        5,
        1,
        '2024-08-14 13:00:00+03',
        'Пропуск без уважительной причины',
        false
    ),
    (
        6,
        1,
        '2024-08-14 14:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        7,
        2,
        '2024-08-15 15:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        8,
        2,
        '2024-08-15 16:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        9,
        3,
        '2024-08-16 17:00:00+03',
        'Посещение успешно',
        true
    ),
    (
        10,
        3,
        '2024-08-16 18:00:00+03',
        'Пропуск без уважительной причины',
        false
    );