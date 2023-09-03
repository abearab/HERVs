gtf=$1
FASTA=$2
jobs=$3

genome=${gtf/.gtf.gz/}

echo ${genome}

gunzip $gtf
gtf=${gtf/.gz/}

mkdir ${genome}_star_index

STAR \
    --runThreadN ${jobs} \
    --runMode genomeGenerate \
    --genomeDir ${genome}_star_index \
    --limitGenomeGenerateRAM 400000000000 \
    --genomeFastaFiles ${FASTA} \
    --sjdbGTFfile ${gtf} \
    --sjdbOverhang 99 &> ${genome}.log

gzip $gtf
