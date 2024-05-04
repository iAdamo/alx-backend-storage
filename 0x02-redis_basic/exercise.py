#!/usr/bin/env python3
"""Module for redis exercise
"""

import redis
import uuid
from typing import Callable, Union
from functools import wraps


def count_calls(method: Callable) -> Callable:
    """Decorator to count how many times a function is called
    """
    key = method.__qualname__

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper function
        """
        self._redis.incr(key)
        return method(self, *args, **kwargs)
    return wrapper


class Cache:
    """Cache class
    """

    def __init__(self):
        """Constructor method
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Store data in redis db
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str,
            fn: callable = None) -> Union[str, bytes, int, float]:
        """Get data from redis db
        """
        data = self._redis.get(key)
        if data is None:
            return None

        if fn:
            return fn(data)
        return data

    def get_str(self, key: str) -> str:
        """Get data from cache as string
        """
        return self.get(key, str)

    def get_int(self, key: str) -> int:
        """Get data from cache as integer
        """
        return self.get(key, int)
