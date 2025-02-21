cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, -c]

hints:
  - class: DockerRequirement
    dockerPull: alpine
  - class: CentralStorageRequirement
    centralStorage: True
  - class: RemoteLocationRequirement
    nodeUri: http://tesk-api-node-2:8080/ga4gh/tes/


requirements:
  - class: InlineJavascriptRequirement

inputs: []

outputs: []

arguments:
  - valueFrom: |
      echo "Printing Kubernetes environment variables - grep USER_PASSPORT_TOKEN:" && \
      echo "" && \
      printenv | grep USER_PASSPORT_TOKEN && \
      echo "" && \
      echo "------------------------------------------------------------" && \
      echo "" && \
      echo "Echo Kubernetes environment variable - USER_PASSPORT_TOKEN:" && \
      echo "" && \
      echo $USER_PASSPORT_TOKEN;

stdout: printed_savecentral.txt
