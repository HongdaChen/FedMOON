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
    "FedEdg": "FedEdg",
    "moon": "MOON",
    "fedprox": "FedProx"
}

MARKERS = {
    "local": "x",
    "clustered": "s",
    "fedavg": "*",
    "FedEM": "h",
    "FedEdg": "d",
    "moon": "4",
    "personalized": "X",
    "DEM": "|",
    "fedprox": "p"
}

COLORS = {
    "local": "blue",
    "clustered": "orange",
    "fedavg": "green",
    "FedEM": "c",
    "FedEdg": "purple",
    "moon": "red",
    "personalized": "brown",
    "DEM": "pink",
    "fedprox": "cyan"
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
    make_plot("logs/cifar10", "Test_Acc")
    # make_plot("../logs/shakespeare", "Test/Loss")
    # make_plot("../logs/shakespeare", "Train/Metric")
    # make_plot("../logs/shakespeare", "Train/Loss")




