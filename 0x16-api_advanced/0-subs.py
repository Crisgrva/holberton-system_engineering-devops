#!/usr/bin/python3
"""
0. How many subs?
"""
import requests
import json


def number_of_subscribers(subreddit):
    """
    function that queries the Reddit API
    and returns the number of subscribers
    (not active users, total subscribers)
    for a given subreddit. If an invalid
    subreddit is given, the function should
    return 0."""

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {"User-Agent":
               "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0)\
                    Gecko/20100101 Firefox/47.0"}

    res = requests.get(url, headers=headers).json()
    try:
        return res['data']['subscribers']
    except Exception:
        return 0
