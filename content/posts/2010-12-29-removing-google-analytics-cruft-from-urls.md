---
author: adrian
comments: true
date: 2010-12-29 04:40:22+00:00
layout: post
slug: removing-google-analytics-cruft-from-urls
title: Removing Google Analytics cruft from urls
wordpress_id: 355
categories:
    - work
tags:
    - building an app
    - php
    - regular expression
    - twitter
---

So I have decided to be productive over the Christmas break and continue work on my super secret, somewhat stalled twitter app. So apparently I am also going to blog about it here.

**Warning:** nerdery ahead, no cat photos.

## The Problem

Today, I have begun work on a part of the application that processes the url's posted within tweets and attempts to normalise them as much as possible. By normalising them, I mean expanding short urls, such as bit.ly links and also removing certain pieces of tracking code within the url itself. The main culprit I have come across so far has been the tracking code inserted as part of Google Analytics campaigns.

It is a very common pattern to see in urls, and looks very similar to:

    ?utm_source=twitter&utm_medium=social&utm_campaign=Our+vain+attempt+to+track+you

## Why is this a problem?

If someone posts a link without the google tracking code and then an automated tool, such as twitterfeed or similar posts a shortened link with google tracking code inserted, I want my application to see that they both point to a single url.

The easiest way I can see to do this, is to remove the google tracking code. So I need to employ everyone's favourite hammer, regular expressions.

## The Solution

I took a selection of 500 url's containing google tracking code and looked for the common factors in the urls. My first attempt at matching the tracking code involved looking at the various parameters in order and matching their possible values. The regex pattern came out like this:

    /(?)utm_source=[^rn]+&utm_medium=[^rn]+&utm_campaign=[^rn]+/

I ran a preg_replace against the 500 urls and found that it worked as expected about 95% of the time. Issues came from url's that were missing the utm_campaign parameter and url's where the parameters were in a different order to the majority of the urls.

How to solve this issue? The obvious change to the regex was to match the parameters of the tracking code individually and then the order or the lack of a parameter wouldn't affect the matching. I came up with the following regex to achieve this:

    /((?)?(&)?utm_source=[^&]+|(?)?(&)?utm_medium=[^&]+|(?)?(&)?utm_campaign=[^&]+)/

This worked a lot better and had numerous improvements. However, it seemed far too verbose and lead to me discovering a fourth parameter in google tracking code, utm_content.

## Refactoring

Hmmmm, should I get even more verbose or can I refactor? Refactoring is always my preferred answer.

I find that when I need to refactor code, the best starting point is always to look at what you are trying to do again and work out if you understand the problem as well as you could. In this case, the problem I started with was that I had a specific list of parameters, in a specific order that I wanted to get rid of from a url.

I had already worked out that they cannot be in order and now I was looking for each parameter individually and each parameter begins with "utm_"...

There we go, we have the catalyst for refactoring, lets adjust the regex to match any parameter that begins with "utm_"

## The Finished Solution?

Adjusting the regex to match any parameter starting with utm_ was just a case of replacing the name part of the parameter with a pattern to match repeating lowercase letters and removing the redundant parts of the rest of the pattern.

    /(?|&)?utm_[a-z]+=[^&]+/

I tested this against the 500 urls and it worked 100% of the time.

Bingo, a short and concise regular expression to strip out Google Analytics tracking code from urls.

[See it in use here.](https://gist.github.com/758177)

## A Disclaimer...

This was tested with PHP's preg_replace function, mileage in other environments will vary.

You can see how it is used [here](https://gist.github.com/758177).

I am terrible at regular expressions compared to some. I welcome all and any suggestions or feedback via the comments or [via email](mailto:navitronic@gmail.com).

<!-- TODO -->
