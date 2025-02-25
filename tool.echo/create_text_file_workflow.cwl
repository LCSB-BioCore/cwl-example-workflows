cwlVersion: v1.2
class: Workflow

hints:
  RemoteLocationRequirement:
    nodeUri: "http://tesk-api-node-2:8080/ga4gh/tes/"

inputs:
  input: File

outputs:
  output1:
    type: File
    outputSource: generate_outputs/output1
  output2:
    type: File
    outputSource: generate_outputs2/output2

steps:
  generate_outputs:
    run: create_text_file.cwl
    in:
      input: input
    out: [output1]

  generate_outputs2:
      run: create_text_file_2.cwl
      in:
        input: input
      out: [output2]
