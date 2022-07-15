# entropy
## fededg
python main.py \
--dataset=cifar100 \
--model=simple-cnn \
--alg=fededg \
--lr=0.01 \
--batch_size=32 \
--mu=0.001 \
--agg_weight=entropy \
--epochs=10  \
--comm_round=100  \
--n_parties=100  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fededg/entropy/beta-0.1/mu-0.001-b32-e10-np100 \
--datadir=data/

## fedavg

python main.py \
--dataset=cifar100 \
--model=simple-cnn \
--alg=fedavg \
--lr=0.01 \
--batch_size=32 \
--mu=5 \
--agg_weight=entropy \
--epochs=10  \
--comm_round=100  \
--n_parties=100  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedavg/entropy/beta-0.1/mu-5-b32-e10-np100 \
--datadir=data/

## moon
python main.py \
--dataset=cifar100 \
--model=simple-cnn \
--alg=moon \
--lr=0.01 \
--batch_size=32 \
--mu=5 \
--agg_weight=entropy \
--epochs=10  \
--comm_round=100  \
--n_parties=100  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/moon/entropy/beta-0.1/mu-5-b32-e10-np100 \
--datadir=data/

## fedprox

python main.py \
--dataset=cifar100 \
--model=simple-cnn \
--alg=fedprox \
--lr=0.01 \
--batch_size=32 \
--mu=0.1 \
--agg_weight=entropy \
--epochs=10  \
--comm_round=100  \
--n_parties=100  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedprox/entropy/beta-0.1/mu-0.1-b32-e10-np100 \
--datadir=data/



