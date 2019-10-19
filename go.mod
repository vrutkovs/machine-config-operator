module github.com/openshift/machine-config-operator

go 1.12

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/InVisionApp/go-health v1.1.7-0.20190926150048-b5cab38233bb
	github.com/Masterminds/sprig v2.20.0+incompatible
	github.com/apparentlymart/go-cidr v1.0.0
	github.com/ashcrow/osrelease v0.0.0-20180626175927-9b292693c55c
	github.com/containers/image v3.0.2+incompatible
	github.com/containers/storage v1.13.4
	github.com/coreos/fcct v0.2.0
	github.com/coreos/ignition v0.33.0
	github.com/coreos/ignition/v2 v2.0.1
	github.com/cri-o/cri-o v1.9.0-beta.2
	github.com/davecgh/go-spew v1.1.1
	github.com/ghodss/yaml v1.0.0
	github.com/go-bindata/go-bindata v3.1.1+incompatible
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golangci/golangci-lint v1.18.0
	github.com/google/renameio v0.1.0
	github.com/imdario/mergo v0.3.8
	github.com/joho/godotenv v1.3.0
	github.com/opencontainers/go-digest v1.0.0-rc1
	github.com/openshift/api v3.9.1-0.20191014195513-c9253efc14f4+incompatible
	github.com/openshift/client-go v0.0.0-20191001081553-3b0e988f8cb0
	github.com/openshift/cluster-api v0.0.0-20191004085540-83f32d3e7070
	github.com/openshift/library-go v0.0.0-20191003152030-97c62d8a2901
	github.com/pkg/errors v0.8.1
	github.com/prometheus/client_golang v1.1.0
	github.com/securego/gosec v0.0.0-20190709033609-4b59c948083c
	github.com/spf13/cobra v0.0.5
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.4.0
	github.com/vincent-petithory/dataurl v0.0.0-20160330182126-9a301d65acbb
	golang.org/x/time v0.0.0-20190921001708-c4c64cad1fd0
	k8s.io/api v0.0.0-20190918155943-95b840bb6a1f
	k8s.io/apimachinery v0.0.0-20190913080033-27d36303b655
	k8s.io/client-go v0.0.0-20190929040153-a39e818a0987
	k8s.io/code-generator v0.0.0-20190927045949-f81bca4f5e85
	k8s.io/kubectl v0.0.0-20190831152136-eb175a4e3db6
	k8s.io/kubelet v0.0.0-20190831152136-ba9cf7ec6904
)

replace (
	github.com/godbus/dbus => github.com/godbus/dbus v0.0.0-20190623212516-8a1682060722
	github.com/opencontainers/runtime-spec => github.com/opencontainers/runtime-spec v0.1.2-0.20190408193819-a1b50f621a48
	k8s.io/apiextensions-apiserver => github.com/openshift/kubernetes-apiextensions-apiserver v0.0.0-20190918161926-8f644eb6e783
	k8s.io/apiserver => github.com/openshift/kubernetes-apiserver v0.0.0-20190918160949-bfa5e2e684ad
	k8s.io/cli-runtime => github.com/openshift/kubernetes-cli-runtime v0.0.0-20190918162238-f783a3654da8
	k8s.io/cloud-provider => github.com/openshift/kubernetes-cloud-provider v0.0.0-20190918163234-a9c1f33e9fb9
	k8s.io/cluster-bootstrap => github.com/openshift/kubernetes-cluster-bootstrap v0.0.0-20190918163108-da9fdfce26bb
	k8s.io/component-base => github.com/openshift/kubernetes-component-base v0.0.0-20190918160511-547f6c5d7090
	k8s.io/cri-api => github.com/openshift/kubernetes-cri-api v0.0.0-20190828162817-608eb1dad4ac
	k8s.io/csi-translation-lib => github.com/openshift/kubernetes-csi-translation-lib v0.0.0-20190918163402-db86a8c7bb21
	k8s.io/kube-aggregator => github.com/openshift/kubernetes-kube-aggregator v0.0.0-20190918161219-8c8f079fddc3
	k8s.io/kube-controller-manager => github.com/openshift/kubernetes-kube-controller-manager v0.0.0-20190918162944-7a93a0ddadd8
	k8s.io/kube-proxy => github.com/openshift/kubernetes-kube-proxy v0.0.0-20190918162534-de037b596c1e
	k8s.io/kube-scheduler => github.com/openshift/kubernetes-kube-scheduler v0.0.0-20190918162820-3b5c1246eb18
	k8s.io/kubernetes => github.com/openshift/kubernetes v1.16.0-beta.0.0.20190913145653-2bd9643cee5b
	k8s.io/legacy-cloud-providers => github.com/openshift/kubernetes-legacy-cloud-providers v0.0.0-20190918163543-cfa506e53441
	k8s.io/metrics => github.com/openshift/kubernetes-metrics v0.0.0-20190918162108-227c654b2546
	k8s.io/sample-apiserver => github.com/openshift/kubernetes-sample-apiserver v0.0.0-20190918161442-d4c9c65c82af
)
