cwlVersion: v1.2
class: CommandLineTool

doc: "Task to send a cURL request to edc endpoint"

requirements:
  - class: DockerRequirement
    dockerPull: repomanager.lcsb.uni.lu:9999/curlimages/curl:8.8.0

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  - id: jsonFile
    type: File

  - id: nodeId
    type: string
    default: "http://tesk-api-node-1:8080/ga4gh/tes"

outputs: []
#  output:
#    type: stdout
#
#stdout: curl-output.txt

baseCommand: sh
arguments:
  - -c
  - "curl -H Content-Type:application/json -H \"Authorization:Bearer $USER_PASSPORT_TOKEN\" --location http://edc-provider:19191/api/access --data @$(inputs.jsonFile.path)"