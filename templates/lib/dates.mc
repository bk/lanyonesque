<%!
import datetime
import locale

# This enables localization of the '%c' and '%x' date/datetime formats.
# To turn it on, uncomment the following line -- the default is C locale
# (which effectively is American English).
#
#locale.setlocale(locale.LC_TIME, "")
%>

<%def name="date_format(dt, fmt=None)">\
<%
    if isinstance(dt, str):
        dt = datetime.datetime.fromisoformat(dt)
    is_dt = isinstance(dt, datetime.datetime)  # otherwise datetime.date
    if fmt is None and is_dt:
        fmt = site.datetime_format or None
    if fmt is None:
        fmt = site.date_format or ('%Y-%m-%d %H:%M' if is_dt else '%Y-%m-%d')
    return dt.strftime(fmt)
%>\
</%def>
