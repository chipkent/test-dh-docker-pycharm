# An example of running Deephaven in a container in PyCharm

## Remote debugging

1. Create a Python Debug Server remote debugging run configuration
   1. `port=10001`
   2. Path mappings: `/Users/chip/dev/test-dh-docker-pycharm=/app`
   3. Note the required `pydevd-pycharm` version (e.g. `pydevd-pycharm~=222.4345.23`)
2. Add `pydevd-pycharm` with version to `requirements.txt`.
3. Add the following to the start of your python script:
   ```python
    import pydevd_pycharm
    pydevd_pycharm.settrace(host="host.docker.internal",
                            port=10001,
                            suspend=True,
                            trace_only_current_thread=False,
                            stdoutToServer=True,
                            stderrToServer=True)
   ```
4. Start the Python Debug Server.
5. `docker compose up --build`
6. Use the debugger from the Python Debug Server.

## For more details

* https://www.jetbrains.com/help/pycharm/using-docker-as-a-remote-interpreter.html#config-docker
* https://www.jetbrains.com/help/pycharm/using-docker-compose-as-a-remote-interpreter.html#dockerfile
* https://www.jetbrains.com/help/pycharm/remote-debugging-with-product.html#remote-interpreter
