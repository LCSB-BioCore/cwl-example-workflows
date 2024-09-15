#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

doc: "Print the FTP URL passed from the first step"

inputs:
  ftp_url:
    type: string
    inputBinding:
      position: 1

outputs:
  printed_output:
    type: stdout

baseCommand: ["sh", "-c"]
arguments:
  - |
    echo "FTP URL received: $(inputs.ftp_url)"
stdout: output.txt
