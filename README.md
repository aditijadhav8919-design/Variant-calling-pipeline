# Variant-calling-pipeline
# 🧬 Variant Calling Pipeline

A modular, reproducible **Nextflow** pipeline for variant calling from raw FASTQ reads. The pipeline performs quality control, adapter trimming, read alignment, and variant detection using industry-standard bioinformatics tools.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Pipeline Workflow](#pipeline-workflow)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Input](#input)
- [Output](#output)
- [Project Structure](#project-structure)
- [Tools Used](#tools-used)
- [License](#license)

---

## Overview

This pipeline automates the end-to-end process of identifying genetic variants (SNPs and indels) from raw sequencing data. It is built with **Nextflow** for scalability and portability, and uses **Conda** for reproducible environment management.

---

## Pipeline Workflow

```
Raw FASTQ Reads
      │
      ▼
  FastQC         ← Quality Control
      │
      ▼
 Trimmomatic      ← Adapter & Quality Trimming
      │
      ▼
    BWA           ← Alignment to Reference Genome
      │
      ▼
  SAMtools        ← SAM → BAM Conversion, Sorting & Indexing
      │
      ▼
  BCFtools        ← Variant Calling (SNPs & Indels)
      │
      ▼
  VCF Output      ← Final Variant Calls
```

---

## Requirements

- [Nextflow](https://www.nextflow.io/) ≥ 22.10
- [Conda](https://docs.conda.io/) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- Java 11 or later (for Nextflow)

---

## Installation

**1. Clone the repository**

```bash
git clone https://github.com/aditijadhav8919-design/Variant-calling-pipeline.git
cd Variant-calling-pipeline
```

**2. Create and activate the Conda environment**

```bash
conda env create -f environment.yml
conda activate NextflowPipeline
```

**3. Install Nextflow** (if not already installed)

```bash
curl -s https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/
```

---

## Usage

```bash
nextflow run main.nf \
  --fastq "data/*.fastq.gz" \
  --ref   "reference/genome.fa"
```

### Parameters

| Parameter | Description | Required |
|-----------|-------------|----------|
| `--fastq` | Path to input FASTQ file(s) — supports glob patterns | ✅ Yes |
| `--ref`   | Path to reference genome FASTA file | ✅ Yes |

---

## Input

- **FASTQ files** — Raw or gzipped sequencing reads (`.fastq` or `.fastq.gz`)
- **Reference genome** — A FASTA file (`.fa` or `.fasta`) for alignment (e.g., GRCh38)

Ensure the reference genome is indexed with BWA before running:

```bash
bwa index reference/genome.fa
```

---

## Output

The pipeline generates the following output files:

| File | Description |
|------|-------------|
| `*.html` / `*.zip` | FastQC quality reports |
| `*_trimmed.fastq.gz` | Trimmed reads from Trimmomatic |
| `*.bam` / `*.bai` | Sorted, indexed BAM alignment files |
| `*.vcf` | Final variant calls (SNPs & indels) |

---

## Project Structure

```
Variant-calling-pipeline/
├── main.nf              # Main Nextflow entry point
├── nextflow.config      # Pipeline configuration
├── environment.yml      # Conda environment definition
├── modules/             # Individual process modules
└── workflows/
    └── workflow.nf      # MY_PIPELINE workflow definition
```

---

## Tools Used

| Tool | Version | Purpose |
|------|---------|---------|
| [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | Latest | Quality control of raw reads |
| [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) | Latest | Adapter and quality trimming |
| [BWA](https://bio-bwa.sourceforge.net/) | Latest | Short-read alignment to reference |
| [SAMtools](http://www.htslib.org/) | Latest | BAM processing and indexing |
| [BCFtools](http://www.htslib.org/doc/bcftools.html) | Latest | Variant calling and filtering |

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Author

**Aditi Jadhav**  
GitHub: [@aditijadhav8919-design](https://github.com/aditijadhav8919-design)
