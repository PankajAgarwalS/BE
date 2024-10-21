class Node:
    def __init__(self, freq=0, symbol='', left=None, right=None, is_leaf=False):
        self.freq = freq
        self.symbol = symbol
        self.left = left
        self.right = right
        self.is_leaf = is_leaf

    def create_leaf(self, symbol, freq):
        self.is_leaf = True
        self.symbol = symbol
        self.freq = freq

    def create_node(self, freq, left, right):
        self.freq = freq
        self.left = left
        self.right = right

def insert_node(arr, node):
    arr.append(node)
    return sorted(arr, key=lambda x: x.freq)

def generate_huffman(node, code, code_map):
    if node.is_leaf:
        code_map[node.symbol] = code
    else:
        generate_huffman(node.left, code + '0', code_map)
        generate_huffman(node.right, code + '1', code_map)

def main():
    s = input("Enter the string: ")
    freq_map = {i: s.count(i) for i in set(s)}
    print("Frequency:", freq_map)
    
    nodes = [Node().create_leaf(sym, freq) or Node(freq, sym) for sym, freq in freq_map.items()]
    while len(nodes) > 1:
        n1, n2 = nodes.pop(0), nodes.pop(0)
        new_node = Node(n1.freq + n2.freq, left=n1, right=n2)
        nodes = insert_node(nodes, new_node)
    
    code_map = {}
    generate_huffman(nodes[0], '', code_map)
    
    print("Huffman Codes:", code_map)
    encoded_string = ''.join(code_map[i] + ' ' for i in s)
    print("Encoded String:", encoded_string)

main()
