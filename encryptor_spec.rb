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
end