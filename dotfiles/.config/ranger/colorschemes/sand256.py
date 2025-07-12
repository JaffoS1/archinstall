from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class sand256(ColorScheme):
    progress_bar_color = 179

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.directory:
                fg = 179
            elif context.marked:
                fg = 124
            elif context.link:
                fg = 110

            if context.selected:
                attr |= reverse
                return fg, bg, attr

        return fg, bg, attr
