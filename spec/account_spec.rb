require './lib/account'

describe Account do
  let(:person) { instance_double( 'person', name: 'Roberto' ) }
  # and modify our `subject`
  subject { described_class.new({owner: person}) }

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do 
    expect { described_class.new }.to raise_error 'An Account owner is required'
  end

  it 'check the lenght of a number' do
    number = 1234
    number_lenght = Math.log10(number).to_i + 1
    expect(number_lenght).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is ecpected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'is deactivates account using the Instace method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end
end