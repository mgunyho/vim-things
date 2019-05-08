import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--silent", action = "store_true")
parser.add_argument("--repeat", type=int, default = 1)
args = parser.parse_args()

for i in range(args.repeat):
  if not args.silent:
    print("i:", i)
