# coding: utf-8


import matplotlib.pyplot as plt
plt.style.use('seaborn-darkgrid')
plt.rcParams['figure.figsize'] = (12,6)

from matplotlib import colors
from matplotlib import gridspec

def in_notebook():
    try:
        config = get_ipython().config
        return 'IPKernelApp' in config
    except NameError:
        return False


if in_notebook():
    from ipywidgets import interact
    from bokeh.io import output_file, output_notebook, push_notebook
    from bokeh.layouts import column, gridplot, row
    from bokeh.resources import INLINE
    from bokeh.plotting import figure, save

    def show(obj=None, **kwargs):
        from bokeh.plotting import show
        from bokeh.io import output_notebook
        from bokeh.mpl import to_bokeh
        
        if obj is None:
            obj = to_bokeh()

        if type(obj) == plt.Figure:
            obj = to_bokeh(obj)

        output_notebook(INLINE, hide_banner=True)
        show(obj, **kwargs)
