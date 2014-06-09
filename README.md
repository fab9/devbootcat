[![Build Status](https://travis-ci.org/fab9/travis-ci.svg?branch=master)](https://travis-ci.org/fab9/devbootcat)
[![Coverage Status](https://coveralls.io/repos/fab9/devbootcat/badge.png)](https://coveralls.io/r/fab9/devbootcat)
[![Coverage Status](https://coveralls.io/repos/fab9/devbootcat/badge.png?branch=model-tests-fab9)](https://coveralls.io/r/fab9/devbootcat?branch=model-tests-fab9)

####Development Branch
[![Build Status](https://travis-ci.org/fab9/devbootcat.svg?branch=development)](https://travis-ci.org/fab9/devbootcat)
----
- [Trello board](https://trello.com/b/zlkG8OAa/devbootcat)
- ![Schema (MVP)](http://cl.ly/image/2Z3h2I3G1s2A/Image%202014-06-04%20at%204.36.23%20PM.png "")

#Questions/Things to look into
##Join table(s)
- Are they named properly? `first_table + _ + second_table`
  Both table names are plural, alphabetical order, default name can be configured

- Does it have a primary id? It shouldn't. Must suppress it with:
  `create_table :somethings_things, :id => false`

- remove timestamps
- index foreign keys to make lookups faster





