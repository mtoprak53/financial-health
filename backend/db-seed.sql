INSERT INTO users (username, password, email) 
VALUES ('mete',
        '$2b$12$AZH7virni5jlTTiGgEg4zu3lSvAw68qVEfSIOjJ3RqtbJbdW/Oi5q',
        'mete@kagan.tc');

INSERT INTO expenses (
    username, 
    purchase_date, 
    purchase_name, 
    purchase_type, 
    amount, 
    medium, 
    wallet, 
    promotion_type, 
    promotion_expiration, 
    NOTES        
  )
VALUES (
    'mete', 
    '2023-08-05', 
    "Trader Joe's", 
    "grocery", 
    128.56,
    "American Express M"
    NULL, 
    NULL, 
    NULL, 
    NULL
  )