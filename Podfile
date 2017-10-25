# Podfile
target 'CatOnCloud' do
    use_frameworks!
    
    pod 'R.swift', '~> 4.0.0'

    def testing_pods
        pod 'Quick', '1.2.0'
        pod 'Nimble', '7.0.2'
    end

    target 'CatOnCloudTests' do
        testing_pods
    end

    target 'CatOnCloudUITests' do
        testing_pods
    end

end
