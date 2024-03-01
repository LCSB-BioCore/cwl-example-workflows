cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
hints:
  - class: DockerRequirement
    dockerPull: trs://10.240.6.104/W70VHH/versions/gndm03

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
