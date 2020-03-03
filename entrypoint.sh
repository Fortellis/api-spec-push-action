#!/bin/bash

pull_request_base_sha=$(jq -r '.pull_request.base.sha' $GITHUB_EVENT_PATH)
current_sha="$GITHUB_SHA"

changed_files=$(git diff-tree --no-commit-id --name-only --no-merges --diff-filter=d -r "$pull_request_base_sha" "$current_sha")
echo "Added or changed files: $changed_files"
echo ""

exit_status=0

for fileName in $changed_files
  do
    (fortellis-cli push -s -u "$INPUT_FORTELLIS_USERNAME" -p "$INPUT_FORTELLIS_PASSWORD" -f $fileName) && status=$? || status=$?
    if [[ "$status" == 0 ]]; then
      echo "Spec $fileName pushed"
    elif [[ "$status" == 103 ]]; then
      echo "Skipping $fileName not added in Fortellis repo"
    else 
      echo "An error has occured while attempting to push $filename"
      exit_status=1
    fi;
    echo "";
done

exit $exit_status
