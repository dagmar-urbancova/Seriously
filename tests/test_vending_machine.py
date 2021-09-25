"""Tests for `vending machine` package."""
import pytest
import unittest
import mock
import builtins

import pandas as pd
from pandas._testing import assert_frame_equal

from vending_machine.vending_machine import payment, item_choice, check_val_num, check_item_exists

# set constants
d = {'item_id': [1, 2, 3],
    'item_name' :['chocolate bar','chips','sandwich'],
    'item_price' :[3, 2, 5]}
machine_items = pd.DataFrame(d)

user_input_id_1 = '2'
user_input_id_2 = 9
user_input_text = 'blabla'
user_input_money_1 = '1'
user_input_money_2 = '5'
price_1 = 3

# test on user input - text instead of number
def test_check_val_num_text():
    tested_value = check_val_num(user_input_text)
    assert tested_value is False

#test on user input - number
def test_check_val_num_num():
    tested_value = check_val_num(user_input_id_1)
    assert tested_value is True

# test on user inserting lower amount
def test_payment_lower(monkeypatch):
    # monkeypatch.setattr('sys.stdin', "1")
    with mock.patch.object(builtins, 'input', lambda _: user_input_money_1):
        processed, money_returned = payment(price_1)
        assert processed == False


# test on user inserting higher amount
def test_payment_higher(monkeypatch):
    # monkeypatch.setattr('sys.stdin', "1")
    with mock.patch.object(builtins, 'input', lambda _: user_input_money_2):
        processed, money_returned = payment(price_1)
        assert processed == True
        assert money_returned == 2

