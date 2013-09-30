define ->
  'use strict'
  
  (match) ->
    match '', 'projects#new'
    match 'projects/:uuid', 'projects#show'