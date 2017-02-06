# coding: utf-8


import matplotlib as mpl
mpl.use('TkAgg')

import matplotlib.pyplot as plt
import seaborn as sns
sns.set_palette('Set2', 8)
plt.set_cmap('viridis')


def in_notebook():
    try:
        config = get_ipython().config
        return 'IPKernelApp' in config
    except NameError:
        return False


if in_notebook():
    from bokeh.io import output_file, output_notebook, push_notebook
    from bokeh.layouts import column, gridplot, row
    from bokeh.plotting import figure, save

