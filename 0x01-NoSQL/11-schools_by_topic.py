#!/usr/bin/env python3
"""pymongo client
"""


def schools_by_topic(mongo_collection, topic):
    """function that returns the list of school having a specific topic
    """
    filter = {"topics": {"$in": [topic]}}
    schools = list(mongo_collection.find(filter))
    return schools

# result = mongo_collection.find()
#    schools = []
#    for doc in result:
#        doc = dict(doc)
#        topics = doc.get("topics")
#        if topics and topic in topics:
#            schools.append(doc)
#    return schools
