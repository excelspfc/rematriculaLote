import gui
import subprocess
from variaveis_pastas import arquivo_ahk

def main():
    subprocess.Popen([arquivo_ahk], shell=True).wait()
    
if __name__ == '__main__':
    main()