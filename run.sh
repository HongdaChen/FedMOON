# $1 stands for agg_weight; $2 stands for n_parties; $3 stands for dataset; $4 stands for batch_size
## fededg
python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fededg \
--lr=0.01 \
--batch_size=$4 \
--mu=0.001 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fededg/$1/beta-0.1/mu-0.001-b$4-e10-np$2 \
--datadir=data/

## fedavg

python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fedavg \
--lr=0.01 \
--batch_size=$4 \
--mu=5 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedavg/$1/beta-0.1/mu-5-b$4-e10-np$2 \
--datadir=data/

## moon
python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=moon \
--lr=0.01 \
--batch_size=$4 \
--mu=5 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/moon/$1/beta-0.1/mu-5-b$4-e10-np$2 \
--datadir=data/

## fedprox

python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fedprox \
--lr=0.01 \
--batch_size=$4 \
--mu=0.1 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedprox/$1/beta-0.1/mu-0.1-b$4-e10-np$2 \
--datadir=data/



