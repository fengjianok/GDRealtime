Pod::Spec.new do |s|
  s.name         = "GDRealtime"
  s.version      = "0.0.1"
  s.summary      = "Goodow Realtime provides collaborative objects, events, and methods for creating collaborative applications via the use of operational transforms."
  s.homepage     = "https://github.com/goodow/realtime"
  s.author       = { "Larry Tin" => "dev@goodow.com" }
  s.source       = { :git => "https://github.com/goodow/realtime.git", :tag => "v#{s.version}" }

  s.default_subspec = 'default'
  s.header_mappings_dir = 'Classes/generated/include'
#  s.preserve_paths = 'Classes/generated/include'
  s.resources = 'Resources/**'
  s.requires_arc = true

#  s.xcconfig = { 'HEADER_SEARCH_PATHS' => \
#    '"${PODS_ROOT}/GDRealtime/Classes/generated" "${PODS_ROOT}/GDRealtime/Classes/test_generated"' }

  s.subspec 'default' do |d|
    d.dependency 'jre_emul', '~> 0.7.2'
    d.dependency 'GDRealtime/common'
    d.dependency 'GDRealtime/generated'
    d.dependency 'Google-API-Client/Common'
    d.dependency 'Google-API-Client/Objects'
    d.dependency 'Google-API-Client/Utilities'
  end

  s.subspec 'common' do |common|
    common.source_files = 'Classes/common/**/*.{h,m}', 'Classes/generated/include/**/*.h'

    common.dependency 'Google-Diff-Match-Patch', '~> 0.0.1'
  end

  s.subspec 'generated' do |gen|
    gen.subspec 'elemental' do |elemental|
      elemental.source_files = 'Classes/generated/elemental/**/*.m'
      elemental.requires_arc = false
    end

    gen.subspec 'model' do |model|
      model.source_files = 'Classes/generated/model/**/*.m'
      model.subspec 'op' do |op|
        op.source_files = 'Classes/generated/operation/**/*.m'
        op.requires_arc = false
      end
    end

    gen.subspec 'channel' do |channel|
      channel.source_files = 'Classes/generated/channel/**/*.m'
    end
  end

  s.subspec 'test' do |test|
    # test.source_files = 'Classes/test_generated/**/*.{h,m}'

    test.dependency 'GDRealtime/common'
    test.dependency 'GDRealtime/generated'

    test.xcconfig = { 'HEADER_SEARCH_PATHS' => \
      '"${PODS_ROOT}/jre_emul/dist/include" "${PODS_ROOT}/jre_emul/jre_emul/icu4c/i18n/include" "${PODS_ROOT}/jre_emul/jre_emul/icu4c/common"' }
  end

end
