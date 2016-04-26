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
end