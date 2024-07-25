#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

doc: "Task to pull data from EDC"

hints:
  - class: DockerRequirement
    dockerPull: gitlab.lcsb.uni.lu:4567/luca.bolzani/iderha-test-deployment/edc-client

inputs:
  - id: input
    type: File
    inputBinding:
      position: 1

outputs:
  datalink:
    type: File
    outputBinding:
      glob: output.txt

baseCommand: ["/app/edc_client.sh"]
