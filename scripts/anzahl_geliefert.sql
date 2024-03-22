SELECT sum(v.anzal), r.`name` FROM `verkauf` v
JOIN model m on v.id_model = m.id_model
JOIN reseller r on v.id_reseller = r.id_reseller
GROUP BY r.id_reseller;