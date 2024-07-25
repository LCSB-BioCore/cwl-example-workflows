#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

inputs:
    input:
        type: File
    input2:
        type: File

outputs:
  - id: aggregated
    type: File
    outputSource: aggregate_final/output

steps:
  - id: pull_1
    run: aggregate-pulldata.cwl.yml
    in:
      input: input
    out: [datalink]

  - id: aggregate_1
    run: aggregate-remote.cwl.yml
    in:
      input: pull_1/datalink
    out: [partial]

  - id: pull_2
    run: aggregate-pulldata2.cwl.yml
    in:
      input2: input2
    out: [datalink]

  - id: aggregate_2
    run: aggregate-remote2.cwl.yml
    in:
      input: pull_2/datalink
    out: [partial]

  - id: aggregate_final
    run: aggregate-central.cwl.yml
    in:
      input-remote-1: aggregate_1/partial
      input-remote-2: aggregate_2/partial
    out: [output]
