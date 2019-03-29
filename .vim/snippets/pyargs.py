
import argparse


DFIN=file.txt
DOUT=out.txt

parser = argparse.ArgumentParser(description='Process some integers')
parser.add_argument('--fin',default=DFIN, help='input file')
parser.add_argument('--fout',default=DOUT, help='output file')
parser.add_argument('integers',default='1 2 3 4' metavar='N', type=int, nargs='+',
                            help='an integer for the accumulator')
args = parser.parse_args()

FILE = args.fin
OUTPUT = args.fout

print (args.output)

parser.parse_args(['--fin filetxt'.'--fout fileout.txt','1','2'])
# python prog.py 1 2 3 4 --fin file.txt --fout fileout.txt

