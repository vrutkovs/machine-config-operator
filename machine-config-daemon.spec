%define debug_package %{nil}
%global commit          48daa5067cc6dba27002f04bf3608231597bc0c5
%global shortcommit     %(c=%{commit}; echo ${c:0:7})

Name:           machine-config-daemon
Version:        4.3.0
Release:        2.rhaos4.3.git%{shortcommit}%{?dist}
Summary:        https://github.com/vrutkovs/machine-config-operator
License:        ASL 2.0
URL:            https://github.com/vrutkovs/machine-config-operator
Source0:        https://github.com/vrutkovs/machine-config-operator/archive/%{commit}/machine-config-operator-%{shortcommit}.tar.gz

BuildRequires:  git
BuildRequires:  %{?go_compiler:compiler(go-compiler)}%{!?go_compiler:golang >= 1.6.2}

%description
%{summary}

%prep
%autosetup -Sgit -n machine-config-operator-%{commit}

%build
env VERSION_OVERRIDE=%{version} SOURCE_GIT_COMMIT=%{commit} make daemon

%install
install -D -m 0755 _output/linux/*/%{name} $RPM_BUILD_ROOT/usr/libexec/%{name}
install -D -m 0755 cmd/machine-config-daemon/pivot.sh $RPM_BUILD_ROOT/%{_bindir}/pivot

%files
%license LICENSE
%doc docs/README.md
%{_libexecdir}/%{name}
%{_bindir}/pivot
