
# Solution

url: https://rdot.org/forum/showthread.php?p=32075#post32075

As these messages say, the encryption is double AES-ECB with two different keys with first 232 bits equal 0. A straitforward bruteforce is too long (6 bytes entropy).
An efficient solution is Meet-In-The-Middle attack -- first build a table of all possible encryptions of plaintext, then decrypt the ciphertext with all possible keys and look the decryption up in the table.

    >>> flag='s5hd0ThTkv1U44r9aRyUhaX5qJe561MZ16071nlvM9U='.decode('base64')
    >>> key1='0000000000000000000000000000000000000000000000000000000000ff3f45'.decode('hex')
    >>> key2='00000000000000000000000000000000000000000000000000000000009ae807'.decode('hex')
    >>> cipher1 = AES.new(key1, AES.MODE_ECB)
    >>> cipher2 = AES.new(key2, AES.MODE_ECB)
    >>> cipher2.decrypt(cipher1.decrypt(flag))
    "This time I didn't include sol'n"
