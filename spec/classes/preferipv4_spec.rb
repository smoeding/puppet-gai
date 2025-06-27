# frozen_string_literal: true

require 'spec_helper'

describe 'gai::preferipv4' do
  on_supported_os.each do |os, facts|
    context 'with default parameters' do
      let(:facts) { facts }

      it {
        is_expected.to contain_class('gai::preferipv4')

        is_expected.to contain_class('gai')
          .with_precedence(
            '::/96'         => '20',
            '2002::/16'     => '30',
            '::/0'          => '40',
            '::1/128'       => '50',
            '::ffff:0:0/96' => '100'
          )
      }
    end
  end
end
