#!/bin/bash

echo "*************************"
echo "Fetching Report"
echo "*************************"

http_code=$(
  curl -v \
    --header "x-api-key: ${OVEROPS_API_KEY}" \
    --data "query={applicationName: ${CI_PROJECT_NAME}, serviceId: ${OVEROPS_ENVIRONMENT_ID}, deploymentName: job-${CI_COMMIT_SHORT_SHA}, markUnstable: true, newEvents: true, resurfacedErrors: true, maxErrorVolume: 10, maxUniqueErrors: 10, criticalExceptionTypes:'ExampleUncaughtException, SAXParseException', activeTimeSpan: '0m', baselineTimespan: '1d', minVolumeThreshold: 1, minErrorRateThreshold: 0.0001, regressionDelta: 0.0001, criticalRegressionDelta: 0.0001  }" \
    --request POST \
    --url ${OVEROPS_BACKEND_URL}/report/v1 \
    --output overops-quality-report/report.html \
    --write-out '%{http_code}'
)

if [[ $http_code -eq 200 ]]; then
    exit 0
fi

## decide which status you want to return for 404 or 500
echo "Job marked as failure"
exit  204

