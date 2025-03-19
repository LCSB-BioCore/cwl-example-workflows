cwlVersion: v1.2
class: Workflow

requirements:
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  input:
    type: File
  nodeId:
    type: string
    default: "http://tesk-api-node-2:8080/ga4gh/tes"


steps:
  upload:
    run: upload_file.cwl
    in:
      file: input
      nodeId: nodeId
    out: [uploaded_file]

  copy:
    run: copy_tool.cwl
    in:
      input: upload/uploaded_file
      nodeId: nodeId
    out: [copied_file]

outputs:
  copied_file:
    type: File
    outputSource: copy/copied_file