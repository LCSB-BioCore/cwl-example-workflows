cwlVersion: v1.2
class: Workflow

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.nodeId)

requirements:
  InlineJavascriptRequirement: {}


inputs:
  input:
    type: File
  nodeId:
    type: string
    default: "http://tesk-api-node-2:8080/ga4gh/tes"
    inputBinding:
      position: 1

steps:
  upload:
    run: upload_file.cwl
    in:
      file: input
    out: [uploaded_file]

  copy:
    run: copy_tool.cwl
    in:
      file: upload/uploaded_file
    out: [copied_file]

outputs:
  copied_file:
    type: File
    outputSource: copy/copied_file