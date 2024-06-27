cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh, -c]

hints:
  - class: DockerRequirement
    dockerPull: alpine

requirements:
  - class: InlineJavascriptRequirement

inputs: []

outputs: []

arguments:
  - valueFrom: |
      echo "Printing Kubernetes environment variables:" && \
      echo "" && \
      printenv | grep USER_ACCESS_TOKEN_EX && \
      echo "" && \
      echo "------------------------------------------------------------" && \
      echo "" && \
      echo "Echo Kubernetes environment variable - USER_ACCESS_TOKEN_EX:" && \
      echo "" && \
      echo $USER_ACCESS_TOKEN_EX;

