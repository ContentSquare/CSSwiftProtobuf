version = "1.26.0"
repo = "ContentSquare/CSSwiftProtobuf"

Pod::Spec.new do |s|
    s.name = 'CSSwiftProtobuf'
    s.version = version
    s.source = { :http => "https://github.com/#{repo}/releases/download/#{version}/package.zip", :type => 'zip' }

    s.summary = 'Vendored version of Swift Protobuf Runtime Library'
    s.homepage = 'https://github.com/apple/swift-protobuf'
    s.author = 'Apple Inc.'
    s.license = { :type => 'Apache 2.0', :file => 'LICENSE.txt' }

    s.ios.deployment_target = '12.0'
    s.osx.deployment_target = '11.0'
    s.tvos.deployment_target = '12.0'
    s.watchos.deployment_target = '5.0'

    s.requires_arc = true
    s.cocoapods_version = '>= 1.7.0'

    s.vendored_frameworks = [ 'CSSwiftProtobuf.xcframework' ]

    s.swift_versions = ['5.0']
end
