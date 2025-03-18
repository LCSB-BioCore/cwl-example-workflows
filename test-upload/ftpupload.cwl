cwlVersion: v1.0
class: Workflow

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.nodeId)

inputs:
  - id: input
    type: File

  - id: nodeId
    type: string
    default: "http://tesk-api-node-1:8080/ga4gh/tes"
steps:
  upload:
    run: ftp_upload_file.cwl
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