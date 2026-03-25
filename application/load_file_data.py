"""
This module is responsible for loading the data from files.
"""
import pandas as pd

def load_file_data(filepath: str, filename: str):
    """
    Read the provided file and check what lists are available. Then run the _pick_sheets() 
    so the user can specify which ones need to be loaded or load the first one by default.
    """
    file = pd.ExcelFile(f"{filepath}/{filename}")
    print("File sheets: ", file.sheet_names)
    print("*"*100)
    if len(file.sheet_names) > 1:
        sheets = _pick_sheets(file.sheet_names)
    if len(file.sheet_names) == 1:
        sheets = [file.sheet_names[0]]
    else:
        sheets = file.sheet_names
    print("Picked sheets to load: ", sheets)
    print("*"*100)

    data = pd.read_excel(file, sheet_name=sheets)
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
    filepath = input("Provide the filepath to the file: ")
    filename = input("Provide the filename of the file: ")
    data = load_file_data(filepath=filepath, filename=filename)
    print("Data: ", data)
