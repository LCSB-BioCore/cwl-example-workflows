doc: "Copies the uploaded file to another location"
cwlVersion: v1.2
class: CommandLineTool

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  - id: input
    type: File
  - id: nodeId
    type: string



outputs:
  copied_file:
    type: File
    outputBinding:
      glob: copied_file.txt

baseCommand: [cp]
arguments:
  - "$(inputs.input.path)"
  - "copied_file"

stdout: copied_file.txt