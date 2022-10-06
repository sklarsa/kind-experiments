# K8s Experiments

This is a repo with some k8s experiments running in a [kind cluster](https://kind.sigs.k8s.io/)

## Prerequisites

### Install basic stuff from homebrew
```bash
brew install kubectl kind
```

### Install krew
<https://krew.sigs.k8s.io/docs/user-guide/setup/install/>
```bash
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

### Add aliases
```bash
alias k=kubectl
alias kcd='f(){ kubectl config set-context $(kubectl config current-context) --namespace="$@";  unset -f f; }; f'
```
