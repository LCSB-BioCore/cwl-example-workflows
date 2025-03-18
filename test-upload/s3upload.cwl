cwlVersion: v1.0
class: Workflow

hints:
  - class: RemoteLocationRequirement
    nodeUri: "http://tesk-api-node-1:8080/ga4gh/tes"

inputs:
  input:
    type: File

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