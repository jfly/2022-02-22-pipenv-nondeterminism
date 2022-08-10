# pipenv nondeterminism

This repro contains an example of some pipenv nondeterminism I've run into.
Each time you run `pipenv lock` with the `Pipfile` in here, you'll end up with
different markers for `greenlet`.

I've filed this issue upstream: https://github.com/pypa/pipenv/issues/4967

## Demo

### pipenv 2022.8.5

    $ docker run $(docker build -q --build-arg=PIP_VERSION=22.2.2 --build-arg=PIPENV_VERSION=2022.8.5 https://github.com/jfly/2022-02-22-pipenv-nondeterminism.git#main)
    attempt 1: greenlet markers="platform_python_implementation == 'CPython'"
    attempt 2: greenlet markers="platform_python_implementation == 'CPython'"
    attempt 3: greenlet markers="platform_python_implementation == 'CPython'"
    attempt 4: greenlet markers="python_version >= '3' and platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32')))))"

### pipenv 2022.7.24

    $ docker run $(docker build -q --build-arg=PIP_VERSION=22.2.2 --build-arg=PIPENV_VERSION=2022.7.24 https://github.com/jfly/2022-02-22-pipenv-nondeterminism.git#main)
    attempt 1: greenlet markers="platform_python_implementation == 'CPython'"
    attempt 2: greenlet markers="python_version >= '3' and platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32')))))"
    attempt 3: greenlet markers="platform_python_implementation == 'CPython'"

### pipenv 2022.4.21

    $ docker run $(docker build -q --build-arg=PIP_VERSION=22.2.2 --build-arg=PIPENV_VERSION=2022.4.21 https://github.com/jfly/2022-02-22-pipenv-nondeterminism.git#main)
    attempt 1: greenlet markers="python_version >= '3' and (platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32'))))))"
    attempt 2: greenlet markers="python_version >= '3' and platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32')))))"
    attempt 3: greenlet markers="python_version >= '3' and platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32')))))"
    attempt 4: greenlet markers="platform_python_implementation == 'CPython'"

### pipenv 2022.1.8

The version of pipenv that this was originally reported for (https://github.com/pypa/pipenv/issues/4967)

    $ docker run $(docker build -q --build-arg=PIP_VERSION=22.2.2 --build-arg=PIPENV_VERSION=2022.1.8 https://github.com/jfly/2022-02-22-pipenv-nondeterminism.git#main)
    attempt 1: greenlet markers="python_version >= '3' and (platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32'))))))"
    attempt 2: greenlet markers="python_version >= '3' and platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32')))))"
    attempt 3: greenlet markers="platform_python_implementation == 'CPython'"
