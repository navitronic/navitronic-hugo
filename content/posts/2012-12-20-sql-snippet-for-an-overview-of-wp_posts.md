---
author: adrian
comments: true
date: 2012-12-20 22:52:17+00:00
layout: post
slug: sql-snippet-for-an-overview-of-wp_posts
title: SQL snippet for an overview of wp_posts
wordpress_id: 115
categories:
    - miscellaneous
post_format:
    - Aside
tags:
    - snippet
    - SQL
    - WordPress
---

SQL snippet to get an overview of the types of content in your `wp_posts` table.

```sql
SELECT post_type, COUNT(*) AS total
FROM wp_posts GROUP BY post_type;
```

<!-- TODO -->
