# Fortellis Spec Push Action

The Fortellis Spec Push action automatically pushes changes to registered API specifications to the Fortellis platform on a pull request merge event.

> For more info, see https://docs.fortellis.io

## Usage

The Fortellis Spec Push action is intended to be used on a `pull_request merged` event. The action will automatically find the changed files and attempt to push them if they have been added to the configuration. To properly listen for a merged pull request event, make sure the `pull_request` is a `closed` type and its `merged` value is true.

```yaml
on:
  pull_request:
    types: [closed]
jobs:
  push:
    steps:
    - uses: fortellis/spec-push@v1
    - name: Fortellis Spec Push
        if: github.event.pull_request.merged == true
      with:
        fortellis_username: ${{ secrets.FORTELLIS_USERNAME }}
        fortellis_password: ${{ secrets.FORTELLIS_PASSWORD }}
```

## Prerequisites

* The repository must have been previously initialized as a "Fortellis repo" via the Fortellis CLI.
  > `fortellis-cli init`
* The spec files must have been added to the configuration via the Fortellis CLI.
  > `fortellis-cli add -f {spec}`
* A Fortellis account must have been registered
  > https://accounts.fortellis.io/signup

## Input Variables

* fortellis_username - The username of the Fortellis account that will own the API specification
* fortellis_password - The password of the Fortellis account that will own the API specification
  
  ```yaml
  on:
    pull_request:
      types: [closed]
  jobs:
    push:
      steps:
      - uses: fortellis/spec-push@v1
      - name: Fortellis Spec Push
          if: github.event.pull_request.merged == true
        with:
          fortellis_username: ${{ secrets.FORTELLIS_USERNAME }}
          fortellis_password: ${{ secrets.FORTELLIS_PASSWORD }}
  +       spec_files:
  +         - specs/appointments-v1.yaml
  ```

## Output

```text
Spec pushed
```

## Contributing

These actions were created to help create a better developer ex build better integrations between Fortellis and our partners using GitHub. We hope that others will be able to get the value from it that we have, and we welcome contributions from the community!

### Code of Conduct

We have adopted a Code of Conduct that we expect all contributors to adhere to. Please read the [code of conduct](https://github.com/Fortellis/fortellis-actions/blob/master/CODE_OF_CONDUCT.md) before contributing so that you know what is allowed as a part of this community.

## License

Fortellis-Actions is [MIT Licensed](https://github.com/Fortellis/fortellis-actions/blob/master/LICENSE)
