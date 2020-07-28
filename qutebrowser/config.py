c.aliases = {'w': 'session-save', 'q': 'close', 'wq': 'quit --save'}

c.auto_save.interval = 15000

c.auto_save.session = True

c.backend = 'webengine'

c.colors.prompts.border = '1px solid gray'

c.colors.webpage.prefers_color_scheme_dark = True

c.completion.cmd_history_max_items = 100

c.completion.delay = 0

c.completion.height = '30%'

c.completion.min_chars = 3

c.completion.open_categories = ['searchengines', 'bookmarks', 'history']

c.completion.quick = True

c.completion.scrollbar.padding = 0

c.completion.scrollbar.width = 8

c.completion.show = 'always'

c.completion.shrink = True

c.completion.timestamp_format = '%Y-%m-%d'

c.completion.use_best_match = False

c.completion.web_history.exclude = []

c.completion.web_history.max_items = -1

c.confirm_quit = ['downloads']

c.content.autoplay = True

c.content.cache.appcache = True

c.content.cache.maximum_pages = 0

c.content.cache.size = None

c.content.canvas_reading = True

c.content.cookies.accept = 'all'

c.content.cookies.store = True

c.content.default_encoding = 'utf-8'

c.content.desktop_capture = 'ask'

c.content.dns_prefetch = False

c.content.frame_flattening = False

c.content.geolocation = 'ask'

c.content.headers.accept_language = 'en-US,en;q=0.9'

c.content.headers.custom = {}

c.content.headers.do_not_track = True

c.content.headers.referer = 'same-domain'

c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'

c.content.host_blocking.enabled = True

c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']

c.content.host_blocking.whitelist = []

c.content.hyperlink_auditing = False

c.content.images = True

c.content.javascript.alert = True

c.content.javascript.can_access_clipboard = False

c.content.javascript.can_close_tabs = True

c.content.javascript.can_open_tabs_automatically = False

c.content.javascript.enabled = True

c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}

c.content.javascript.modal_dialog = False

c.content.javascript.prompt = True

c.content.local_content_can_access_file_urls = True

c.content.local_content_can_access_remote_urls = False

c.content.local_storage = True

c.content.media_capture = 'ask'

c.content.mouse_lock = 'ask'

c.content.mute = False

c.content.netrc_file = None

c.content.notifications = 'ask'

c.content.pdfjs = False

c.content.persistent_storage = 'ask'

c.content.plugins = False

c.content.print_element_backgrounds = True

c.content.private_browsing = False

c.content.proxy = 'system'

c.content.proxy_dns_requests = True

c.content.register_protocol_handler = 'ask'

c.content.site_specific_quirks = True

c.content.ssl_strict = 'ask'

c.content.user_stylesheets = []

c.content.webgl = True

c.content.webrtc_ip_handling_policy = 'all-interfaces'

c.content.fullscreen.window = True

c.content.xss_auditing = False

c.downloads.location.directory = '/home/amir/Downloads'

c.downloads.location.prompt = False

c.downloads.location.remember = True

c.downloads.location.suggestion = 'both'

c.downloads.open_dispatcher = None

c.downloads.position = 'bottom'

c.downloads.remove_finished = -1

c.editor.encoding = 'utf-8'

c.fonts.completion.category = '10pt inconsolata SemiBold'

c.fonts.completion.entry = '10pt inconsolata SemiBold'

c.fonts.contextmenu = '8pt Cantarell'

c.fonts.debug_console = '10pt inconsolata SemiBold'

c.fonts.default_family = ['8pt Cantarell', '8pt Blogger Sans']

c.fonts.default_size = '10pt'

c.fonts.downloads = '8pt Cantarell'

c.fonts.hints = '10pt inconsolata SemiBold'

c.fonts.keyhint = '10pt inconsolata SemiBold'

c.fonts.messages.error = '10pt inconsolata SemiBold'

c.fonts.messages.info = '10pt inconsolata SemiBold'

c.fonts.messages.warning = '10pt inconsolata SemiBold'

c.fonts.prompts = '10pt inconsolata SemiBold'

c.fonts.statusbar = '10pt inconsolata SemiBold'

c.fonts.tabs.selected = '10pt inconsolata SemiBold'

c.fonts.tabs.unselected = '10pt inconsolata SemiBold'


c.fonts.web.family.cursive = 'Blogger Sans'

c.fonts.web.family.fantasy = 'Cantarell'

c.fonts.web.family.fixed = 'inconsolata SemiBold'

c.fonts.web.family.sans_serif = 'Blogger Sans'

c.fonts.web.family.serif = 'Cantarell'

c.fonts.web.family.standard = 'Blogger Sans'

c.fonts.web.size.default = 12

c.fonts.web.size.default_fixed = 12

c.fonts.web.size.minimum = 0

c.fonts.web.size.minimum_logical = 6

c.hints.auto_follow = 'unique-match'

c.hints.auto_follow_timeout = 0

c.hints.border = '1px solid gray'

c.hints.chars = 'asdfghjkl'

c.hints.dictionary = '/usr/share/dict/words'

c.hints.find_implementation = 'python'

c.hints.hide_unmatched_rapid_hints = True

c.hints.leave_on_load = True

c.hints.min_chars = 1

c.hints.mode = 'letter'

c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']

c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']

c.hints.scatter = True

c.hints.selectors = {'all': ['a', 'area', 'textarea', 'select', 'input:not([type="hidden"])', 'button', 'frame', 'iframe', 'img', 'link', 'summary', '[onclick]', '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]', '[ng-click]', '[ngClick]', '[data-ng-click]', '[x-ng-click]', '[tabindex]'], 'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'], 'images': ['img'], 'media': ['audio', 'img', 'video'], 'url': ['[src]', '[href]'], 'inputs': ['input[type="text"]', 'input[type="date"]', 'input[type="datetime-local"]', 'input[type="email"]', 'input[type="month"]', 'input[type="number"]', 'input[type="password"]', 'input[type="search"]', 'input[type="tel"]', 'input[type="time"]', 'input[type="url"]', 'input[type="week"]', 'input:not([type])', 'textarea']}

c.hints.uppercase = False

c.history_gap_interval = 30

c.input.escape_quits_reporter = True

c.input.forward_unbound_keys = 'auto'

c.input.insert_mode.auto_enter = True

c.input.insert_mode.auto_leave = True

c.input.insert_mode.auto_load = True

c.input.insert_mode.leave_on_load = True

c.input.insert_mode.plugins = False

c.input.links_included_in_focus_chain = True

c.input.partial_timeout = 5000

c.input.mouse.rocker_gestures = True

c.input.spatial_navigation = False

c.keyhint.blacklist = []

c.keyhint.delay = 500

c.keyhint.radius = 6

c.messages.timeout = 2000

c.new_instance_open_target = 'tab'

c.new_instance_open_target_window = 'last-focused'

c.prompt.filebrowser = True

c.prompt.radius = 8

c.qt.args = []

c.qt.force_platform = None

c.qt.force_platformtheme = None

#   - software-opengl: Tell LibGL to use a software implementation of GL (`LIBGL_ALWAYS_SOFTWARE` / `QT_XCB_FORCE_SOFTWARE_OPENGL`)
#   - qt-quick: Tell Qt Quick to use a software renderer instead of OpenGL. (`QT_QUICK_BACKEND=software`)
#   - chromium: Tell Chromium to disable GPU support and use Skia software rendering instead. (`--disable-gpu`)
#   - none: Don't force software rendering.
c.qt.force_software_rendering = 'qt-quick'

c.qt.highdpi = False

c.qt.low_end_device_mode = 'auto'

c.qt.process_model = 'process-per-site-instance'

c.scrolling.bar = 'always'

c.scrolling.smooth = False

c.search.ignore_case = 'smart'

c.search.incremental = True

c.session.default_name = None

c.session.lazy_restore = False

c.spellcheck.languages = []


c.statusbar.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}

c.statusbar.position = 'top'

#   - url: Current page URL.
#   - scroll: Percentage of the current page position like `10%`.
#   - scroll_raw: Raw percentage of the current page position like `10`.
#   - history: Display an arrow when possible to go back/forward in history.
#   - tabs: Current active tab, e.g. `2`.
#   - keypress: Display pressed keys when composing a vi command.
#   - progress: Progress bar for the current page loading.
c.statusbar.widgets = ['keypress', 'url', 'history', 'tabs', 'progress']

c.tabs.background = True

c.tabs.close_mouse_button = 'none'

c.tabs.close_mouse_button_on_bar = 'new-tab'

c.tabs.favicons.scale = 1.0

c.tabs.favicons.show = 'never'

c.tabs.focus_stack_size = 10

c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 4}

c.tabs.indicator.width = 2

c.tabs.last_close = 'default-page'

c.tabs.max_width = -1

c.tabs.min_width = -1

c.tabs.mode_on_change = 'normal'

c.tabs.mousewheel_switching = False

c.tabs.new_position.related = 'next'

c.tabs.new_position.stacking = True

c.tabs.new_position.unrelated = 'last'

c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}

c.tabs.pinned.frozen = True

c.tabs.pinned.shrink = True

c.tabs.position = 'bottom'

c.tabs.select_on_remove = 'last-used'

#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

c.tabs.show_switching_delay = 1500

c.tabs.tabs_are_windows = False

c.tabs.title.alignment = 'left'

c.tabs.title.format = '{audio}{index}: {current_title}'

c.tabs.title.format_pinned = '{index}'

c.tabs.tooltips = False

c.tabs.undo_stack_size = 30

c.tabs.width = '20%'

c.tabs.wrap = True

c.url.auto_search = 'naive'

c.url.default_page = 'https://start.duckduckgo.com'

c.url.incdec_segments = ['path', 'query']

c.url.open_base_url = False

c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

c.url.start_pages = ['https://start.duckduckgo.com']

c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

c.window.hide_decoration = False

c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'

c.zoom.default = '100%'

c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

c.zoom.mouse_divider = 512

c.zoom.text_only = False

base00 = "#181818"
base01 = "#282828"
base02 = "#383838"
base03 = "#585858"
base04 = "#b8b8b8"
base05 = "#d8d8d8"
base06 = "#e8e8e8"
base07 = "#f8f8f8"
base08 = "#ab4642"
base09 = "#dc9656"
base0A = "#f7ca88"
base0B = "#a1b56c"
base0C = "#86c1b9"
base0D = "#7cafc2"
base0E = "#ba8baf"
base0F = "#a16946"

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base03

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base01

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base0A

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = base0A

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base0A

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = base08

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base0A

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base01

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0E

# Border color of a warning message.
c.colors.messages.warning.border = base0E

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base0A

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base0D

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base03

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0E

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0D

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base03

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base00

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = base0C

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = base07

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = base0B

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = base07

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = base05

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = base00

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = base05

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = base0E

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base00

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = base05

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base00

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = base05

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00


config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('.', 'repeat-command')
config.bind('/', 'set-cmd-text /')
config.bind(':', 'set-cmd-text :')
config.bind('O', 'hint all tab-fg')
config.bind('R', 'reload -f')
config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
config.bind('?', 'set-cmd-text ?')
config.bind('Q', 'tab-close')
config.bind('J', 'back')
config.bind('L', 'tab-next')
config.bind('H', 'tab-prev')
config.bind('K', 'forward')
config.bind('h', 'scroll left')
config.bind('i', 'enter-mode insert')
config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('l', 'scroll right')
config.bind('o', 'set-cmd-text -s :open')
config.bind('u', 'undo')
config.bind('<Escape>', 'leave-mode', mode='hint')
config.bind('<Escape>', 'leave-mode', mode='insert')
config.bind('Y', 'hint links spawn mpv {hint-url}')
config.bind('f', 'hint')
config.bind('q', 'nop')
config.bind('m', 'nop')
config.bind('.', 'nop')
config.bind('p', 'nop')


config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
config.bind('<Escape>', 'leave-mode', mode='prompt')
config.bind('<Return>', 'prompt-accept', mode='prompt')
config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
