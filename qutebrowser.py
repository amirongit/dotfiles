# https://github.com/tinted-theming/base16-qutebrowser
base00 = "#2b2b2b"
base01 = "#323232"
base02 = "#323232"
base03 = "#606366"
base04 = "#a4a3a3"
base05 = "#a9b7c6"
base06 = "#ffc66d"
base07 = "#ffffff"
base08 = "#4eade5"
base09 = "#689757"
base0A = "#bbb529"
base0B = "#6a8759"
base0C = "#629755"
base0D = "#9876aa"
base0E = "#cc7832"
base0F = "#808080"

config.load_autoconfig(False)
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save', 'o': 'open', 'bd': 'tab-close'}
c.auto_save.interval = 15000
c.auto_save.session = True
c.backend = 'webengine'
c.bindings.key_mappings = {'<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}
c.bindings.default = {}
c.changelog_after_upgrade = 'minor'
c.colors.downloads.system.bg = 'rgb'
c.colors.downloads.system.fg = 'rgb'
c.colors.tabs.indicator.system = 'rgb'
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base01
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0A
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base05
c.colors.completion.item.selected.bg = base02
c.colors.completion.item.selected.border.top = base02
c.colors.completion.item.selected.border.bottom = base02
c.colors.completion.item.selected.match.fg = base0B
c.colors.completion.match.fg = base0B
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.contextmenu.disabled.bg = base01
c.colors.contextmenu.disabled.fg = base04
c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg =  base05
c.colors.contextmenu.selected.bg = base02
c.colors.contextmenu.selected.fg = base05
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base00
c.colors.downloads.error.bg = base08
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base02
c.colors.prompts.selected.fg = base05
c.colors.statusbar.normal.fg = base0B
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base00
c.colors.statusbar.insert.bg = base0D
c.colors.statusbar.passthrough.fg = base00
c.colors.statusbar.passthrough.bg = base0C
c.colors.statusbar.private.fg = base00
c.colors.statusbar.private.bg = base01
c.colors.statusbar.command.fg = base05
c.colors.statusbar.command.bg = base00
c.colors.statusbar.command.private.fg = base05
c.colors.statusbar.command.private.bg = base00
c.colors.statusbar.caret.fg = base00
c.colors.statusbar.caret.bg = base0E
c.colors.statusbar.caret.selection.fg = base00
c.colors.statusbar.caret.selection.bg = base0D
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base05
c.colors.statusbar.url.success.http.fg = base0C
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base07
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base07
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base00
c.colors.tabs.pinned.even.fg = base07
c.colors.tabs.pinned.odd.bg = base00
c.colors.tabs.pinned.odd.fg = base07
c.colors.tabs.pinned.selected.even.bg = base07
c.colors.tabs.pinned.selected.even.fg = base00
c.colors.tabs.pinned.selected.odd.bg = base07
c.colors.tabs.pinned.selected.odd.fg = base00
c.colors.tabs.selected.odd.fg = base00
c.colors.tabs.selected.odd.bg = base07
c.colors.tabs.selected.even.fg = base00
c.colors.tabs.selected.even.bg = base07
c.colors.tooltip.bg = base00
c.colors.tooltip.fg = base07
c.colors.webpage.bg = base07
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'smart'
# c.colors.webpage.darkmode.threshold.background = 0
# c.colors.webpage.darkmode.threshold.foreground = 256
c.colors.webpage.preferred_color_scheme = 'dark'
c.completion.cmd_history_max_items = -1
c.completion.delay = 5
c.completion.favorite_paths = []
c.completion.height = '20%'
c.completion.min_chars = 1
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history']
c.completion.quick = True
# c.completion.scrollbar.padding = 2
# c.completion.scrollbar.width = 12
c.completion.show = 'always'
c.completion.shrink = True
c.completion.timestamp_format = '%Y-%m-%dT%H:%M'
c.completion.use_best_match = False
c.completion.web_history.exclude = []
c.completion.web_history.max_items = -1
c.confirm_quit = ['never']
c.content.autoplay = False
## List of URLs to ABP-style adblocking rulesets.  Only used when Brave's
## ABP-style adblocker is used (see `content.blocking.method`).  You can
## find an overview of available lists here:
## https://adblockplus.org/en/subscriptions - note that the special
## `subscribe.adblockplus.org` links aren't handled by qutebrowser, you
## will instead need to find the link to the raw `.txt` file (e.g. by
## extracting it from the `location` parameter of the subscribe URL and
## URL-decoding it).
## Type: List of Url
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt']
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.method = 'auto'
c.content.blocking.whitelist = []
# c.content.cache.appcache = False
# c.content.cache.maximum_pages = -1
# c.content.cache.size = None
c.content.canvas_reading = True
c.content.cookies.accept = 'no-3rdparty'
c.content.cookies.store = True
c.content.default_encoding = 'utf-8'
c.content.desktop_capture = 'ask'
c.content.dns_prefetch = True
# c.content.frame_flattening = False
c.content.fullscreen.overlay_timeout = 3000
c.content.fullscreen.window = False
c.content.geolocation = False
c.content.headers.accept_language = 'en-US,en;q=0.9'
c.content.headers.custom = {}
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
## User agent to send.  The following placeholders are defined:  *
## `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
## The underlying WebKit version (set to a fixed value   with
## QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
## QtWebEngine. * `{qt_version}`: The underlying Qt version. *
## `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
## QtWebEngine. * `{upstream_browser_version}`: The corresponding
## Safari/Chrome version. * `{upstream_browser_version_short}`: The
## corresponding Safari/Chrome   version, but only with its major
## version. * `{qutebrowser_version}`: The currently running qutebrowser
## version.  The default value is equal to the default user agent of
## QtWebKit/QtWebEngine, but with the `QtWebEngine/...` part removed for
## increased compatibility.  Note that the value read from JavaScript is
## always the global value.
## Type: FormatString
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}'
c.content.hyperlink_auditing = False
c.content.images = True
c.content.javascript.alert = True
# c.content.javascript.can_close_tabs = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.clipboard = 'ask'
c.content.javascript.enabled = True
c.content.javascript.legacy_touch_events = 'never'
c.content.javascript.log = {'unknown': 'debug', 'info': 'debug', 'warning': 'debug', 'error': 'debug'}
c.content.javascript.log_message.excludes = {'userscript:_qute_stylesheet': ['*Refused to apply inline style because it violates the following Content Security Policy directive: *']}
c.content.javascript.log_message.levels = {'qute:*': ['error'], 'userscript:GM-*': [], 'userscript:*': ['error']}
c.content.javascript.modal_dialog = False
c.content.javascript.prompt = True
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True
c.content.local_storage = True
c.content.media.audio_capture = 'ask'
c.content.media.audio_video_capture = 'ask'
c.content.media.video_capture = 'ask'
c.content.mouse_lock = False
c.content.mute = False
c.content.netrc_file = None
c.content.notifications.enabled = 'ask'
c.content.notifications.presenter = 'libnotify'
c.content.notifications.show_origin = True
c.content.pdfjs = True
c.content.persistent_storage = 'ask'
c.content.plugins = True
c.content.prefers_reduced_motion = True
c.content.print_element_backgrounds = True
c.content.private_browsing = False
c.content.proxy = 'system'
# c.content.proxy_dns_requests = False
c.content.register_protocol_handler = False
c.content.site_specific_quirks.enabled = True
c.content.site_specific_quirks.skip = []
c.content.tls.certificate_errors = 'ask'
c.content.unknown_url_scheme_policy = 'allow-from-user-interaction'
c.content.user_stylesheets = []
c.content.webgl = True
c.content.webrtc_ip_handling_policy = 'default-public-interface-only'
c.content.xss_auditing = True
c.downloads.location.directory = None
c.downloads.location.prompt = True
c.downloads.location.remember = True
c.downloads.location.suggestion = 'both'
c.downloads.open_dispatcher = None
c.downloads.position = 'bottom'
c.downloads.prevent_mixed_content = True
c.downloads.remove_finished = -1
c.editor.command = ['kitty', 'nvim', '{file}']
c.editor.encoding = 'utf-8'
c.editor.remove_file = True
c.fileselect.folder.command = ['kitty', 'ranger', '--choosedir={}']
c.fileselect.handler = 'default'
c.fileselect.multiple_files.command = ['kitty', 'ranger', '--choosefiles={}']
c.fileselect.single_file.command = ['kitty', 'ranger', '--choosefile={}']
c.fonts.completion.category = 'bold default_size default_family'
c.fonts.completion.entry = 'default_size default_family'
c.fonts.contextmenu = None
c.fonts.debug_console = 'default_size default_family'
c.fonts.default_family = ['Aladin']
c.fonts.default_size = '11pt'
c.fonts.downloads = 'default_size default_family'
c.fonts.hints = 'bold default_size default_family'
c.fonts.keyhint = 'default_size default_family'
c.fonts.messages.error = 'default_size default_family'
c.fonts.messages.info = 'default_size default_family'
c.fonts.messages.warning = 'default_size default_family'
c.fonts.prompts = 'default_size sans-serif'
c.fonts.statusbar = 'default_size default_family'
c.fonts.tabs.selected = 'default_size default_family'
c.fonts.tabs.unselected = 'default_size default_family'
c.fonts.tooltip = 'default_size default_family'
c.fonts.web.family.cursive = 'Aladin'
c.fonts.web.family.fantasy = 'Aladin'
c.fonts.web.family.fixed = 'SpaceMono Nerd Font'
c.fonts.web.family.sans_serif = 'Aladin'
c.fonts.web.family.serif = 'Aladin'
c.fonts.web.family.standard = 'Aladin'
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6
c.hints.auto_follow = 'unique-match'
c.hints.auto_follow_timeout = 0
c.hints.border = '1px solid #8ba4b0'
c.hints.chars = 'asdfghjkl'
c.hints.dictionary = '/usr/share/dict/words'
# c.hints.find_implementation = 'javascript'
c.hints.hide_unmatched_rapid_hints = True
c.hints.leave_on_load = False
c.hints.min_chars = 1
c.hints.mode = 'letter'
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.hints.padding = {'top': 0, 'bottom': 0, 'left': 3, 'right': 3}
c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']
c.hints.radius = 2
c.hints.scatter = True
c.hints.selectors = {'all': ['a', 'area', 'textarea', 'select', 'input:not([type="hidden"])', 'button', 'frame', 'iframe', 'img', 'link', 'summary', '[contenteditable]:not([contenteditable="false"])', '[onclick]', '[onmousedown]', '[role="link"]', '[role="option"]', '[role="button"]', '[role="tab"]', '[role="checkbox"]', '[role="switch"]', '[role="menuitem"]', '[role="menuitemcheckbox"]', '[role="menuitemradio"]', '[role="treeitem"]', '[aria-haspopup]', '[ng-click]', '[ngClick]', '[data-ng-click]', '[x-ng-click]', '[tabindex]:not([tabindex="-1"])'], 'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'], 'images': ['img'], 'media': ['audio', 'img', 'video'], 'url': ['[src]', '[href]'], 'inputs': ['input[type="text"]', 'input[type="date"]', 'input[type="datetime-local"]', 'input[type="email"]', 'input[type="month"]', 'input[type="number"]', 'input[type="password"]', 'input[type="search"]', 'input[type="tel"]', 'input[type="time"]', 'input[type="url"]', 'input[type="week"]', 'input:not([type])', '[contenteditable]:not([contenteditable="false"])', 'textarea']}
c.hints.uppercase = False
c.history_gap_interval = 30
c.input.escape_quits_reporter = True
c.input.forward_unbound_keys = 'auto'
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = False
c.input.insert_mode.leave_on_load = True
c.input.insert_mode.plugins = False
c.input.links_included_in_focus_chain = True
c.input.match_counts = True
c.input.media_keys = False
c.input.mode_override = None
c.input.mouse.back_forward_buttons = False
c.input.mouse.rocker_gestures = False
c.input.partial_timeout = 0
c.input.spatial_navigation = False
c.keyhint.blacklist = []
c.keyhint.delay = 500
c.keyhint.radius = 6
c.logging.level.console = 'info'
c.logging.level.ram = 'debug'
c.messages.timeout = 3000
c.new_instance_open_target = 'tab'
c.new_instance_open_target_window = 'last-focused'
c.prompt.filebrowser = True
c.prompt.radius = 2
c.qt.args = ["disable-features=PermissionElement"]
c.qt.chromium.experimental_web_platform_features = 'never'
c.qt.chromium.low_end_device_mode = 'auto'
c.qt.chromium.process_model = 'process-per-site-instance'
c.qt.chromium.sandboxing = 'enable-all'
c.qt.environ = {}
c.qt.force_platform = None
c.qt.force_platformtheme = 'qt5ct'
c.qt.force_software_rendering = 'none'
c.qt.highdpi = True
c.qt.workarounds.disable_accelerated_2d_canvas = 'auto'
c.qt.workarounds.disable_hangouts_extension = True
c.qt.workarounds.locale = False
c.qt.workarounds.remove_service_workers = False
c.scrolling.bar = 'never'
c.scrolling.smooth = False
c.search.ignore_case = 'smart'
c.search.incremental = True
c.search.wrap = True
c.search.wrap_messages = True
c.session.default_name = None
c.session.lazy_restore = False
c.spellcheck.languages = ['en-US', 'fa-IR']
c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
c.statusbar.position = 'bottom'
c.statusbar.show = 'always'
c.statusbar.widgets = ['keypress', 'history', 'url']
c.tabs.background = True
c.tabs.close_mouse_button = 'none'
c.tabs.close_mouse_button_on_bar = 'ignore'
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'never'
c.tabs.focus_stack_size = -1
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.indicator.width = 3
c.tabs.last_close = 'default-page'
c.tabs.max_width = -1
c.tabs.min_width = -1
c.tabs.mode_on_change = 'normal'
c.tabs.mousewheel_switching = False
c.tabs.new_position.related = 'next'
c.tabs.new_position.stacking = True
c.tabs.new_position.unrelated = 'last'
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.pinned.frozen = True
c.tabs.pinned.shrink = True
c.tabs.position = 'top'
c.tabs.select_on_remove = 'prev'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'center'
c.tabs.title.elide = 'middle'
c.tabs.title.format = '{perc} {current_title} {audio}'
c.tabs.title.format_pinned = '{current_title}'
c.tabs.tooltips = True
c.tabs.undo_stack_size = -1
c.tabs.width = '0%'
c.tabs.wrap = True
c.url.auto_search = 'schemeless'
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.incdec_segments = ['path', 'query']
c.url.open_base_url = False
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'google': 'https://google.com/search?q={}'}
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content', 'utm_name']
c.window.hide_decoration = False
c.window.title_format = '{current_title}'
c.window.transparent = False
c.zoom.default = '100%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
c.zoom.mouse_divider = 512
# c.zoom.text_only = False
config.bind('$', 'move-to-end-of-line', mode='caret')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('/', 'cmd-set-text /')
config.bind(':', 'cmd-set-text :')
config.bind('<Alt-1>', 'tab-focus 1')
config.bind('<Alt-2>', 'tab-focus 2')
config.bind('<Alt-3>', 'tab-focus 3')
config.bind('<Alt-4>', 'tab-focus 4')
config.bind('<Alt-5>', 'tab-focus 5')
config.bind('<Alt-6>', 'tab-focus 6')
config.bind('<Alt-7>', 'tab-focus 7')
config.bind('<Alt-8>', 'tab-focus 8')
config.bind('<Alt-9>', 'tab-focus -1')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
config.bind('<Alt-Y>', 'prompt-yank', mode='prompt')
config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
config.bind('<Down>', 'completion-item-focus --history next', mode='command')
config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
config.bind('<Escape>', 'clear-keychain ;; search ;; jseval -q document.activeElement.blur()')
config.bind('<Escape>', 'mode-leave', mode='caret')
config.bind('<Escape>', 'mode-leave', mode='command')
config.bind('<Escape>', 'mode-leave', mode='hint')
config.bind('<Escape>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
config.bind('<Escape>', 'mode-leave', mode='prompt')
config.bind('<Escape>', 'mode-leave', mode='register')
config.bind('<Escape>', 'mode-leave', mode='yesno')
config.bind('<Return>', 'command-accept', mode='command')
config.bind('<Return>', 'prompt-accept', mode='prompt')
config.bind('<Return>', 'prompt-accept', mode='yesno')
config.bind('<Return>', 'selection-follow')
config.bind('<Return>', 'yank selection', mode='caret')
config.bind('<Shift-Escape>', 'mode-leave', mode='passthrough')
config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Shift-h>', 'tab-prev')
config.bind('<Shift-j>', 'back')
config.bind('<Shift-k>', 'forward')
config.bind('<Shift-l>', 'tab-next')
config.bind('<Tab>', 'completion-item-focus next', mode='command')
config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
config.bind('<Up>', 'completion-item-focus --history prev', mode='command')
config.bind('<Up>', 'completion-item-focus --history prev', mode='command')
config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
config.bind('=', 'zoom')
config.bind('?', 'cmd-set-text ?')
config.bind('F', 'hint all tab')
config.bind('G', 'move-to-end-of-document', mode='caret')
config.bind('H', 'scroll left', mode='caret')
config.bind('J', 'scroll down', mode='caret')
config.bind('K', 'scroll up', mode='caret')
config.bind('L', 'scroll right', mode='caret')
config.bind('N', 'prompt-accept --save no', mode='yesno')
config.bind('V', 'selection-toggle --line', mode='caret')
config.bind('Y', 'prompt-accept --save yes', mode='yesno')
config.bind('Y', 'yank selection -s', mode='caret')
config.bind('b', 'move-to-prev-word', mode='caret')
config.bind('e', 'move-to-end-of-word', mode='caret')
config.bind('f', 'hint')
config.bind('gg', 'move-to-start-of-document', mode='caret')
config.bind('h', 'move-to-prev-char', mode='caret')
config.bind('h', 'scroll left')
config.bind('i', 'mode-enter insert')
config.bind('j', 'move-to-next-line', mode='caret')
config.bind('j', 'scroll down')
config.bind('k', 'move-to-prev-line', mode='caret')
config.bind('k', 'scroll up')
config.bind('l', 'move-to-next-char', mode='caret')
config.bind('l', 'scroll right')
config.bind('n', 'prompt-accept no', mode='yesno')
config.bind('n', 'search-next')
config.bind('N', 'search-prev')
config.bind('o', 'cmd-set-text -s :open')
config.bind('r', 'reload')
config.bind('u', 'undo')
config.bind('v', 'mode-enter caret')
config.bind('v', 'selection-toggle', mode='caret')
config.bind('w', 'move-to-next-word', mode='caret')
config.bind('y', 'prompt-accept yes', mode='yesno')
config.bind('y', 'yank selection', mode='caret')
config.bind('{', 'move-to-end-of-prev-block', mode='caret')
config.bind('|', 'move-to-start-of-line', mode='caret')
config.bind('}', 'move-to-end-of-next-block', mode='caret')
config.bind('.', 'cmd-repeat-last')
