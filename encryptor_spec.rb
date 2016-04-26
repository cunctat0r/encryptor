require_relative 'encryptor'

describe Encryptor do
  before do
    @e = Encryptor.new()
  end 

  it 'encrypt single letter' do
    expect(@e.encrypt('A', 13)).to eq 'N'
  end

  it 'encrypt single letter with rot 1' do
    expect(@e.encrypt('A', 1)).to eq 'B'
  end

  it 'encrypt simple sequence' do
    expect(@e.encrypt('ABCD', 13)).to eq 'NOPQ'
  end

  it 'encrypt Hello World' do
    expect(@e.encrypt('Hello World', 13)).to eq 'Uryy!-d!$yq'
  end

  it 'encrypt Hello World with rot 10' do
    expect(@e.encrypt('Hello, World!', 10)).to eq 'Rovvy6*ay!vn+'
  end

  it 'decrypt Hello World with rot 10' do
    expect(@e.decrypt('Rovvy6*ay!vn+', 10)).to eq 'Hello, World!'
  end

  it 'decrypt Hello world with rot 13' do
    expect(@e.decrypt('Uryy!-d!$yq', 13)).to eq 'Hello World'
  end

  it 'encrypt and decrypt' do
    expect(@e.decrypt(@e.encrypt('Hello, World!', 16), 16)).to eq 'Hello, World!'
  end

  it 'encrypts end decrypts file' do
    in_file = 'secret.txt'
    @e.encrypt_file(in_file, 16)
    @e.decrypt_file("#{in_file}.encrypted", 16)
    src = File.open(in_file, 'r').read
    dest = File.open("#{in_file}.decrypted", 'r').read
    expect(src).to eq dest
  end

  it 'cracks' do
    @e.crack('\\qmz&%,N&%%q#,9,Vqxx*,`uyq')
  end

end