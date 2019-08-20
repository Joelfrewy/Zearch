# Zearch


## Usage

```
bundle install
ruby bin/zearch.rb
```

## Example Output

```
--------------------------------------------------------------------------------
Welcome to Zearch! Begin searching or type exit to quit
--------------------------------------------------------------------------------

>>> choose an entity: e.g. users, organizations, tickets 
users
>>> choose an attribute: e.g. _id, url, external_id, name, alias , ...
_id
>>> choose a value: e.g. 1, 2, 3, 4, 5 , ...
1

--------------------------------------------------------------------------------
found 1 result in users where _id is 1
--------------------------------------------------------------------------------

_id:                 1
url:                 http://initech.zendesk.com/api/v2/users/1.json
external_id:         74341f74-9c79-49d5-9611-87ef9b6eb75f
name:                Francisca Rasmussen
alias:               Miss Coffey
created_at:          15-Apr-2016, 05:19 am
active:              true
verified:            true
shared:              false
locale:              en-AU
timezone:            Sri Lanka
last_login_at:       04-Aug-2013, 01:03 am
email:               coffeyrasmussen@flotonic.com
phone:               8335-422-718
signature:           Don't Worry Be Happy!
organization:        Multron
tags:                Springville, Sutton, Hartsville/Hartley, Diaperville
suspended:           true
role:                admin
```

## Testing

```
rspec
```

## Design Decisions

- the data is pre loaded based on the assumption:
```
You can assume all data can fit into memory on a single machine.
```
- for reduced time complexity, the data is preloaded and indexed by attribute value for O(1) lookup of entity id's:
```
search response times should not increase linearly asthe number of documents grows.
```
- search is exact string match, case sensitive:
```
full value matching is fine
```
- nested search only shows most relevant attribute e.g. organization name:
```
Where the data exists, values from any related entities should be included in the results
```