helm repo add stakater <https://stakater.github.io/stakater-charts>

helm upgrade --install vscode stakater/application \
 --namespace management \
 -f values-dev.yaml

helm uninstall vscode --namespace management

sudo apt update
sudo apt install unzip

curl "<https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip>" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws configure sso --use-device-code
aws sso login --sso-session app_dev

app_dev
<https://app.awsapps.com/start/#>
us-east-1

aws sso login --sso-session app_dev --use-device-code

/config/.kube/config

apiVersion: v1
clusters:

- cluster:
  certificate-authority-data:
  ADD-CERTIFICATE-AUTHORITY-DATA-HERE
  server: <https://AF6A9C9A13B6AF34F3F4718FA8AD3AEA.gr7.il-central-1.eks.amazonaws.com>
  name: arn:aws:eks:il-central-1:111111111:cluster/dev-01
  contexts:
- context:
  cluster: arn:aws:eks:il-central-1:111111111:cluster/dev-01
  user: arn:aws:eks:il-central-1:111111111:cluster/dev-01
  name: aws-dev-01-il-central-1
  current-context: aws-dev-01-il-central-1
  kind: Config
  users:
- name: arn:aws:eks:il-central-1:111111111:cluster/dev-01
  user:
  exec:
  apiVersion: client.authentication.k8s.io/v1beta1
  args: - --region - il-central-1 - eks - get-token - --cluster-name - dev-01 - --output - json
  command: aws
  env: - name: AWS_PROFILE
  value: AdministratorAccess-111111111
  interactiveMode: IfAvailable
  provideClusterInfo: false

install kubernetes extension
