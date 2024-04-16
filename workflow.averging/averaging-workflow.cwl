#!/usr/bin/env cwlrunner

class: Workflow

cwlVersion: v1.0

inputs:
  input:
    type: File
    inputBinding:
      position: 1

  input2:
    type: File
    inputBinding:
      position: 2


outputs:
  - id: output
    type: File
    outputSource: unify/output

steps:
  - id: avg1
    run: averaging_tool.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: avg2
    run: averaging_tool_2.cwl.yml
    in:
      - { id: input2, source: input }
    out:
      - { id: output }

  - id: unify
    run: averaging_final_tool.cwl.yml
    in:
      - { id: avg1, source: avg1/output }
      - { id: avg2, source: avg2/output }
    out:
      - { id: output }
