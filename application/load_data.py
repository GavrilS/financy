"""
This module is responsible for loading the data from files.
"""
import pandas as pd

def _read_file(filepath, filename):
    data = pd.read_excel(f"{filepath}/{filename}")
    print(data)
    return data

def _pick_sheets(sheets: list[str]) -> list[str]:
    """
    Ask the user which sheets they want to open. In this itteration this is done in the 
    console.
    """
    sheets_to_read = []
    if not sheets or not isinstance(sheets, list):
        print(f"No sheets were provided or the provided data type is wrong! Only the first sheet in the workbook will be opened!")
        print("*"*100)
        return sheets_to_read
    else:
        for item in sheets:
            user_input = input(f"Do you want to read the following sheet {item}?(yes,no): ")
            if "yes" in user_input:
                sheets_to_read.append(item)
    
    return sheets_to_read


if __name__=="__main__":
    filepath = ""
    filename = ""
    # read_file(filepath, filename)