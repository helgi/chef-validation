def node
  {
    'cookbook' => {
      'fun' => {
        'stuff' => 'value',
        'stuff2' => [
          'secret',
          'production',
        ],
      },
      'timeout' => 200,
      'memory' => {
        'min' => 1024,
        'max' => 2048
      },
      'tags' => [
        'production',
        'secret'
      ],
      'works' => false,
      'simba' => :foo,
      'party' => {
        'yes' => {
          'party' => true,
          'work'  => false,
          'things' => {
            'wooo' => {
              'stuff' => true
            }
          }
        },
        'no' => {
          'party' => false,
          'work'  => true
        }
      },
      'volumes' => [
        {
          'user' => 'ubuntu',
          'device' => '/dev/sdm',
          'mount' => '/data'
        },
        {
          'mode' => '777',
          'device' => '/dev/sdo',
          'mount' => '/db'
        }
      ]
    }
  }
end


def glob_rules
  {
    'cookbook/party/*/party' => {
      'type' => 'boolean'
    },
    'cookbook/party/*/work' => {
      'type' => 'boolean'
    },
    'cookbook/party/*/things/*/stuff' => {
      'type' => 'boolean'
    },
    # Should not match anything and not fail
    'cookbook/party/*/things/*/non-existent' => {
      'type' => 'boolean'
    },
    # Should not match anything but should not raise since "nada" is optional
    'cookbook/nada/*/fluff' => {
      'type' => 'numeric',
      'required' => true
    },
  }
end

def glob_rules_fail
  glob_rules.merge({
    # magic isn't mention but we should be resolving that
    'cookbook/party/*/magic' => {
      'type' => 'numeric',
      'required' => true
    },
  })
end

def glob_volumes_rules
  {
    'cookbook/volumes/*/mount' => {
      'type' => 'string',
      'required' => true,
    },
    'cookbook/volumes/*/device' => {
      'type' => 'string',
      'required' => true,
    }
  }
end

def recipes
  [
    'config',
    'foo',
  ]
end
