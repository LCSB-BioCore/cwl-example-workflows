#!/usr/bin/env bash

set -euo pipefail

WES_ROOT="http://localhost:8081/ga4gh/wes/v1"

# GET /runs
ENDPOINT="/runs"
METHOD="GET"
EXPECTED_CODE="200"
echo -n "Testing '$METHOD $ENDPOINT' | Expecting: $EXPECTED_CODE | Got: "
RESPONSE_CODE=$(curl \
  --silent \
  --write-out "%{http_code}" \
  --output "/dev/null" \
  --request "$METHOD" \
  --header "Accept: application/json" \
  "${WES_ROOT}${ENDPOINT}" \
)
echo -n "$RESPONSE_CODE | Result: "
test $RESPONSE_CODE = $EXPECTED_CODE && echo "PASSED" || (echo "FAILED" && exit 1)

# POST /runs 200
ENDPOINT="/runs"
METHOD="POST"
EXPECTED_CODE="200"
echo -n "Testing '$METHOD $ENDPOINT' | Expecting: $EXPECTED_CODE | Got: "
RESPONSE_CODE=$(curl \
  --silent \
  --write-out '%{http_code}' \
  --output /dev/null \
  --request "$METHOD" \
  --header "Accept: application/json" \
  --header "Content-Type: multipart/form-data" \
  --form workflow_params='{"input":{"class":"File","path":"https://raw.githubusercontent.com/LCSB-BioCore/cwl-example-workflows/master/resources/test.txt"}}' \
  --form workflow_type="CWL" \
  --form workflow_type_version="v1.0" \
  --form workflow_url="https://github.com/LCSB-BioCore/cwl-example-workflows/blob/master/hashsplitter-workflow.cwl" \
  "${WES_ROOT}${ENDPOINT}"
)
echo -n "$RESPONSE_CODE | Result: "
test $RESPONSE_CODE = $EXPECTED_CODE && echo "PASSED" || (echo "FAILED" && exit 1)

# POST /runs 200 with trs tool
ENDPOINT="/runs"
METHOD="POST"
EXPECTED_CODE="200"
echo -n "Testing '$METHOD $ENDPOINT' | Expecting: $EXPECTED_CODE | Got: "
RESPONSE_CODE=$(curl \
  --silent \
  --write-out '%{http_code}' \
  --output /dev/null \
  --request "$METHOD" \
  --header "Accept: application/json" \
  --header "Content-Type: multipart/form-data" \
  --form workflow_params='{"input":{"class":"File","path":"https://github.com/LCSB-BioCore/cwl-example-workflows/blob/master/resources/test.txt}}' \
  --form workflow_type="CWL" \
  --form workflow_type_version="v1.0" \
  --form workflow_url="https://github.com/LCSB-BioCore/cwl-example-workflows/blob/master/trs.echo/trs-echo.cwl" \
  "${WES_ROOT}${ENDPOINT}"
)
echo -n "$RESPONSE_CODE | Result: "
test $RESPONSE_CODE = $EXPECTED_CODE && echo "PASSED" || (echo "FAILED" && exit 1)


# POST /runs 200 with drs object
ENDPOINT="/runs"
METHOD="POST"
EXPECTED_CODE="200"
echo -n "Testing '$METHOD $ENDPOINT' | Expecting: $EXPECTED_CODE | Got: "
RESPONSE_CODE=$(curl \
  --silent \
  --write-out '%{http_code}' \
  --output /dev/null \
  --request "$METHOD" \
  --header "Accept: application/json" \
  --header "Content-Type: multipart/form-data" \
  --form workflow_params='{"input":{"class":"File","path":"drs:/iderha-test-central-node.org/K1yVjH"}}' \
  --form workflow_type="CWL" \
  --form workflow_type_version="v1.0" \
  --form workflow_url="https://github.com/LCSB-BioCore/cwl-example-workflows/blob/master/drs.echo/drs-echo.cwl" \
  "${WES_ROOT}${ENDPOINT}"
)
echo -n "$RESPONSE_CODE | Result: "
test $RESPONSE_CODE = $EXPECTED_CODE && echo "PASSED" || (echo "FAILED" && exit 1)


# POST /runs 200 with trs tool and drs object
ENDPOINT="/runs"
METHOD="POST"
EXPECTED_CODE="200"
echo -n "Testing '$METHOD $ENDPOINT' | Expecting: $EXPECTED_CODE | Got: "
RESPONSE_CODE=$(curl \
  --silent \
  --write-out '%{http_code}' \
  --output /dev/null \
  --request "$METHOD" \
  --header "Accept: application/json" \
  --header "Content-Type: multipart/form-data" \
  --form workflow_params='{"input":{"class":"File","path":"drs://iderha-test-central-node.org/K1yVjH"}}' \
  --form workflow_type="CWL" \
  --form workflow_type_version="v1.0" \
  --form workflow_url="https://github.com/LCSB-BioCore/cwl-example-workflows/blob/master/trs.echo/trs-echo.cwl" \
  "${WES_ROOT}${ENDPOINT}"
)
echo -n "$RESPONSE_CODE | Result: "
test $RESPONSE_CODE = $EXPECTED_CODE && echo "PASSED" || (echo "FAILED" && exit 1)
