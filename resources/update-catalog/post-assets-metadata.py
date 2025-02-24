import sys
import json
import requests

DATASET_LIST_FIELD = "dcat:dataset"

def main(files_list):
    if not isinstance(files_list, list):
        raise ValueError("Unexpected arguments, expected a list of files")

    catalogs_list = []

    for file in files_list:
        with open(file, "r") as f:
            catalog_res = json.load(f)

        if isinstance(catalog_res, dict):
            catalog_res = [catalog_res]

        for catalog in catalog_res:
            if catalog.get(DATASET_LIST_FIELD) and not isinstance(catalog[DATASET_LIST_FIELD], list):
                catalog[DATASET_LIST_FIELD] = [catalog[DATASET_LIST_FIELD]]
            catalogs_list.append(catalog)

    res = requests.post("http://iderha-catalog:3000/api/catalog", json=catalogs_list, headers={"Content-Type": "application/json"})
    # Writing status code in an output file for subsequent steps to retrieve
    with open("response.txt", "w") as f:
        f.write(str(res.status_code))

    if not res.ok:
        error = f"An error occurred while pushing assets metadata: {res.content}"
        print(error)
        raise requests.exceptions.HTTPError(error)


if __name__ == "__main__":
    main(sys.argv[1:])
    print("Successfully sent request to MDC")
    exit(0)