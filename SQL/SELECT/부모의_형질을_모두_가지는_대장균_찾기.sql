SELECT a.id, a.genotype, b.genotype as parent_genotype
FROM ecoli_data a JOIN ecoli_data b ON a.parent_id = b.id
WHERE a.genotype & b.genotype = b.genotype
ORDER BY a.id;
