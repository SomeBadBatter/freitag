SELECT m.`name`, sum(m.preis * v.anzal) as umsatz
FROM verkauf v 
JOIN model m ON v.id_model = m.id_model
GROUP BY m.id_model
order by umsatz desc;