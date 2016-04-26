class Encryptor
  def cipher(rot)
    init = (' '..'z').to_a
    rotated = init.rotate(rot)
    Hash[init.zip(rotated)]
  end

  def encrypt(message, rotation)
    message.chars.map { |chr| cipher(rotation)[chr] }.join('')
  end

  def decrypt(message, rotation)
    total_chars = cipher(rotation).keys.length
    message.chars.map { |chr| cipher(total_chars - rotation)[chr] }.join('')
  end

  def encrypt_file(file_name, rot)
    input = File.open(file_name, 'r')
    output = File.open("#{file_name}.encrypted", 'w')
    line =  input.read
    output.write(encrypt(line, rot))    
    input.close
    output.close
  end

  def decrypt_file(file_name, rot)
    input = File.open(file_name, 'r')
    output = File.open(file_name.gsub('encrypted', 'decrypted'), 'w')
    line =  input.read
    output.write(decrypt(line, rot))
    input.close
    output.close
  end
end