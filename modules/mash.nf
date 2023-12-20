process mash {
   input:
      val x
   output:
      //path 'xfile.txt', emit: aLook
      val "${x}"
      //path "${params.output}/${x}_trim_2.fastq", emit: trimR2
      
   """     
   
   mkdir -p ${params.output}/${x}/mash_output
   zcat ${params.output}/${x}/${x}.fastq.gz | mash sketch -r -m 2 - -o ${params.output}/${x}/mash_output/${x}_sketch
   
   mash dist /db/RefSeqSketchesDefaults.msh ${params.output}/${x}/mash_output/${x}_sketch.msh > ${params.output}/${x}/mash_output/${x}_distances.tab
   sort -gk3 ${params.output}/${x}/mash_output/${x}_distances.tab | head > ${params.output}/${x}/mash_output/${x}_distances_top10.tab

     
   """
}
