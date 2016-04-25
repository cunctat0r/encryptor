require_relative 'encryptor'

describe Encryptor do
  before do
    @e = Encryptor.new()
  end 

  it 'encrypt single letter' do
	expect(@e.encrypt('A')).to eq 'n'
  end

  it 'encrypt simple sequence' do
	expect(@e.encrypt('ABCD')).to eq 'nopq'
  end

  it 'encrypt secrets' do
    expect(@e.encrypt('Secrets')).to eq 'frpergf'
  end

  it 'decrypt secrets' do
    expect(@e.decrypt('frpergf')).to eq 'secrets'
  end
end