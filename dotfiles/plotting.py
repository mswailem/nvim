import numpy as np
import matplotlib.pyplot as plt

# TODO: Implement 3d plots, contour plots, and histogram plots, and maybe more?
# TODO: Implement default column 0 to be line number and instead shift columns by 1 (similar to gnuplot)
# TODO: Implement so that if only one file is given, it can plot multiple columns
# TODO: If onle one file and one column is given, then fix the loop going over the string

def plot(filenames, plot_type='normal', cols=[0, 1], labels=[], colors=[], fmt='o', logx=False, logy=False, xlabel= '' , ylabel= ''):
    ''' Plots data from multiple files with the following options:
    normal: 2d plot
    heatmap: heatmap plot'''

    plt.xlabel(xlabel)
    plt.ylabel(ylabel)

    # Default labels
    if len(labels) == 0:
        labels = ['' for _ in range(len(filenames))]
    
    # Default colors
    if len(colors) == 0:
        colors = ['black', 'blue', 'red', 'green', 'purple'] + [np.random.rand(3,) for _ in range(len(filenames) - 5)]

    # Load data
    for i, filename in enumerate(filenames):
        data = np.loadtxt(filename)

        if logx:
            plt.xscale('log')

        if logy:
            plt.yscale('log')

        if plot_type == 'normal':
            if len(cols) == 2:
                plt.plot(data[:, cols[0]], data[:, cols[1]], fmt, color=colors[i], label=labels[i])
            elif len(cols) == 3:
                plt.errorbar(data[:, cols[0]], data[:, cols[1]], yerr=data[:, cols[2]], fmt=fmt, color=colors[i], label=labels[i])
        elif plot_type == 'heatmap':
            plt.scatter(data[:, cols[0]], data[:, cols[1]], c=data[:, cols[2]], cmap='hot')
            plt.colorbar()
        else:
            print('Invalid plot type')
            return
