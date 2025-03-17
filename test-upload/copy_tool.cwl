doc: "Copies the uploaded file to another location"
cwlVersion: v1.0
class: CommandLineTool

inputs:
  file:
    type: File

outputs:
  copied_file:
    type: File

baseCommand: [cp]
arguments:
  - "$(inputs.file.path)"
  - "copied_file"

stdout: copied_file