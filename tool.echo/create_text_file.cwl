cwlVersion: v1.2
class: CommandLineTool



baseCommand: ["bash", "-c"]
arguments:
  - |
    echo "This is output1" > output1.txt
inputs:
  input:
    type: File
outputs:
  output1:
    type: File
    outputBinding:
      glob: output1.txt

