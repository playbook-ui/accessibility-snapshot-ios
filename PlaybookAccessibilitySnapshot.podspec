Pod::Spec.new do |spec|
    spec.name = 'PlaybookAccessibilitySnapshot'
    spec.version  = `cat .version`
    spec.authors = { 'jiayi-zhou' => 'jiayi.zhou98@gmail.com', 'ra1028' => 'r.fe51028.r@gmail.com' }
    spec.homepage = 'https://github.com/playbook-ui/accessibility-snapshot-ios'
    spec.documentation_url = 'https://playbook-ui.github.io/accessibility-snapshot-ios'
    spec.summary = 'A library for generating snapshot images of components managed by Playbook with accessibility labels.'
    spec.source = { :git => 'https://github.com/playbook-ui/accessibility-snapshot-ios.git', :tag => spec.version.to_s }
    spec.license = { :type => 'Apache 2.0', :file => 'LICENSE' }

    spec.requires_arc = true
    spec.swift_versions = '5.3'
    spec.ios.deployment_target = '14.2'
    spec.ios.source_files = 'Sources/**/*.swift'
    spec.ios.frameworks = 'XCTest'
    spec.dependency 'PlaybookSnapshot', "~> 0.2.1"
    spec.dependency 'AccessibilitySnapshot/Core', "~> 0.4.1"

    spec.pod_target_xcconfig = {
        'APPLICATION_EXTENSION_API_ONLY' => 'NO',
        'ENABLE_BITCODE' => 'NO'
    }
    spec.user_target_xcconfig = {
        'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"'
    }
end
