/* Function to calculate MD5 hash */
str2hash=abc5017308
call calc
exit

calc: 

  /* Write the string to a temporary file */
  tempfile = 'temp.txt'
  call lineout tempfile, str2hash

  /* Use OpenSSL to calculate MD5 hash */
  address system "openssl dgst -md5 " tempfile " > hash.txt"

  /* Read the hash result from the output */
  hashline = linein('hash.txt')
  call lineout 'hash.txt', ''  /* Clean up the file */

  /* Extract only the hash value */
  parse var hashline . '=' hashvalue
  return strip(hashvalue)