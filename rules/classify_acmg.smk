# rules/classify_acmg.smk

rule classify_acmg:
    input:
        tsv = "results/STK11/STK11_clinvar_annotated.tsv"
    output:
        tsv = config["classified_tsv"]
    conda:
        "../envs/python.yaml"
    shell:
        "python3 scripts/classify_acmg.py {input.tsv} {output.tsv}"
