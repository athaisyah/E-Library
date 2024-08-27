SELECT * FROM users

----------------- Q1
SELECT category, COUNT(*) AS book_count
FROM Book
GROUP BY category
ORDER BY book_count DESC;

----------------- Q2
SELECT U.username, B.title, L.due_date
FROM Loan L
JOIN Users U ON L.user_id = U.user_id
JOIN Book B ON L.book_id = B.book_id
WHERE L.return_date IS NULL AND L.due_date < CURRENT_DATE;

----------------- Q3
SELECT U.username, B.title, H.hold_date
FROM Hold H
JOIN Users U ON H.user_id = U.user_id
JOIN Book B ON H.book_id = B.book_id
WHERE H.status = 'active';

----------------- Q4
SELECT AVG(book_count) AS avg_books_borrowed
FROM (
    SELECT user_id, COUNT(*) AS book_count
    FROM Loan
    GROUP BY user_id
) AS user_loans;

----------------- Q5
SELECT L.name, COUNT(B.book_id) AS total_books
FROM Library L
JOIN Book B ON L.library_id = B.library_id
GROUP BY L.name
ORDER BY total_books DESC
LIMIT 1;
