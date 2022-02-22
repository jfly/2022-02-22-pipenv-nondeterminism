pipenv nondeterminism
=====================

This repro contains an example of some pipenv nondeterminism I've run into.
Each time you run `pipenv lock` with the `Pipfile` in here, you'll end up with
different markers for `greenlet`.

Demo:

    $ docker run $(docker build -q https://github.com/jfly/2022-02-22-pipenv-nondeterminism.git#main)
    attempt 1: greenlet markers="python_version >= '3' and (platform_machine == 'aarch64' or (platform_machine == 'ppc64le' or (platform_machine == 'x86_64' or (platform_machine == 'amd64' or (platform_machine == 'AMD64' or (platform_machine == 'win32' or platform_machine == 'WIN32'))))))"
    attempt 2: greenlet markers="platform_python_implementation == 'CPython'"
    attempt 3: greenlet markers="platform_python_implementation == 'CPython'"
    ...
