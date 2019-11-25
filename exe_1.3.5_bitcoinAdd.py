import hashlib
import os
import random, secrets



def checksum(hex_string):
    '''network ID Byte
       main network: 0x00
       Test network: 0x6f
    '''
    d = hashlib.sha256(("0x00" + hex_string).encode('utf-8'))
    d2 = hashlib.sha256()

    d.hexdigest()
    d2.update(d.hexdigest().encode('utf-8'))

    return d2.hexdigest()[:8]

'''
def doublesha256(input):
    #data = input.decode('hex_codec')
    #binascii.hexlify()
    result = hashlib.sha256(hashlib.sha256(input).digest()).digest()
    return result[:4]
'''


def ripemd160(hex_string):
    sha = hashlib.new("sha256")
    rip = hashlib.new('ripemd160')
    sha.update(hex_string.encode('utf-8'))
    rip.update(sha.hexdigest().encode('utf-8'))
    return rip.hexdigest()


def bitcoin_address(hex_string):
    add = ripemd160(hex_string) + checksum(hex_string)
    return base58(add)


def base58(address_hex):
    alphabet = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
    b58_string = ''
    # Get the number of leading zeros and convert hex to decimal
    leading_zeros = len(address_hex) - len(address_hex.lstrip('0'))
    # Convert hex to decimal
    address_int = int(address_hex, 16)
    # Append digits to the start of string
    while address_int > 0:
        digit = address_int % 58
        digit_char = alphabet[digit]
        b58_string = digit_char + b58_string
        address_int //= 58
    # Add '1' for each 2 leading zeros
    ones = leading_zeros // 2
    for one in range(ones):
        b58_string = '1' + b58_string
    return b58_string



if __name__ == "__main__":
    #private_key = ''.join(['%x' % random.randrange(16) for x in range(0, 64)])

    bits_hex = "0x04" + secrets.token_hex(32)
    print(bits_hex)
    #print(len(bits_hex))

    first = ripemd160(bits_hex)
    #print(first)
    #print(len(first))

    cksm = checksum(first)
    #print(cksm)
    #print(len(cksm))

    print("Address generated from 64 random bytes: " + bitcoin_address(bits_hex))
    #print(len(bitcoin_address(bits_hex)))
