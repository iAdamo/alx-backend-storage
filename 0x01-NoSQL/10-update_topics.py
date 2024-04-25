#!/usr/bin/env python3
"""pymongo client
"""


def update_topics(mongo_collection, name, topics):
    """function that changes all topics of a school document based on the name
    """
    filter = {"name": name}
    update = {"$set": {"topics": topics}}
    result = mongo_collection.update_many(filter, update)
