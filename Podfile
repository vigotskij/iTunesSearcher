# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

target 'iTunesSearcher' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!
  dynamic_frameworks = []
  # Make all the other frameworks into static frameworks by overriding the static_framework? function to return true
  pre_install do |installer|
    installer.pod_targets.each do |pod|
      if !dynamic_frameworks.include?(pod.name)
        puts "Overriding the static_framework? method for #{pod.name}"
        def pod.static_framework?;
          true
        end
      end
    end
  end

  # Pods for iTunesSearcher
  pod 'SwiftfulCache'

  target 'iTunesSearcherTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
