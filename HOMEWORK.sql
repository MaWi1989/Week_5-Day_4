--Question 1:
CREATE OR REPLACE PROCEDURE late_fee()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE payment
	SET amount = amount + 5.99
	WHERE return_date IN(
		SELECT return_date
		FROM rental
		WHERE return_date::DATE -  rental_date::DATE > 7);
			COMMIT;	
END;
$$;

CALL late_fee();




--Question 2:
ALTER TABLE customer
ADD platinum_member BOOLEAN;


CREATE OR REPLACE PROCEDURE platinum()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE customer
	SET platimun_member = true
	WHERE amount IN(
		SELECT SUM(amount)
		FROM payment
		HAVING SUM(amount) > 200);
			COMMIT;
END;
$$;

CALL platinum()


