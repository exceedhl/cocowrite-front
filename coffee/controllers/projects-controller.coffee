define [
  'chaplin',
  'models/repos',
  'models/projects',
  'views/repos-view',
  'views/new-project-view',
  'views/project-list-view',
  'views/spinner-view',
  'controllers/base/controller'
], (Chaplin, Repos, Projects, ReposView, NewProjectView, ProjectListView, SpinnerView, Controller) ->

  class ProjectsController extends Controller
  
    new: (params) ->
      @newProjectView = new NewProjectView container: 'body'
      spinner = new SpinnerView
        container: '.repo-list .spinner'
        type: 'refresh'
        text: 'Loading github repos ...'
      @repos = new Repos()
      @repos.fetch().done =>
        @reposView = new ReposView
          container: '.repo-list'
          collection: @repos
      .always (res) =>
        spinner.dispose()
      @projects = new Projects()
      @projects.fetch().done =>
        @projectListView = new ProjectListView container: '.project-list', collection: @projects
      
      
