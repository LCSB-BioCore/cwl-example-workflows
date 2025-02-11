cwlVersion: v1.2
class: CommandLineTool


hints:
  - class: CentralStorageRequirement
    centralStorage: true

baseCommand: ["bash", "-c"]
arguments:
  - |
    echo "This is output2" > output2.txt
inputs:
  input:
    type: File
outputs:
  output2:
    type: File
    outputBinding:
      glob: output2.txt
