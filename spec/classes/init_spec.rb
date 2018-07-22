require 'spec_helper'

describe 'gai' do
  context 'with default parameters' do
    it {
      is_expected.to contain_class('gai')
        .with('label'      => {},
              'precedence' => {},
              'scopev4'    => {},
              'reload'     => nil)

      is_expected.to contain_file('/etc/gai.conf')
        .with_ensure('file')
        .with_owner('root')
        .with_group('root')
        .with_mode('0644')
        .without_content(%r{^label })
        .without_content(%r{^precedence })
        .without_content(%r{^scopev4 })
        .without_content(%r{^reload })
    }
  end

  context 'with valid parameter label' do
    let :params do
      { label: { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      is_expected.to contain_file('/etc/gai.conf')
        .with_content(%r{^label\s+::ffff:127.0.0.0.0\s+10$})
    }
  end

  context 'with valid parameter precedence' do
    let :params do
      { precedence: { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      is_expected.to contain_file('/etc/gai.conf')
        .with_content(%r{^precedence\s+::ffff:127.0.0.0.0\s+10$})
    }
  end

  context 'with valid parameter scopev4' do
    let :params do
      { scopev4: { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      is_expected.to contain_file('/etc/gai.conf')
        .with_content(%r{^scopev4\s+::ffff:127.0.0.0.0\s+10$})
    }
  end

  context 'with parameter reload => yes' do
    let :params do
      { reload: 'yes' }
    end

    it {
      is_expected.to contain_file('/etc/gai.conf')
        .with_content(%r{^reload\s+yes$})
    }
  end

  context 'with parameter reload => no' do
    let :params do
      { reload: 'no' }
    end

    it {
      is_expected.to contain_file('/etc/gai.conf')
        .with_content(%r{^reload\s+no$})
    }
  end
end
