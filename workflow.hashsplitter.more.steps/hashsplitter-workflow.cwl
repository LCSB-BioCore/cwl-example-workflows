#!/usr/bin/env cwlrunner

class: Workflow

cwlVersion: v1.0

inputs:
  - id: input
    type: File
    doc: "to be hashed all the ways"

outputs:
  - id: output
    type: File
    outputSource: unify/output



steps:
  - id: md5
    run: hashsplitter-md5.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: md6
     run: hashsplitter-md6.cwl.yml
     in:
       - { id: input, source: input }
     out:
       - { id: output }

  - id: md7
     run: hashsplitter-md7.cwl.yml
     in:
       - { id: input, source: input }
     out:
       - { id: output }

  - id: md8
       run: hashsplitter-md8.cwl.yml
       in:
         - { id: input, source: input }
       out:
         - { id: output }

  - id: sha
    run: hashsplitter-sha.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: sha1
    run: hashsplitter-sha.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: sha2
      run: hashsplitter-sha.cwl.yml
      in:
        - { id: input, source: input }
      out:
        - { id: output }
  - id: sha3
      run: hashsplitter-sha.cwl.yml
      in:
        - { id: input, source: input }
      out:
        - { id: output }

  - id: whirlpool
    run: hashsplitter-whirlpool.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }
  - id: whirlpool1
    run: hashsplitter-whirlpool.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }
  - id: whirlpool2
    run: hashsplitter-whirlpool.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: whirlpool3
    run: hashsplitter-whirlpool.cwl.yml
    in:
      - { id: input, source: input }
    out:
      - { id: output }

  - id: unify
    run: hashsplitter-unify.cwl.yml
    in:
      - { id: md5, source: md5/output }
      - { id: sha, source: sha/output }
      - { id: whirlpool, source: whirlpool/output }
    out:
      - { id: output }
