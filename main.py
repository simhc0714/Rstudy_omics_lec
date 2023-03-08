import pandas as pd
df = pd.read_csv(filepath_or_buffer='./tcga/34d1151a-2725-4259-a1d1-2b0027c65b45.rna_seq.augmented_star_gene_counts.tsv', sep='\t', skiprows=[0, 2, 3, 4, 5])
print(df.info())