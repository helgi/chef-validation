require 'spec_helper'

describe Chef::Validation::Validator do
  describe '.run' do
    context '#expand_attributes' do
      it 'works' do
        expect(described_class.run(node, glob_rules)).to be_empty
      end

      it 'fails' do
        expect(described_class.run(node, glob_rules_fail))
            .to eq({
              "cookbook/nada/*/fluff" => ["Attribute cookbook/nada/*/fluff is required but was not present."],
              "cookbook/party/no/magic" => ["Attribute cookbook/party/no/magic is required but was not present."],
              "cookbook/party/yes/magic" => ["Attribute cookbook/party/yes/magic is required but was not present."],
            })
      end
    end
  end
end
