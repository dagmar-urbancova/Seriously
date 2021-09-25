"""Main module."""
## Vending machine

# define imports
import pandas as pd
import sys

# from pandas.core.base import IndexError

# define constants
d = {'item_id': [1, 2, 3],
    'item_name' :['chocolate bar','chips','sandwich'],
    'item_price' :[3, 2, 5]}

machine_items = pd.DataFrame(d)

def check_val_num (value_v):
    if value_v.isnumeric() == True:
        numeric = True
    else:
        print('Please provide a number.')
        numeric = False    
    return(numeric)

def check_item_exists (value_v):
    valid = False
    try:
        choice = machine_items.loc[machine_items['item_id'] == value_v]['item_id'].values[0]
        #import pdb; pdb.set_trace()
        valid = True
    except IndexError as e:
        valid = False
        #import pdb; pdb.set_trace()
        print ('chosen item ID does not exist.')
        # print(e)
    
    return(valid)

# function to process payment inputs and outputs
def payment (price):
    return_cash = 0
    numeric = False
    while numeric is False:
        cash_v = input("Please specify amount you are using for payment: ")
        numeric = check_val_num (cash_v)
    cash = int(cash_v)

    print ('You will be paying with {}$. '.format(cash))
    return_cash = cash - price

    if return_cash < 0:
        print ('You have not inserted enough cash.')
        processed = False
    else: 
        print ('Your return is {}$'.format(return_cash))
        processed = True
    return(processed, return_cash)

# function to verify chosen item
def item_choice ():
    numeric = False
    valid = False
    while (numeric is False) or (valid is False):
        val_v = input("Please choose an item: ")
        numeric = check_val_num (val_v)
        # print('numeric: {}'.format(numeric))
        valid = check_item_exists (int(val_v))
        # print('valid: {}'.format(valid))
    return (int(val_v))






# main script
if __name__ == '__main__':
    print( 20*"=", " VENDING MACHINE ", 20*"=")

    print(machine_items)

    val = item_choice()
    choice = machine_items.loc[machine_items['item_id'] == val]
    print( choice )

    price = machine_items.loc[machine_items['item_id']==val]['item_price'].values[0]
    print ('Item price is {}$'.format(price))


    processed = False
    while processed is False:
        processed, _ = payment(price)


