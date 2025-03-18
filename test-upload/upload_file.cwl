doc: "Uploads a file to S3"
cwlVersion: v1.0
class: CommandLineTool

inputs:
  file:
    type: File

outputs:
  uploaded_file:
    type: File

baseCommand: [curl]
arguments:
  - "-X"
  - "POST"
  - "-H"
  - "Content-Type: application/octet-stream"
  - "--data-binary"
  - "@$(inputs.file.path)"
  - "http://service-upload:8080/api/s3/upload"


stdout: uploaded_file