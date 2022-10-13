
from deephaven import time_table, empty_table
from deephaven.table import Table

def get_tt() -> Table:
    return time_table("00:00:01").update("X = ii")

def get_et() -> Table:
    return empty_table(100).update("X = ii")