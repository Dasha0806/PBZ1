-- 7 
SELECT id_pr, id_det, id_pj 
FROM provider prd, detail det, project prj
where not(prd.city = det.city and prd.city = prj.city and det.city = prj.city);

-- 34
SELECT id_det FROM detail_number
JOIN provider ON detail_number.id_pr = provider.id_pr
JOIN project ON detail_number.id_pj = project.id_pj
WHERE provider.city = 'Лондон' OR project.city = 'Лондон';
-- 8 
SELECT DISTINCT id_pr, id_det, id_pj FROM provider prv
JOIN detail det ON prv.city != det.city
JOIN project prj ON prv.city != prj.city AND det.city != prj.city;

-- 20
SELECT DISTINCT colour FROM detail
JOIN detail_number ON detail_number.id_det = detail.id_det
WHERE detail_number.id_pr = 'П1';

-- 24
SELECT DISTINCT pr.id_pr FROM provider AS pr
WHERE pr.status < (
	SELECT p1.status FROM provider AS p1
WHERE p1.id_pr = 'П1'
);

-- 26
SELECT  id_pj FROM detail_number ppp 
GROUP BY id_pj, id_det
HAVING id_det = 'Д1'
AND AVG(s) > (
	SELECT max(s) FROM detail_number where id_pj = 'ПР1'
);
-- 10 
SELECT d.name FROM detail d
JOIN detail_number ppdn on d.id_det = ppdn.id_det
JOIN provider p on p.id_pr = ppdn.id_pr
JOIN project p2 on ppdn.id_pj = p2.id_pj
WHERE p.city = 'Лондон' AND p2.city = 'Лондон';

-- 17
SELECT id_det, id_pj, sum(s) FROM detail_number
GROUP BY id_det, id_pj
ORDER BY id_det;
    
-- 11 
SELECT DISTINCT provider.city, project.city FROM detail_number
JOIN provider ON detail_number.id_pr = provider.id_pr
JOIN project ON detail_number.id_pj = project.id_pj
ORDER BY provider.city;

-- 30
SELECT id_det FROM detail_number
JOIN project ON detail_number.id_pj = project.id_pj
WHERE project.city = 'Лондон';