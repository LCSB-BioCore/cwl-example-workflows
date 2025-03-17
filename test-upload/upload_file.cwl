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
  - "-F"
  - "file=@$(inputs.file.path)"
  - "http://service-upload:8080/api/s3/upload"


stdout: uploaded_file