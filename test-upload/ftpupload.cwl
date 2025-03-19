cwlVersion: v1.2
class: Workflow

requirements:
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  input:
    type: File
  nodeId:
    type: string
    default: "http://tesk-api-node-1:8080/ga4gh/tes"

steps:
  upload:
    run: ftp_upload_file.cwl
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