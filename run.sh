# $1 stands for agg_weight; $2 stands for n_parties; $3 stands for dataset; $4 stands for batch_size; $5 stands for beta; $6 for sample_fraction
## fededg
python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fededg \
--sample_fraction=$6 \
--lr=0.01 \
--batch_size=$4 \
--mu=0.001 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=$5  \
--logdir=logs/sample/fededg/$1/beta-$5/mu-0.001-b$4-e10-np$2-sample_fraction-$6 \
--datadir=data/

## fedavg

python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fedavg \
--sample_fraction=$6 \
--lr=0.01 \
--batch_size=$4 \
--mu=5 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=$5  \
--logdir=logs/sample/fedavg/$1/beta-$5/mu-5-b$4-e10-np$2-sample_fraction-$6 \
--datadir=data/

## moon
python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=moon \
--sample_fraction=$6 \
--lr=0.01 \
--batch_size=$4 \
--mu=5 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=$5  \
--logdir=logs/sample/moon/$1/beta-$5/mu-5-b$4-e10-np$2-sample_fraction-$6 \
--datadir=data/

## fedprox

python main.py \
--dataset=$3 \
--model=simple-cnn \
--alg=fedprox \
--sample_fraction=$6 \
--lr=0.01 \
--batch_size=$4 \
--mu=0.1 \
--agg_weight=$1 \
--epochs=10  \
--comm_round=100  \
--n_parties=$2  \
--partition=noniid \
--beta=$5  \
--logdir=logs/sample/fedprox/$1/beta-$5/mu-0.1-b$4-e10-np$2-sample_fraction-$6 \
--datadir=data/

