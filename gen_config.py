#! /usr/bin/python3

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-c', '--config', required=True, help="Configuration (in format XP, XE or XP-XE)")
parser.add_argument('-H', '--hyperthreaded', default=False, action='store_true', help="Set if hyperthreaded")
parser.add_argument('-o', '--output', default=None, type=str, help='Output file')
parser.add_argument('-e', '--n-ecores', required=True, help='Number of E cores', type=int)
parser.add_argument('-t', '--n-cores', required=True, help='Number of all cores', type=int)

args = parser.parse_args()

config = args.config
hyperthreaded = args.hyperthreaded
n_ecores = args.n_ecores
n_cores = args.n_cores

def parse_config(config: str):
    n_p, n_e = 0, 0

    options = config.split('-')
    if len(options) == 1:
        n = int(options[0][:-1])
        if options[0][-1] == 'P':
            n_p = n
        else:
            n_e = n
    else:
        n_p, n_e = int(options[0][:-1]), int(options[1][:-1])

    return n_p, n_e

n_p, n_e = parse_config(config)

pas = 1 if hyperthreaded else 2

p_cores = [str(i) for i in range(0, n_p*2, pas) if i < n_ecores]
e_cores = [str(i) for i in range(n_ecores, n_ecores + n_e) if i < n_cores]

cores = p_cores + e_cores
res = ','.join(cores)

if args.output is not None:
    with open(args.output, 'w') as output:
        output.write(f"cpu_config={res}")
else:
    print(res)

# # all = n_workers
# # mid = n_workers // 2 if n_workers % 2 == 0 else 0

# n_pcores = n_cores - n_ecores

# p_cores = list(range(0, n_pcores, 2))[:all]
# e_cores = list(range(n_pcores, n_cores))[:all]
# mid_cores = list(range(0, n_pcores, 2))[:mid] + list(range(n_pcores, n_cores))[:mid]

# p_conf = f"{all}P:{','.join(map(str, p_cores))}"
# e_conf = f"{all}E:{','.join(map(str, e_cores))}"
# mid_conf = f"{mid}P-{mid}E:{','.join(map(str, mid_cores))}"

# configs = [p_conf, e_conf]
# if mid != 0:
#     configs += [mid_conf]

# print(*configs)
