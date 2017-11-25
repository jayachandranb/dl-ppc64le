# dl-ppc64le

This is the repo for the Power8 docker image jayachandranb/deeplearning:ppc64le. The image requires nvidia-docker to run. UI_MODE can be lab or notebook (to start jupyter lab or notebook).
```
nvidia-docker run -d -p 8888:8888 -p 7777:7777 --name=dl -e UI_MODE=lab jayachandranb/deeplearning:ppc64le
```

The image also exposes ports 7770 - 7779 for running multiple tensorboards/other services (7777 is dedicated to the default tensorboard service).

The image has python 3.5.2 as default and the following python modules present/installed.
```
absl-py, alabaster, babel, bleach, bokeh, certifi, chardet, cloudpickle, colorama, cycler,
cython, dill, docutils, entrypoints, enum34, future, futures, h2o, html5lib, idna, imagesize,
ipykernel, ipython, ipython-genutils, ipywidgets, jedi, Jinja2, jsonschema, jupyter, jupyter-client,
jupyter-console, jupyter-core, jupyterlab, jupyterlab-launcher, markdown, MarkupSafe, matplotlib,
mistune, mpmath, nbconvert, nbformat, networkx, nose, notebook, olefile, panda, pandas, pandocfilters,
parameterized, parso, patsy, pexpect, pickleshare, pillow, plotly, prompt-toolkit, protobuf,
ptyprocess, py4j, pydot-ng, pygments, pyparsing, pyspark, python-dateutil, pytz, PyWavelets,
PyYAML, pyzmq, qtconsole, requests, scikit-image, scikit-learn, seaborn, simplegeneric, six,
snowballstemmer, sphinx, sphinxcontrib-websupport, statsmodels, sympy, tabulate, tensorflow,
tensorflow-tensorboard, terminado, testpath, theano, tornado, traitlets, urllib3, vincent, virtualenv,
wcwidth, webencodings, werkzeug, widgetsnbextension, xlrd
```
