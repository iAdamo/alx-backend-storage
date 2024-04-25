#!/usr/bin/env python3
"""pymongo client
"""


def insert_school(mongo_collection, **kwargs):
    """function that inserts a new document in a collection
    """
    result = mongo_collection.insert_one(kwargs)
    if result.inserted_id:
        return result.inserted_id
    else:
        return None
