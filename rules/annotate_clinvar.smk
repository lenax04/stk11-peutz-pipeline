# rules/annotate_clinvar.smk

rule annotate_clinvar:
    input:
        tsv = "results/STK11/STK11_gnomad.tsv"
    output:
        tsv = "results/STK11/STK11_clinvar_annotated.tsv"
    conda:
        "../envs/python.yaml"
    shell:
        "python3 scripts/annotate_clinvar_and_parse.py {input.tsv} {output.tsv}"
