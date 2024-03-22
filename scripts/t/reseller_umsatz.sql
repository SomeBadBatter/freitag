SELECT r.`name`, sum(m.preis * v.anzal) as umsatz
FROM verkauf v 
JOIN model m ON v.id_model = m.id_model
JOIN reseller r on v.id_reseller = r.id_reseller
GROUP BY r.id_reseller
order by umsatz desc;