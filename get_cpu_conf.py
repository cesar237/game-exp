#! /usr/bin/python3

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-n', '--n-workers', required=True, help='Number of Workers', type=int)
parser.add_argument('-e', '--n-ecores', required=True, help='Number of E cores', type=int)
parser.add_argument('-t', '--n-cores', required=True, help='Number of all cores', type=int)

args = parser.parse_args()

n_workers = args.n_workers
n_ecores = args.n_ecores
n_cores = args.n_cores


all = n_workers
mid = n_workers // 2 if n_workers % 2 == 0 else 0

n_pcores = n_cores - n_ecores

p_cores = list(range(0, n_pcores, 2))[:all]
e_cores = list(range(n_pcores, n_cores))[:all]
mid_cores = list(range(0, n_pcores, 2))[:mid] + list(range(n_pcores, n_cores))[:mid]

p_conf = f"{all}P:{','.join(map(str, p_cores))}"
e_conf = f"{all}E:{','.join(map(str, e_cores))}"
mid_conf = f"{mid}P-{mid}E:{','.join(map(str, mid_cores))}"

configs = [p_conf, e_conf]
if mid != 0:
    configs += [mid_conf]

print(*configs)
