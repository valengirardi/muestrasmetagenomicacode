# PRIMERA PARTE (COMÚN A TODAS):
source ~/miniconda/etc/profile.d/conda.sh
conda activate
conda activate qiime2-amplicon-2023.9

cd /Users/valentinagirardi/Downloads/MUESTRASBITETK/data
gunzip *.gz           
ls

cd /Users/valentinagirardi/Downloads/MUESTRASBITETK

#Conteo del total de las secuencias para cada muestra y el total de pares. Se debería obtener igual número de secuencias en los archivos forward y reverse de cada muestra:
mkdir 01_basic_stats
OUTPUT_DIR=01_basic_stats
OUTPUT=${OUTPUT_DIR}/stats.txt
TOTAL=0
for FILE in data/*.fastq
do NUM=$((`cat ${FILE} | wc -l` / 4 | bc)) 
TOTAL=$((TOTAL+NUM))  
echo "${FILE}: ${NUM}" >> ${OUTPUT}
done
echo "TOTAL NUMBER OF PAIRS: ${TOTAL}" >> $OUTPUT

#Revisión de la calidad de las secuencias obtenidas. Se genera un archivo fastqc para cada muestra y un multiqc que hace un resumen de todas las muestras en conjunto.
INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/data
OUTPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/02_raw_data_qc
mkdir ${OUTPUT_DIR}
fastqc data/*.fastq -o ${OUTPUT_DIR}/
cd ${OUTPUT_DIR}/
multiqc 
cd 

SEGUNDA PARTE (INTENTANDO HACER EL TRIMMING QUE HACE CRISTIÁN):
#Corte de las secuencias:
INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/data
OUTPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/04_trimming
mkdir -p ${OUTPUT_DIR}
cd ${OUTPUT_DIR}

#  opción 1:
CORTO LAS PRIMERAS 8 PARA R1-C_1:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R1-C_trimmed_1.fastq \
${INPUT_DIR}/R1-C_1.fastq \
> ${OUTPUT_DIR}/R1-C_trimmed_1_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA R2-10_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/R2-10_trimmed_1.fastq \
${INPUT_DIR}/R2-10_1.fastq \
> ${OUTPUT_DIR}/R2-10_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA R3-30_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/R3-30_trimmed_1.fastq \
${INPUT_DIR}/R3-30_1.fastq \
> ${OUTPUT_DIR}/R3-30_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R4-50_1:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R4-50_trimmed_1.fastq \
${INPUT_DIR}/R4-50_1.fastq \
> ${OUTPUT_DIR}/R4-50_trimmed_1_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA R5-70_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/R5-70_trimmed_1.fastq \
${INPUT_DIR}/R5-70_1.fastq \
> ${OUTPUT_DIR}/R5-70_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R6-100_1:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R6-100_trimmed_1.fastq \
${INPUT_DIR}/R6-100_1.fastq \
> ${OUTPUT_DIR}/R6-100_trimmed_1_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA TK1-t0_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/TK1-t0_trimmed_1.fastq \
${INPUT_DIR}/TK1-t0_1.fastq \
> ${OUTPUT_DIR}/TK1-t0_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA TK1-t30_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/TK1-t30_trimmed_1.fastq \
${INPUT_DIR}/TK1-t30_1.fastq \
> ${OUTPUT_DIR}/TK1-t30_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA TK1-t60_1:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/TK1-t60_trimmed_1.fastq \
${INPUT_DIR}/TK1-t60_1.fastq \
> ${OUTPUT_DIR}/TK1-t60_trimmed_1_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R1-C_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R1-C_trimmed_2.fastq \
${INPUT_DIR}/R1-C_2.fastq \
> ${OUTPUT_DIR}/R1-C_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 18 PARA R2-10_2:
cutadapt \
--cut 18 \
-o ${OUTPUT_DIR}/R2-10_trimmed_2.fastq \
${INPUT_DIR}/R2-10_2.fastq \
> ${OUTPUT_DIR}/R2-10_trimmed_2_cut18_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R3-30_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R3-30_trimmed_2.fastq \
${INPUT_DIR}/R3-30_2.fastq \
> ${OUTPUT_DIR}/R3-30_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R4-50_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R4-50_trimmed_2.fastq \
${INPUT_DIR}/R4-50_2.fastq \
> ${OUTPUT_DIR}/R4-50_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R5-70_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R5-70_trimmed_2.fastq \
${INPUT_DIR}/R5-70_2.fastq \
> ${OUTPUT_DIR}/R5-70_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA R6-100_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/R6-100_trimmed_2.fastq \
${INPUT_DIR}/R6-100_2.fastq \
> ${OUTPUT_DIR}/R6-100_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA TK1-t0_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/TK1-t0_trimmed_2.fastq \
${INPUT_DIR}/TK1-t0_2.fastq \
> ${OUTPUT_DIR}/TK1-t0_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA TK1-t30_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/TK1-t30_trimmed_2.fastq \
${INPUT_DIR}/TK1-t30_2.fastq \
> ${OUTPUT_DIR}/TK1-t30_trimmed_2_cut8_cutadapt_log.txt

CORTO LAS PRIMERAS 8 PARA TK1-t60_2:
cutadapt \
--cut 8 \
-o ${OUTPUT_DIR}/TK1-t60_trimmed_2.fastq \
${INPUT_DIR}/TK1-t60_2.fastq \
> ${OUTPUT_DIR}/TK1-t60_trimmed_2_cut8_cutadapt_log.txt

SI HUBIERA QUERIDO:
Esto sirve para sacar de todas (x ej. _1.fastq) los 8 primeros
parallel --link --jobs 4 \
'cutadapt \
--cut 8 \
-o /Users/valentinagirardi/Downloads/MUESTRASBITETK/04_trimming/{/}_trimmed.fastq \
{} \
> /Users/valentinagirardi/Downloads/MUESTRASBITETK/04_trimming/{/}_cutadapt_log.txt' \
::: ${INPUT_DIR}/*_1.fastq

mkdir logs
mv *txt logs/.

# opción 2:
CORTO LAS PRIMERAS 8 PARA R1-C_2 y lo corto en 260:
cutadapt \
--cut 8 \
-l 260 \
-o ${OUTPUT_DIR}/R1-C_trimmed_2.fastq \
${INPUT_DIR}/R1-C_2.fastq \
> ${OUTPUT_DIR}/R1-C_trimmed_2.txt

CORTO LAS PRIMERAS 18 PARA R2-10_2 y lo corto en 230:
cutadapt \
--cut 18 \
-l 230 \
-o ${OUTPUT_DIR}/R2-10_trimmed_2.fastq \
${INPUT_DIR}/R2-10_2.fastq \
> ${OUTPUT_DIR}/R2-10_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA R3-30_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/R3-30_trimmed_2.fastq \
${INPUT_DIR}/R3-30_2.fastq \
> ${OUTPUT_DIR}/R3-30_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA R4-50_2 y lo corto en 260:
cutadapt \
--cut 8 \
-l 260 \
-o ${OUTPUT_DIR}/R4-50_trimmed_2.fastq \
${INPUT_DIR}/R4-50_2.fastq \
> ${OUTPUT_DIR}/R4-50_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA R5-70_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/R5-70_trimmed_2.fastq \
${INPUT_DIR}/R5-70_2.fastq \
> ${OUTPUT_DIR}/R5-70_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA R6-100_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/R6-100_trimmed_2.fastq \
${INPUT_DIR}/R6-100_2.fastq \
> ${OUTPUT_DIR}/R6-100_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA TK1-t0_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/TK1-t0_trimmed_2.fastq \
${INPUT_DIR}/TK1-t0_2.fastq \
> ${OUTPUT_DIR}/TK1-t0_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA TK1-t30_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/TK1-t30_trimmed_2.fastq \
${INPUT_DIR}/TK1-t30_2.fastq \
> ${OUTPUT_DIR}/TK1-t30_trimmed_2.txt

CORTO LAS PRIMERAS 8 PARA TK1-t60_2 y lo corto en 230:
cutadapt \
--cut 8 \
-l 230 \
-o ${OUTPUT_DIR}/TK1-t60_trimmed_2.fastq \
${INPUT_DIR}/TK1-t60_2.fastq \
> ${OUTPUT_DIR}/TK1-t60_trimmed_2.txt

mkdir logs
mv *txt logs/.

# opción de CORTE POR CALIDAD:
# USANDO BBMAP (Lo hice para 10, 12, 8, 6 y 7.3 y probé usarlos solos o con el corte del inicio ya hecho - si filtro mucho (ejemplo 20 o 15, me quedan menos secuencias de r que de f y dada2 no puede ser usado)
for file in "${INPUT_DIR}"/*.fastq; do
    base_name=$(basename "${file}" .fastq)
    bbduk.sh in="${file}" out="${OUTPUT_DIR}/${base_name}.fastq" qtrim=rl trimq=10
    echo "Archivo ${file} procesado."
done

# Podría solucionar el problema de las secuencias diferentes eliminando las secuencias desalineadas (aquellas que no tienen pareja correspondiente en el archivo opuesto)
# Primero, se debe identificar las secuencias que tienen una pareja correspondiente en el archivo reverse.fastq: se buscan las IDs de secuencia presentes en el archivo reverse.fastq utilizando el siguiente comando. Esto creará un archivo llamado reverse_ids.txt que contiene solo las IDs de secuencia del archivo reverse.fastq.
grep -oP '^@(\S+)' reverse.fastq | sed 's/@//' > reverse_ids.txt
# Luego, se eliminan las secuencias del archivo forward.fastq que no tienen una pareja correspondiente: se buscan las secuencias del archivo forward.fastq cuyas IDs no están presentes en el archivo reverse_ids.txt y se guardan en un nuevo archivo:
grep -A 3 -f <(sed 's/^/@/' reverse_ids.txt) forward.fastq | grep -v "^--$" > forward_clean.fastq


# USANDO FASTX TOOLKIT:
for file in "${INPUT_DIR}"/*.fastq; do
    base_name=$(basename "${file}" .fastq)
    fastq_quality_filter -Q33 -q 20 -p 80 -i "${file}" -o "${OUTPUT_DIR}/${base_name}.fastq"
    echo "Archivo ${file} filtrado."
done
echo "Proceso completado."

# USANDO CUTADAPT:
for file in "${INPUT_DIR}"/*.fastq
do
    base_name=$(basename "${file}" .fastq)
    cutadapt -q 20,20 --minimum-length 50 -o "${OUTPUT_DIR}/${base_name}_trimmed.fastq" "${file}" > "${OUTPUT_DIR}/${base_name}_cutadapt.log"
    echo "Archivo ${file} procesado."
done
echo "Proceso completado."


sigue el código:
cd /Users/valentinagirardi/Downloads/MUESTRASBITETK
OUTPUT_DIR=06_trimming_qc2
mkdir ${OUTPUT_DIR}
fastqc 04_trimming/*.fastq -o ${OUTPUT_DIR}/

cd ${OUTPUT_DIR}/
multiqc .

# TERCERA PARTE:
# Generación de del manifiesto que se va a usar para importar a qiime.
cd /Users/valentinagirardi/Downloads/MUESTRASBITETK/04_trimming

echo -e "sample-id,absolute-filepath,direction" > manifest.csv
for file1 in *_1.fastq; do
    file2="${file1/_1.fastq/_2.fastq}"
    id=$(basename "$file1" | cut -d '_' -f 1-2)
    absolute_filepath1="$(pwd)/$file1"
    absolute_filepath2="$(pwd)/$file2"
    echo -e "$id,$absolute_filepath1,forward" >> manifest.csv
    echo -e "$id,$absolute_filepath2,reverse" >> manifest.csv
done

# Importación de la metadata desde qiime
INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/04_trimming
OUTPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/10_demux
mkdir -p "${OUTPUT_DIR}"
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' --input-path manifest.csv --output-path "${OUTPUT_DIR}/demux-paired-end.qza" --input-format PairedEndFastqManifestPhred33

# Resumen de los recuentos por muestra para todas las muestras con gráficas interactivas.
INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/10_demux

qiime demux summarize --i-data "$INPUT_DIR/demux-paired-end.qza" --o-visualization "$INPUT_DIR/demux-summary.qzv" --verbose

# dada2 (generalmente le puse 0 a todos los parámetros si ya corté antes; estos parámetros son para las muestras con un solo corte de calidad en 10 con bbmap)
INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/10_demux
OUTPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/20_dada2
mkdir -p "${OUTPUT_DIR}"

qiime dada2 denoise-paired --i-demultiplexed-seqs ${INPUT_DIR}/demux-paired-end.qza --p-trunc-len-f 0 --p-trim-left-f 8 --p-trunc-len-r 250 --p-trim-left-r 8 --o-representative-sequences ${OUTPUT_DIR}/dada2-rep-seqs.qza --o-table ${OUTPUT_DIR}/dada2-table.qza --o-denoising-stats ${OUTPUT_DIR}/dada2-stats.qza

INPUT_DIR=/Users/valentinagirardi/Downloads/MUESTRASBITETK/20_dada2
qiime metadata tabulate --m-input-file ${INPUT_DIR}/dada2-stats.qza --o-visualization ${INPUT_DIR}/dada2-stats.qzv
qiime feature-table tabulate-seqs --i-data ${INPUT_DIR}/dada2-rep-seqs.qza --o-visualization ${INPUT_DIR}/dada2-rep-seqs.qzv
qiime feature-table summarize --i-table ${INPUT_DIR}/dada2-table.qza --o-visualization ${INPUT_DIR}/dada2-table.qzv
qiime tools export --input-path ${INPUT_DIR}/dada2-stats.qza --output-path ${INPUT_DIR}/dada2-stats





