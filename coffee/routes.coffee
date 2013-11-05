define ->
  'use strict'
  
  (match) ->
    match '', 'projects#new'

    match 'projects/:uuid', 'documents#index', name: 'showProject'
    match 'projects/:uuid/', 'documents#index'
    
    match 'projects/:uuid/:filepath/:format/', 'documents#show'
    match 'projects/:uuid/:filepath/:format', 'documents#show', name: 'showDocument'
