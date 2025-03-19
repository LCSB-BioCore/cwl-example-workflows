doc: "Uploads a file to S3"
cwlVersion: v1.2
class: CommandLineTool

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  - id: file
    type: File
  - id: nodeId
    type: string


outputs:
  uploaded_file:
    type: File
    outputBinding:
          glob: uploaded_file.txt

baseCommand: [curl]
arguments:
  - "-X"
  - "POST"
  - "-H"
  - "Content-Type: text/plain"
  - "--data-binary"
  - "@$(inputs.file.path)"
  - "http://service-upload:8080/api/s3/upload"


stdout: uploaded_file.txt