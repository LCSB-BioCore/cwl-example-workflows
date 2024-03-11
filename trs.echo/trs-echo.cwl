cwlVersion: v1.0
class: CommandLineTool
baseCommand: cat
hints:
  - class: DockerRequirement
    dockerPull: trs://172.30.163.186:8080/W70VHH/versions/gndm03

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
