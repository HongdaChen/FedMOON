python main.py \
--dataset=cifar10 \
--model=simple-cnn \
--alg=fededg \
--lr=0.01 \
--batch_size=64 \
--mu=0.001 \
--epochs=10  \
--comm_round=100  \
--n_parties=10  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fededg/beta-0.1/mu-0.001-b64-e10-np10 \
--datadir=data/

python main.py \
--dataset=cifar10 \
--model=simple-cnn \
--alg=moon \
--lr=0.01 \
--batch_size=64 \
--mu=5 \
--epochs=10  \
--comm_round=100  \
--n_parties=10  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/moon/beta-0.1/mu-5-b64-e10-np10 \
--datadir=data/

python main.py \
--dataset=cifar10 \
--model=simple-cnn \
--alg=fedavg \
--lr=0.01 \
--batch_size=64 \
--mu=5 \
--epochs=10  \
--comm_round=100  \
--n_parties=10  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedavg/beta-0.1/mu-5-b64-e10-np10 \
--datadir=data/

python main.py \
--dataset=cifar10 \
--model=simple-cnn \
--alg=fedprox \
--lr=0.01 \
--batch_size=64 \
--mu=0.1 \
--epochs=10  \
--comm_round=100  \
--n_parties=10  \
--partition=noniid \
--beta=0.1  \
--logdir=logs/fedprox/beta-0.1/mu-0.1-b64-e10-np10 \
--datadir=data/