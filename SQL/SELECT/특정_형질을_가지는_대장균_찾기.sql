SELECT COUNT(id) as COUNT
FROM ecoli_data
WHERE (genotype & 1 = 1 OR genotype & 4 = 4) AND genotype & 2 = 0
