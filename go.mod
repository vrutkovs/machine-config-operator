module github.com/openshift/machine-config-operator

go 1.12

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/InVisionApp/go-health v2.1.0+incompatible
	github.com/InVisionApp/go-logger v1.0.1 // indirect
	github.com/Masterminds/goutils v1.1.0 // indirect
	github.com/Masterminds/semver v1.4.2 // indirect
	github.com/Masterminds/sprig v2.20.0+incompatible
	github.com/Microsoft/go-winio v0.4.12 // indirect
	github.com/ajeddeloh/yaml v0.0.0-20170912190910-6b94386aeefd // indirect
	github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf // indirect
	github.com/apparentlymart/go-cidr v1.0.0
	github.com/ashcrow/osrelease v0.0.0-20180626175927-9b292693c55c
	github.com/containerd/cgroups v0.0.0-20190710130057-d596c78861b1 // indirect
	github.com/containers/image v2.0.0+incompatible
	github.com/containers/storage v0.0.0-20190204185450-0b67c788f2d2
	github.com/coreos/container-linux-config-transpiler v0.9.0
	github.com/coreos/go-systemd v0.0.0-20190620071333-e64a0ec8b42a // indirect
	github.com/coreos/ignition v0.33.0
	github.com/coreos/ignition/v2 v2.0.0
	github.com/davecgh/go-spew v1.1.1
	github.com/docker/distribution v2.7.1+incompatible // indirect
	github.com/docker/docker v1.3.3 // indirect
	github.com/docker/go-units v0.4.0 // indirect
	github.com/evanphx/json-patch v4.5.0+incompatible // indirect
	github.com/ghodss/yaml v1.0.0
	github.com/go-log/log v0.1.0 // indirect
	github.com/godbus/dbus v0.0.0-20181101234600-2ff6f7ffd60f // indirect
	github.com/gogo/protobuf v1.2.1 // indirect
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6 // indirect
	github.com/golang/protobuf v1.3.2 // indirect
	github.com/google/gofuzz v1.0.0 // indirect
	github.com/google/renameio v0.1.0
	github.com/googleapis/gnostic v0.3.0 // indirect
	github.com/hashicorp/golang-lru v0.5.1 // indirect
	github.com/huandu/xstrings v1.2.0 // indirect
	github.com/imdario/mergo v0.3.7
	github.com/json-iterator/go v1.1.6 // indirect
	github.com/konsorten/go-windows-terminal-sequences v1.0.2 // indirect
	github.com/kubernetes-sigs/cri-o v1.12.10
	github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742 // indirect
	github.com/opencontainers/go-digest v1.0.0-rc1
	github.com/opencontainers/image-spec v1.0.1 // indirect
	github.com/opencontainers/runc v0.1.1 // indirect
	github.com/opencontainers/runtime-spec v0.0.0-20190207185410-29686dbc5559 // indirect
	github.com/openshift/api v0.0.0-20190725193935-b7d4eb0fa1e0
	github.com/openshift/client-go v0.0.0-20190627172412-c44a8b61b9f4
	github.com/openshift/kubernetes-drain v0.0.0-20190727205423-d20a33f09dbf
	github.com/openshift/library-go v0.0.0-20190704075327-f8abdcd57c46
	github.com/pborman/uuid v0.0.0-20180906182336-adf5a7427709 // indirect
	github.com/pkg/errors v0.8.1
	github.com/sirupsen/logrus v1.4.2 // indirect
	github.com/spf13/cobra v0.0.5
	github.com/spf13/pflag v1.0.3
	github.com/stretchr/testify v1.3.0
	github.com/vincent-petithory/dataurl v0.0.0-20160330182126-9a301d65acbb
	go4.org v0.0.0-20190313082347-94abd6928b1d // indirect
	golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4 // indirect
	golang.org/x/net v0.0.0-20190628185345-da137c7871d7 // indirect
	golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45 // indirect
	golang.org/x/sys v0.0.0-20190712062909-fae7ac547cb7 // indirect
	golang.org/x/time v0.0.0-20190308202827-9d24e82272b4
	google.golang.org/appengine v1.6.1 // indirect
	google.golang.org/genproto v0.0.0-20190708153700-3bdd9d9f5532 // indirect
	google.golang.org/grpc v1.22.0 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	k8s.io/api v0.0.0-20190816222004-e3a6b8045b0b
	k8s.io/apiextensions-apiserver v0.0.0-20190820064606-e49a3471dba5
	k8s.io/apimachinery v0.0.0-20190816221834-a9f1d8a9c101
	k8s.io/apiserver v0.0.0-20190820063401-c43cd040845a // indirect
	k8s.io/client-go v0.0.0-20190820062731-7e43eff7c80a
	k8s.io/cloud-provider v0.0.0-20190704110555-622ee4517bee // indirect
	k8s.io/klog v0.3.3 // indirect
	k8s.io/kube-openapi v0.0.0-20190709113604-33be087ad058 // indirect
	k8s.io/kubelet v0.0.0-20190820102342-ebe40be4c334
	k8s.io/kubernetes v1.14.6
	k8s.io/utils v0.0.0-20190712101616-fac88abaa102 // indirect
	sigs.k8s.io/yaml v1.1.0 // indirect
)

replace (
	k8s.io/api => github.com/openshift/kubernetes-api v0.0.0-20190815163222-ffaba947a5e9
	k8s.io/apiextensions-apiserver => github.com/openshift/kubernetes-apiextensions-apiserver v0.0.0-20190812133642-e58a314b3749
	k8s.io/apimachinery => github.com/openshift/kubernetes-apimachinery v0.0.0-20190823072306-d19092a3cc0a
	k8s.io/apiserver => github.com/openshift/kubernetes-apiserver v0.0.0-20190723190532-392b5b3e5888
	k8s.io/client-go => github.com/openshift/kubernetes-client-go v11.0.1-0.20190701222832-70952d66b5d1+incompatible
	k8s.io/code-generator => github.com/openshift/kubernetes-code-generator v0.0.0-20171023130718-f40157d9638d
	k8s.io/kubelet => github.com/openshift/kubernetes-kubelet v0.0.0-20190802155351-60e43eba885b
)
