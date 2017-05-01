SELECT *
FROM
(
	SELECT "Paid on time" AS "Days"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "Number of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) <= 0
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of number of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) <= 0
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "Value of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) <= 0
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of invoice value"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) <= 0
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1

UNION ALL

SELECT *
FROM
(
	SELECT "0-7 Days" AS "Header"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "Number of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 0
    AND DATEDIFF(invoices.received, invoices.repayment) <= 7
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "Number of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 0
    AND DATEDIFF(invoices.received, invoices.repayment) <= 7
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "Value of invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 0
    AND DATEDIFF(invoices.received, invoices.repayment) <= 7
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 0
    AND DATEDIFF(invoices.received, invoices.repayment) <= 7
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1

UNION ALL

SELECT *
FROM
(
	SELECT "7-15 Days" AS "Header"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "7-15 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 7
    AND DATEDIFF(invoices.received, invoices.repayment) <= 15
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 7
    AND DATEDIFF(invoices.received, invoices.repayment) <= 15
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "7-15 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 7
    AND DATEDIFF(invoices.received, invoices.repayment) <= 15
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 7
    AND DATEDIFF(invoices.received, invoices.repayment) <= 15
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1

UNION ALL

SELECT *
FROM
(
	SELECT "15-30 Days" AS "Header"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "15-30 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 15
    AND DATEDIFF(invoices.received, invoices.repayment) <= 30
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 15
    AND DATEDIFF(invoices.received, invoices.repayment) <= 30
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "15-30 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 15
    AND DATEDIFF(invoices.received, invoices.repayment) <= 30
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 15
    AND DATEDIFF(invoices.received, invoices.repayment) <= 30
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1

UNION ALL

SELECT *
FROM
(
	SELECT "30-60 Days" AS "Header"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "30-60 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 30
    AND DATEDIFF(invoices.received, invoices.repayment) <= 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 30
    AND DATEDIFF(invoices.received, invoices.repayment) <= 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "30-60 Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 30
    AND DATEDIFF(invoices.received, invoices.repayment) <= 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 30
    AND DATEDIFF(invoices.received, invoices.repayment) <= 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1

UNION ALL

SELECT *
FROM
(
	SELECT "60+ Days" AS "Header"
	FROM dual
) AS a,
(
    SELECT COUNT(*) AS "60+ Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b,
(
    SELECT CONCAT(ROUND(COUNT(*)*100/(
                            SELECT COUNT(*)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS b1,
(
    SELECT CONCAT('$', FORMAT(SUM(value),0)) AS "60+ Days"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c,
(
    SELECT CONCAT(ROUND(SUM(value)*100/(
                            SELECT SUM(value)
                            FROM invoices
                            WHERE (advance_total > 0)
                            AND invoices.status = "paid"
                        ),1),'%') AS "AS %age of repaid invoices"
    FROM invoices
    WHERE DATEDIFF(invoices.received, invoices.repayment) > 60
    AND (advance_total > 0)
    AND invoices.status = "paid"
) AS c1