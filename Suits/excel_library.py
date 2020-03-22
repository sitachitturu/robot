import re
from cmath import e

7/10/2017
212613237
import xlrd
# import numpy as np

# Given a file and column index, returns a list of values in the column of the file (excludes the first row of headers)
def get_excel_column_values(file_name, col):
    book = xlrd.open_workbook(file_name)
    required_sheet = book.sheet_by_index(0)
    col_headers = required_sheet.row_values(0)
    required_col_index = 0
    for i in range(len(col_headers)):
        if col_headers[i] == col:
            required_col_index = i

    values = []
    for rx in range(1, required_sheet.nrows):
        values.append(required_sheet.cell_value(rowx=rx, colx=required_col_index))
    return values


# Given a list of values, this strips the $ and , symbols and returns the sum
def sum_list(nums):
    valsum = 0.0
    print("one one one one", nums)

    try:
        sum_nums = sum(nums)
        # assert isinstance(sum_nums, object)
        return sum_nums
    except:
        print("Could not sum nums")

    for x in nums:
        if isinstance(x, float):
            print "IT's AFLOAT"
            valsum += x

    return valsum


# Given an excel filename and column index, this definition will return the sum of the values in the column
def get_excel_column_sum(file_name, col):
    values = get_excel_column_values(file_name, col)
    sum = sum_list(values)
    return sum


def round_to_multiple(number, multiple):
        return int(multiple * round(float(number) / multiple))


# Given an index of a row, returns the column headers for that row in the form of a list
def get_excel_row_values(file_name, row):
    book = xlrd.open_workbook(file_name)
    sh = book.sheet_by_index(0)
    values = []
    for cx in range(0, sh.ncols):
        values.append(sh.cell_value(rowx=int(row), colx=cx))
    return values

# Given an excel file name, returns the number of rows in the file
def get_excel_num_of_rows(file_name):
    book = xlrd.open_workbook(file_name)
    sh = book.sheet_by_index(0)
    return sh.nrows

# Given an excel file name, returns the number of cols in the file
def get_excel_num_of_cols(file_name):
    book = xlrd.open_workbook(file_name)
    sh = book.sheet_by_index(0)
    return sh.ncols