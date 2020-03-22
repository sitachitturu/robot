import xlrd
import re

"""This method is used to construct an xpath where '$' symbol in the xpath is replaced by the
string(that may be any html attribute )with the argument we supply."""
def construct_string_with_argument(xpath, arg):
    xpath = xpath.replace('$',arg)
    return xpath


def remove_commas_from_numerical_string(string_numerical):
    return string_numerical.replace(',','')


"""This method gives the sum of the values of a particular column from the excel exported.
It needs three parameters to work. """
def calculate_sum_from_excel_column(file_path, file_name, column_name):
    book = xlrd.open_workbook(file_path+file_name)
    required_sheet = book.sheet_by_index(0)
    col_headers = required_sheet.row_values(0)

    required_col_index = 0
    for i in range(len(col_headers)):
        if col_headers[i] == column_name:
            required_col_index = i

    required_col_values = required_sheet.col_values(required_col_index)
    del required_col_values[0]

    sum_of_col = 0
    for i in required_col_values:
        sum_of_col = sum_of_col+i
    return round(sum_of_col)


"""Extracts the numerical figure from the total value shown as string in the heatmap."""
def get_total_numerical_val_heatmap(string_val):
    matchobj = re.match(r'([^\s]+)', string_val)
    str_val = matchobj.group()[1:]
    return int(remove_commas_from_numerical_string(str_val))


















