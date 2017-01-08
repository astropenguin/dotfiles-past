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
    from bokeh.io import output_file, output_notebook
    from bokeh.mpl import to_bokeh
    from bokeh.plotting import figure, show, save
    from bokeh.resources import CDN, INLINE
