"""
This module is responsible for loading the data from files.
"""
import pandas as pd

def read_file(filepath, filename):
    data = pd.read_excel(f"{filepath}/{filename}")
    print(data)


if __name__=="__main__":
    filepath = ""
    filename = ""
    read_file(filepath, filename)