import vim


def sum(col, fl, ll):
    b = vim.current.buffer
    result = 0.0

    for line in b[fl:ll]:
        result += float(line.split()[col - 1])
    b.append("----- RESULT: %f -----" % result, ll)
