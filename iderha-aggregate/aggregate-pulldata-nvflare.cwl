#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

doc: "Task to pull data from EDC and return the FTP URL"

hints:
  - class: DockerRequirement
    dockerPull: gitlab.lcsb.uni.lu:4567/luca.bolzani/iderha-test-deployment/edc-client

inputs:
  input:
    type: File
    inputBinding:
      position: 1

outputs:
  ftp_url:
    type: string  # Output will be the FTP URL as a string
    outputBinding:
      outputEval: $(self[0])  # Use the first line or the content of the output

baseCommand: ["sh", "-c"]
arguments:
  - |
    /app/edc_client.sh $(inputs.input.path) > output.txt && \
    first_line=$(head -n 1 output.txt) && \
    echo "Extracted FTP URL: $first_line"