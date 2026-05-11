include { FASTQC_RAW }      from '../modules/fastqc'
include { TRIM_READS }      from '../modules/trimming'
include { FASTQC_TRIMMED }  from '../modules/trimmed_fastqc'
include { ALIGN_READS }     from '../modules/align'
include { SAM_TO_BAM }      from '../modules/sam_to_bam'
include { SORT_INDEX_BAM }  from '../modules/sort_index'
include { VARIANT_CALLING } from '../modules/variantcalling'

workflow MY_PIPELINE {
    take:
        fastq_input
        ref_input

    main:
        raw_qc = FASTQC_RAW(fastq_input)
        trimmed_fq = TRIM_READS(fastq_input)
        trimmed_qc = FASTQC_TRIMMED(trimmed_fq)
        aligned = ALIGN_READS(trimmed_fq, ref_input)
        bam = SAM_TO_BAM(aligned)
        sorted_outputs = SORT_INDEX_BAM(bam)
        VARIANT_CALLING(sorted_outputs.sorted_bam,sorted_outputs.bai, ref_input)

}

