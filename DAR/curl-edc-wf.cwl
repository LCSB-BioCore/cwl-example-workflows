class: CommandLineTool
cwlVersion: v1.2

doc: "Task to send a cURL request to edc endpoint"

requirements:
  - class: DockerRequirement
    dockerPull: repomanager.lcsb.uni.lu:9999/curlimages/curl:8.8.0

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  url:
    type: string
  jsonFile:
    type: File
    loadContents: true

  nodeId:
    type: string
    default: "http://tesk-api:8080/ga4gh/tes/v1"

outputs:
  output:
    type: stdout

stdout: curl-output.txt


#baseCommand: echo
#arguments:
#  - "curl POST"
#  - '-H "Content-Type: application/json"'

baseCommand: "curl"
arguments:
  - '-H "Content-Type: application/json"'
  - '--location'
  - $(inputs.url)
  - '--data-raw'
  - $(inputs.jsonFile.contents)
