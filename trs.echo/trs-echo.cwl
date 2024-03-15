cwlVersion: v1.0
class: CommandLineTool
baseCommand: cat
hints:
  - class: DockerRequirement
    dockerPull: trs://trs-filer:8080/4XQUH4/versions/kkgyx6

inputs:
  - id: input
    type: File
    inputBinding:
      position: 1
outputs:
  output_file:
    type: File
    outputBinding:
      glob: echo_output.txt
