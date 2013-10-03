define ->
  'use strict'
  
  (match) ->
    match '', 'projects#new'

    match 'projects/:uuid', 'projects#show'
    match 'projects/:uuid/', 'projects#show'
    
    match 'projects/:uuid/:filepath', 'documents#show', name: 'showDocument'
    match 'projects/:uuid/:filepath/', 'documents#show'