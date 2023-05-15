## ACK Multi-Controller Helm Chart

The ACK Multi-Controller Helm chart, shortened to `ack-chart`, acts as a wrapper
for all ACK controllers released under [General Availability (GA)][services].

`ack-chart` lists each ACK controller as a subchart dependency.

### Release Status

`ack-chart` is currently in **developer preview** and is subject to breaking
changes.

[services]: https://aws-controllers-k8s.github.io/community/docs/community/services/

## Usage

Helm 3.8+ is required to install `ack-chart`, since it is hosted in an
[OCI-based image registry][oci-registry].

To install the latest version of `ack-chart`, use the following command:
```bash
export LATEST_VERSION=`curl -sL https://api.github.com/repos/aws-controllers-k8s/ack-chart/releases/latest | grep '"tag_name":' | cut -d'"' -f4`
helm install --create-namespace -n ack-system ack-chart \
  oci://public.ecr.aws/aws-controllers-k8s/ack-chart --version=$LATEST_VERSION
```

[oci-registry]: https://helm.sh/docs/topics/registries/

### Enabling Subcharts

By default, when installing the `ack-chart`, **none of the subcharts are
installed**. To enable a subchart, set the value associated with the ACK
controller - either using `--set SERVICE.enabled=true` or by configuring
the option in your `values.yaml` file. For example, to enable the
`s3-controller`, enable using the `s3` path like so:
```yaml
s3:
  enabled: true
```

Helm exposes all of the values for the underlying subcharts, just use the name
of the service as the parent key and provide any overrides in the same
structure as the subchart expects. For example, to update the `aws.region` for
the `s3`:
```yaml
s3:
  enabled: true
  aws:
    region: "us-east-1"
```

## Versioning

`ack-chart` is versioned independently of the subcharts it contains. As any of
the dependencies are updated, the version for `ack-chart` is also updated. If
any of the dependencies is incremented by a minor version, the `ack-chart` is
also incremented by a minor version.

The continuous deployment scripts live in the [`test-infra`
repository][cd-location]

[cd-location]:
    https://github.com/aws-controllers-k8s/test-infra/tree/main/cd/ack-chart

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This project is licensed under the Apache-2.0 License.

