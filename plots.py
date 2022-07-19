import os

import matplotlib.pyplot as plt
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator

TAGS = [
    "Train/Loss",
    "Train/Metric",
    "Test/Loss",
    "Test_Acc"
]

FILES_NAMES = {
    "Train/Loss": "train-loss.png",
    "Train/Metric": "train-acc.png",
    "Test/Loss": "test-loss.png",
    "Test_Acc": "test-acc.png",
}

AXE_LABELS = {
    "Train/Loss": "Train loss",
    "Train/Metric": "Train acc",
    "Test/Loss": "Test loss",
    "Test_Acc": "Test acc",
}

LEGEND = {
    "fedavg": "FedAvg",
    "FedEM": "FedEM",
    "fededg": "FedEdg",
    "moon": "MOON",
    "fedprox": "FedProx",
    "all_in": "ALL_IN_ONE",
    "fedavg_entropy": "FedAvg+entropy",
    "fededg_entropy": "FedEdg+entropy",
    "fedprox_entropy": "FedProx+entropy",
    "moon_entropy": "MOON+entropy"
}

MARKERS = {
    "local": "x",
    "all_in": "s",
    "fedavg": "*",
    "FedEM": "h",
    "fededg": "d",
    "moon": "4",
    "personalized": "X",
    "DEM": "|",
    "fedprox": "^",
    "fedavg_entropy": "*",
    "fededg_entropy": "d",
    "fedprox_entropy": "^",
    "moon_entropy": "4"
}

COLORS = {
    "local": "blue",
    "all_in": "orange",
    "fedavg": "green",
    "FedEM": "c",
    "fededg": "purple",
    "moon": "red",
    "personalized": "brown",
    "DEM": "pink",
    "fedprox": "cyan",
    "fedavg_entropy": "green",
    "fededg_entropy": "purple",
    "fedprox_entropy": "cyan",
    "moon_entropy": "red"
}

LINESTYLE = {
    "local": "-",
    "all_in": "-",
    "fedavg": "-",
    "FedEM": "-",
    "fededg": "-",
    "moon": "-",
    "personalized": "-",
    "DEM": "-",
    "fedprox": "-",
    "fedavg_entropy": ":",
    "fededg_entropy": ":",
    "fedprox_entropy": ":",
    "moon_entropy": ":"
}

def make_plot(path_,tag_,save_path=None):
    """

    :param path_: path of the logs directory, `path_` should contain sub-directories corresponding to algorithms
        each sub-directory must contain a single tf events file.
    :param tag_:
    :param save_path: default to the path_
    :return:
    """
    fig, ax = plt.subplots(figsize=(24,20))
    algorithms = [i for i in os.listdir(path_) if not i.endswith(".png")]
    for algorithm in algorithms:
        for mode in ["test"]:
            algorithm_path = os.path.join(path_,algorithm,mode)
            for task in os.listdir(algorithm_path):
                if task == "global":
                    task_path = os.path.join(algorithm_path,task)
                    ea = EventAccumulator(task_path).Reload()

                    tag_values = []
                    steps = []
                    for event in ea.Scalars(tag_):
                        tag_values.append(event.value)
                        steps.append(event.step)
                    if algorithm in LEGEND:
                        ax.plot(steps,tag_values,
                                linewidth=2.0,
                                marker=MARKERS[algorithm],
                                markersize=10,
                                markeredgewidth=1,
                                label=f"{LEGEND[algorithm]}",
                                linestyle=LINESTYLE[algorithm],
                                color=COLORS[algorithm])
    ax.grid(True,linewidth=2)
    ax.set_ylabel(AXE_LABELS[tag_],fontsize=50)
    ax.set_xlabel("Rounds",fontsize=50)

    ax.tick_params(axis='both',labelsize=25)
    ax.legend(fontsize=30)

    # os.makedirs(save_path,exist_ok=True)
    fig_path = os.path.join(path_,f"{FILES_NAMES[tag_]}")
    plt.savefig(fig_path,bbox_inches='tight')

if __name__ == "__main__":
    make_plot("logs/pic/beta-0.1/cifar100", "Test_Acc")
    make_plot("logs/pic/beta-0.1/cifar10", "Test_Acc")
    make_plot("logs/pic/beta-0.5/cifar100", "Test_Acc")
    make_plot("logs/pic/beta-0.5/cifar10", "Test_Acc")
    # make_plot("../logs/shakespeare", "Test/Loss")
    # make_plot("../logs/shakespeare", "Train/Metric")
    # make_plot("../logs/shakespeare", "Train/Loss")




