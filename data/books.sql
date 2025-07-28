INSERT INTO book (id, title, author, published_at, isbn, created_at, updated_at) VALUES
(UUID_TO_BIN('3f8d5f2c-9b7d-4b83-b65e-0d1ae55c7761'), 'Pride and Prejudice', 'Jane Austen', '1813-01-28 00:00:00', '9780141439518', NOW(), NOW()),
(UUID_TO_BIN('91d8c7a9-3bb4-4f1c-a236-509b59b5bbd0'), 'Moby-Dick', 'Herman Melville', '1851-10-18 00:00:00', '9780142437247', NOW(), NOW()),
(UUID_TO_BIN('a66c2cd2-7ee4-48de-a0d2-d6dc9f8ff88a'), 'Jane Eyre', 'Charlotte Brontë', '1847-10-16 00:00:00', '9780142437209', NOW(), NOW()),
(UUID_TO_BIN('e7123e4c-3e14-4075-9f31-57294dff90cd'), 'Great Expectations', 'Charles Dickens', '1861-01-01 00:00:00', '9780141439563', NOW(), NOW()),
(UUID_TO_BIN('cb4f387b-1873-437d-bf52-1a1b0ff18949'), 'Wuthering Heights', 'Emily Brontë', '1847-12-01 00:00:00', '9780141439556', NOW(), NOW()),
(UUID_TO_BIN('20de4c97-22e2-4b58-9c86-8438ffadce8c'), 'Frankenstein', 'Mary Shelley', '1818-01-01 00:00:00', '9780141439471', NOW(), NOW()),
(UUID_TO_BIN('df05bc2e-c891-4f2f-9fc5-d588ed3a3e42'), 'The Picture of Dorian Gray', 'Oscar Wilde', '1890-06-20 00:00:00', '9780141439570', NOW(), NOW()),
(UUID_TO_BIN('5be214d0-e85d-471a-9b44-0fdba2195f2a'), 'Dracula', 'Bram Stoker', '1897-05-26 00:00:00', '9780141439846', NOW(), NOW()),
(UUID_TO_BIN('4fa113fa-f18a-46e8-b3f2-98b35b3d9b2c'), 'The Adventures of Huckleberry Finn', 'Mark Twain', '1884-12-10 00:00:00', '9780142437179', NOW(), NOW()),
(UUID_TO_BIN('ba8428f6-6fd5-4e0e-9fa5-3d38c5de59c2'), 'The Scarlet Letter', 'Nathaniel Hawthorne', '1850-03-16 00:00:00', '9780142437261', NOW(), NOW());
