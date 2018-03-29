import vim

class TextGenerator(object):

    def __init__(self):
        self.tpl = ""

    def set_template(self, fl, ll):
        self.tpl = "\n".join(vim.current.buffer[fl:ll])

    def unset_template(self):
        self.tpl = ""

    def format(self, fl, ll):
        b = vim.current.buffer
        data = b[fl:ll]
        if not self.tpl:
            self.tpl = b[fl - 1]
        for d in data:
            b.append((self.tpl.format(*tuple(d.split()))).splitlines(), ll)

def sum(col, fl, ll):
    b = vim.current.buffer
    result = 0.0
    for line in b[fl:ll]:
        result += float(line.split()[col - 1])
    b.append('----- RESULT: %f -----' % result, ll) 
