#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  input:
    type: File  # Input for the first step

steps:
  extract_ftp_url:
    run: aggregate-pulldata.cwl.yml  # The first CWL tool
    in:
      input: input
    out: [ftp_url]

  print_ftp_url:
    run: aggregate-pulldata-nvflare-print.cwl  # The second CWL tool (printing the FTP URL)
    in:
      ftp_url: extract_ftp_url/ftp_url  # Pass the FTP URL from step1
    out: [printed_output]

outputs:
  confirmation:
    type: File
    outputSource: print_ftp_url/printed_output  # Capture the printed output as a file
