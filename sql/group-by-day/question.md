## How to use
- DATE_TRUC for rounding off datetime
- using FILTER, instead of WHERE as there is GROUP BY
*You can use WHERE even though there is GROUP BY*

There is an events table used to track different key activities taken on a website. For this task you need to filter the name field to only show "trained" events. Events should be grouped by the day they happened and counted. The description field is used to distinguish which items the events happened on.

"events" Table Schema
id
name (String)
created_at (DateTime)
description (String)
The expected results is provided so that you can see what the expected output is supposed to look like. Your "actual" output needs to match the expected output.

