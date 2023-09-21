import Tkinter
import traceback
import os
import __main__

class ToontownInjector(object):

    def __init__(self):
        self.firstTick = True
        self.loading = None
        self.root = Tkinter.Tk()
        title = 'Toontown Injector'
        self.root.title(title)

        f = Tkinter.Frame(self.root)
        f.pack()

        xscrollbar = Tkinter.Scrollbar(f, orient=Tkinter.HORIZONTAL)
        xscrollbar.grid(row=1, column=0, sticky=Tkinter.N + Tkinter.S + Tkinter.E + Tkinter.W)

        yscrollbar = Tkinter.Scrollbar(f)
        yscrollbar.grid(row=0, column=1, sticky=Tkinter.N + Tkinter.S + Tkinter.E + Tkinter.W)

        self.text = Tkinter.Text(f, wrap=Tkinter.NONE,
                                 xscrollcommand=xscrollbar.set,
                                 yscrollcommand=yscrollbar.set)
        self.text.bind("<Control-Key-a>", self.select_all)
        self.text.bind("<Control-Key-A>", self.select_all)
        self.text.grid(row=0, column=0)

        xscrollbar.config(command=self.text.xview)
        yscrollbar.config(command=self.text.yview)

        self.button = Tkinter.Button(self.root, text='Inject', command=self.pressed)
        self.button.pack()

    def select_all(self, event):
        self.text.tag_add(Tkinter.SEL, "1.0", Tkinter.END)
        self.text.mark_set(Tkinter.INSERT, "1.0")
        self.text.see(Tkinter.INSERT)
        return 'break'

    def pressed(self):
        # exec injection in __main__.__dict__
        try:
            contents = self.text.get(1.0, Tkinter.END)
            exec(contents,globals(),locals())
        except Exception, err:
            print(traceback.format_exc())

    def loadScripts(self):
        if not os.path.exists('mods'):
            os.makedirs('mods')
        for scriptName in os.listdir('mods'):
            split = scriptName.split('.')
            if len(split) > 1:
                try:
                    execfile('mods/' + scriptName, globals())
                except Exception, err:
                    print(traceback.format_exc())
        self.firstTick = False

    def tick(self, task):
        if self.firstTick:
            self.loadScripts()
            self.firstTick = False
        else:
            self.root.update()
        return task.cont