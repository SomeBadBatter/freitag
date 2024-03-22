SELECT m.`name`, count(id_transaction)
FROM `verkauf` v 
JOIN model m on v.id_model = m.id_model
GROUP BY v.id_model;