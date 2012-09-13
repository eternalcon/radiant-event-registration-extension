module NavigationHelpers
  
  # Extend the standard PathMatchers with your own paths
  # to be used in your features.
  # 
  # The keys and values here may be used in your standard web steps
  # Using:
  #
  #   When I go to the "event_registration" admin page
  # 
  # would direct the request to the path you provide in the value:
  # 
  #   admin_event_registration_path
  # 
  PathMatchers = {} unless defined?(PathMatchers)
  PathMatchers.merge!({
    # /event_registration/i => 'admin_event_registration_path'
  })
  
end

World(NavigationHelpers)