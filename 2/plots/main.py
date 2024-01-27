import matplotlib.pyplot as plt


title = "2022CS11290 n=30"

cycles = [131, 341, 130]

part_names = ['Tail Recursive', 'Recursive', 'Iterative']

plt.bar(part_names, cycles)
plt.title(title)
plt.savefig("n=30.png")
plt.show()
