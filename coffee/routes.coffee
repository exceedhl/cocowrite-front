define ->
  'use strict'
  
  (match) ->
    match '', 'projects#new'

    match 'projects/:uuid', 'documents#index'
    match 'projects/:uuid/', 'documents#index'
    
    match 'projects/:uuid/:filepath', 'documents#show', name: 'showDocument'
    match 'projects/:uuid/:filepath/', 'documents#show'