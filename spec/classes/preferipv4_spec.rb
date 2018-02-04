require 'spec_helper'

describe 'gai::preferipv4' do
  it {
    is_expected.to contain_class('gai::preferipv4')

    is_expected.to contain_class('gai').with(
                     'precedence' => {
                       '::/96'         => '20',
                       '2002::/16'     => '30',
                       '::/0'          => '40',
                       '::1/128'       => '50',
                       '::ffff:0:0/96' => '100'
                     }
                   )
  }
end
