# rules/annotate_gnomad.smk

rule annotate_gnomad:
    input:
        vcf = "results/STK11/STK11_spliceai.vcf"
    output:
        tsv = "results/STK11/STK11_gnomad.tsv"
    conda:
        "../envs/python.yaml"
    shell:
        "python3 scripts/annotate_gnomad.py {input.vcf} {output.tsv}"
