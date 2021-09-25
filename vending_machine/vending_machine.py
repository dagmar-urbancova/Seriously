"""Main module."""
# define imports
import pandas as pd

# define constants
d = {'item_id': [1, 2, 3],
    'item_name' :['chocolate bar','chips','sandwich'],
    'item_price' :[3, 2, 5]}

machine_items = pd.DataFrame(d)

# function to process payment inputs and outputs
def payments ():

    cash_v = input("Please specify amount you are using for payment: ")
    try:
        cash = int(cash_v)
    except:
        print('Please provide a number.')
        processed = 0
        return(processed)
    print ('You will be paying with {}$. '.format(cash))
    return_cash = cash - price

    if return_cash < 0:
        print ('You have not inserted enough cash.')
        processed = 0
        return(processed)
    else: 
        print ('Your return is {}$'.format(return_cash))
        processed = 1
        return(processed)


# main script
if __name__ == '__main__':
    print("================================= VENDING MACHINE =================================")

print(machine_items)

val = input("Please choose an item: ")
choice = machine_items.loc[machine_items['item_id'] == int(val)]
print( choice )

price = machine_items.loc[machine_items['item_id']==int(val)]['item_price'].values[0]
print ('Item price is {}$'.format(price))


processed = 0
while processed == 0:
    processed = payments()


