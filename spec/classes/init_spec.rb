require 'spec_helper'

describe 'gai' do
  context 'with default parameters' do
    it {
      should contain_class('gai').with(
               'label'      => {},
               'precedence' => {},
               'scopev4'    => {},
               'reload'     => nil,
             )

      should contain_file('/etc/gai.conf').with(
               'ensure' => 'file',
               'owner'  => 'root',
               'group'  => 'root',
               'mode'   => '0644',
             )
    }
  end

  context 'with parameter label' do
    let :params do
      { :label => { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      should contain_file('/etc/gai.conf') \
              .with_content(/^label +::ffff:127.0.0.0.0 +10/)
    }
  end

  context 'with parameter precedence' do
    let :params do
      { :precedence => { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      should contain_file('/etc/gai.conf') \
              .with_content(/^precedence +::ffff:127.0.0.0.0 +10/)
    }
  end

  context 'with parameter scopev4' do
    let :params do
      { :scopev4 => { '::ffff:127.0.0.0.0' => '10' } }
    end

    it {
      should contain_file('/etc/gai.conf') \
              .with_content(/^scopev4 +::ffff:127.0.0.0.0 +10/)
    }
  end

  context 'with parameter reload=yes' do
    let :params do
      { :reload => 'yes' }
    end

    it {
      should contain_file('/etc/gai.conf') \
              .with_content(/^reload +yes/)
    }
  end
end
