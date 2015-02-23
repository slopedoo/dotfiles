// === SCROLLING ===============================================================
user_pref("general.smoothScroll", true); // boolean enable/disable smooth scrolling
user_pref("general.smoothScroll.lines", true); // boolean enable/disable smooth line scrolling (up/down arrow/page keys)
user_pref("general.smoothScroll.lines.durationMaxMS", 400); // boolean smooth out the start/end of line scrolling operations in ms (up/down arrow/page keys)
user_pref("general.smoothScroll.lines.durationMinMS", 200); // boolean smooth out the start/end of line scrolling operations in ms (up/down arrow/page keys)
user_pref("general.smoothScroll.mouseWheel", true); // boolean enable/disable smooth scrolling with mouse wheel
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 600); // integer smooth out the start/end of scrolling operations in ms
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 400); // integer smooth out the start/end of scrolling operations in ms
user_pref("mousewheel.acceleration.factor", 10); // integer sets acceleration factor if mousewheel.acceleration.start > -1
user_pref("mousewheel.acceleration.start", 0); // integer when to apply mousewheel.acceleration.factor (after how many scroll clicks of mouse wheel)
user_pref("mousewheel.default.delta_multiplier_y", 85); // integer sets the vertical step size
user_pref("mousewheel.min_line_scroll_amount", 5); // integer how many lines to scroll with mouse wheel (approx.)
user_pref("general.smoothScroll.other", true); // boolean enable/disable other smooth scrolling (Home/End keys)
user_pref("general.smoothScroll.other.durationMaxMS", 400); // integer smooth out the start/end of other scrolling operations in ms
user_pref("general.smoothScroll.other.durationMinMS", 200); // integer smooth out the start/end of other scrolling operations in ms
user_pref("general.smoothScroll.pages", true); // boolean enable/disable page smooth scrolling (PgUp/PgDn keys)
user_pref("general.smoothScroll.pages.durationMaxMS", 400); // integer smooth out the start/end of page scrolling operations in ms (PgUp/PgDn keys)
user_pref("general.smoothScroll.pages.durationMinMS", 200); // integer smooth out the start/end of page scrolling operations in ms (PgUp/PgDn keys)
user_pref("layers.offmainthreadcomposition.enabled", true); // test! less stutter in scrolling
