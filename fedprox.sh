# $7 for start round
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
--logdir=logs/fedprox/$1/beta-$5/mu-0.1-b$4-e10-np$2-$7 \
--datadir=data/
