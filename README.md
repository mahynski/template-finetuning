How To Use
---

<img src="https://raw.githubusercontent.com/huggingface/autotrain-advanced/main/src/autotrain/app/static/logo.png" align="right" width=200 />

First clone and open in VSCode, then "Reopen in Container" to install devcontainer.

To launch Jupyter notebook server:
~~~bash
$ bash .devcontainer/start_jupyter.sh # at 127.0.0.1:1234
~~~

To launch Jupyter MLFlow server:
~~~bash
$ bash .devcontainer/start_mlflow.sh # at 127.0.0.1:1236
~~~

To launch Autotrain UI:
~~~bash
$ bash .devcontainer/start_autotrain_ui.sh # at 127.0.0.1:1235
~~~

❗ Be sure to add your Hugging Face token to `.devcontainer/.env` before launching the UI.
