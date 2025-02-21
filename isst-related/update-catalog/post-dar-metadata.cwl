cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: gitlab.lcsb.uni.lu:4567/luca.bolzani/iderha-test-deployment/iderha-mdc-management

inputs:
  DARMetadata:
    type: File
    inputBinding:
      prefix: --file
      position: 1

  location:
    type: string
    inputBinding:
      prefix: --location
      position: 2

outputs: []

baseCommand: "python3"
arguments:
  - "/app/post-dar-metadata.py"

#  - -X
#  - POST
#  - -H
#  - Content-Type:application/json
#  - --location
#  - http://iderha-catalog:3000/api/catalog
#  - --data
#  - @$(inputs.assetsMetadata.path)