# FedMOON
conference:
https://github.com/QinbinLi/MOON


- $1 stands for agg_weight; `entropy`; `loss`; `volume`; `el`; `ev`; `lv`
- $2 stands for n_parties; `10` for cifar10 ; `100` for cifar100
- $3 stands for dataset; `cifar10` or `cifar100`
- $4 stands for batch_size; `64`; `32`; `128`; `256`
- $5 stands for beta: smaller beta means more imbalanced data distribution. 0.1, 0.5, 1
- $6 stands for sample_fraction. `1`, `0.1`, `0.3`


```commandline
bash run.sh el 10 cifar10 64 0.1 1
```

```commandline
bash run.sh el 100 cifar100 32 0.1 1
```


```commandline
bash run.sh el 10 cifar10 64 0.5 1
```

```commandline
bash run.sh el 100 cifar100 32 0.5 1
```

