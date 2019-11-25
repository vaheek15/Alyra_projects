import hashlib


class MerkelTreeHash(object):

    def __init__(self):
        pass

    def findmerkelhash(self, hashes):

        blocks = []
        if not hashes:
            raise ValueError("Missing required hashes for computing the merkel tree hash")
        # first sort the hashes
        for m in sorted(hashes):
            blocks.append(m)
        list_len = len(blocks)
        # Adjust the block of hashes until we got an even nb of items in the blockcs
        # this entails appending to the end of the block, the last entry. We use modulus lath to
        # determine when we have even nb of items.
        while list_len % 2 != 0:
            blocks.extend(blocks[-1:])
            list_len = len(blocks)
        # now we have an even nb of items in the block we need to group the items in twos
        biHashs = []
        for k in [blocks[x:x + 2] for x in range(0, len(blocks), 2)]:
            hashed = hashlib.sha256()
            hashed.update((k[0] + k[1]).encode('utf-8'))
            biHashs.append(hashed.hexdigest())

            if len(biHashs) == 1:
                return biHashs[0][0:64]

            else:
                return self.findmerkelhash(biHashs)


if __name__ == '__main__':

    hs = ['a', 'b', 'c', 'd']
    hs2 = ['a', 'b', 'c', 'D']
    cls = MerkelTreeHash()
    mk1 = cls.findmerkelhash(hs)
    mk2 = cls.findmerkelhash(hs2)
    print(hs)
    print("the Merkel tree root of the  simple array is : {}".format(mk1))
    # si on change un character en hs ou hs2 le résultat du test sera False!
    print(format(mk1) == format(mk2))
